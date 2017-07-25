# https://github.com/jekyll/jekyll/blob/master/lib/jekyll/site.rb
# https://github.com/jekyll/jekyll/blob/master/lib/jekyll/page.rb
# https://github.com/jekyll/jekyll/blob/master/lib/jekyll/collection.rb
# https://github.com/jekyll/jekyll/blob/master/lib/jekyll/document.rb
# https://github.com/jekyll/jekyll/blob/master/lib/jekyll.rb

# https://github.com/pry/pry
# cd / ls
# show-method / show-doc

require 'pry'

module OnDataEngineering
  class Generator < Jekyll::Generator

    # Function to convert a document title and url to a standard HTML href
    # Params
    #   title - (string) the title of the document
    #   url - (string) the url to the document
    # Returns
    #   (string) the generated HTML href tag
    def create_href(title, url)
      return "<a href=\"" + url + "\">" + title + "</a>"
    end
    
    # Function to create a Hash of titles and alt-titles to documents in the main jeyll site variable
    # Params
    #   site - the Jekyll root site object as passed to generate().  Has the generated Hash added to the Jekyll site object
    #   coll - (string) the name of the collection to process.  Also used as the name of the hash to output to the Jekyll site variable.
    # Returns
    #   the generated Hash, with the title/alt-title as the key and the data being a Hash containing
    #     raw - the original title/alt-title
    #     title - the title of the document (will match raw for title entries)
    #     doc - the Jekyll document object
    #     href - an HTML href tag to the document with the document title as the label
    def create_doc_lookups(site, coll)
      lookup = Hash.new
      site.collections[coll].docs.each do |doc|
        title = doc.data["title"]
        lookup[title] = { "raw" => title, "title" => title, "doc" => doc, "href" => create_href(title, doc.url) }
        if doc.data["alt-titles"]
          doc.data["alt-titles"].each do |alttitle|
            lookup[alttitle] = { "raw" => alttitle, "title" => title, "doc" => doc, "href" => create_href(title, doc.url) }
          end
        end
      end
      site.site_payload["site"][coll] = lookup
      return lookup
    end

    # Function to take an array of titles/alt-titles in a document and resolve them to documents
    # Params
    #   doc - the Jekyll document to process. Has an x_<var> variable added - a list of Hash objects containing
    #     raw - the original title/alt-title from the input array
    #     title - the title of the resolved document
    #     doc - the document (not present if title/alt-title can't be resolved)
    #     href - an HTML href tag to link to the document
    #   var - (string) the name of the Jekyll variable containing the array of titles/alt-titles to resolve to documents
    #   lookup - a Hash mapping titles/alt-titles to documents
    # Returns
    #   nothing
    def resolve_names(doc, var, lookup)
      return unless doc.data[var]
      doc.data["x_"+var] = doc.data[var].map { |name| lookup[name] || { "raw" => name, "title" => name, "href" => name }} 
    end

    # Function to add a technology relationship to a document
    # Params
    #   doc - the Jekyll document to add the tech relationship to
    #   reltype - (string) the type of relationship to add
    #   target - the info hash of the document that's the target of the tech relationship
    # Returns
    #   nothing
    def add_tech_rel(doc, reltype, target)
      doc.data["x_tech_rels"] = Hash.new unless doc.data["x_tech_rels"]
      doc.data["x_tech_rels"][reltype] = [] unless doc.data["x_tech_rels"][reltype]
      doc.data["x_tech_rels"][reltype] << target
    end
    
    # Function to process the technology relationships for a document
    # Params
    #   doc - the Jekyll document to process
    #   site - the Jekyll root site object as passed to generate()
    #   techs - the lookup of titles/alt-titles to technologies
    # Returns
    #   nothing
    # Side effects
    #   Calls add_tech_rel for every reltype and target document pair in doc, as well as for the reverse relationship from the target to the doc
    def resolve_tech_rels(doc, site, techs)
      
      tech_rels = doc.data["tech-relationships"]
      return unless tech_rels  # Do nothing if there are no tech rels specified

      raise "ERR" unless tech_rels.is_a?(Array)  # Check tech rels is an array
      
      tech_rels = [tech_rels] unless tech_rels[0].is_a?(Array)  # If tech rels is a one dimensional array, turn into a two dimensional
      
      tech_rels.each do |rel|
        raise "ERR" if rel.size < 2  # Each set of tech rels must be a tech rel type and at least one tech

        reltype = site.data["shared"]["tech_rel_types"][rel[0]] # Lookup tech rel type object (title, reverse-title)
        raise "ERR" unless reltype # tech rel type must be valid  

        rel[1..-1].each do |name|
          tech = techs[name] ||  { "raw" => name, "title" => name, "href" => name }
          add_tech_rel(doc, reltype["title"], tech)
          add_tech_rel(tech["doc"], reltype["reverse-title"], techs[doc.data["title"]]) if tech["doc"]
        end
      end

    end

    def error(doc, msg, var, value)
      puts "#{doc.data["title"]}: #{msg}: #{var}"
    end

    def validate_not_null(doc, var)
      error(doc, "Attribute not set", var, "") unless doc.data[var]
    end

    def validate_value(doc, var, valid_list)
      error(doc, "Invalid value", var, doc.data[var]) unless valid_list.include?(doc.data[var])
    end

    def generate(site)

      # Generate maps for tech-vendor, tech-category and technology titles/alt-titles to documents
      vendors = create_doc_lookups(site, "tech-vendors")
      techs = create_doc_lookups(site, "technologies")
      categories = create_doc_lookups(site, "tech-categories")
      
      # Process technology pages
      site.collections["technologies"].docs.each do |doc|
        resolve_names(doc, "vendors", vendors)
        resolve_names(doc, "categories", categories)
        resolve_tech_rels(doc, site, techs)
        validate_not_null(doc, "description")
        validate_not_null(doc, "type")
        validate_value(doc, "type", site.data["shared"]["tech_types"].keys)
        validate_not_null(doc, "date")
        validate_not_null(doc, "version") unless doc.data["type"] == "Sub-Project"
      end

      #d = techs["Hadoop"]
      #binding.pry

    end
  end
end