---
title: "Analytical Databases"
description: "Our list of and information on commercial, open source and cloud based analytical databases, including Teradata, Exadata, Redhift and alternatives to these."
draft-banner: true
date: 2017-10-26 07:30
---
Full stack databases (supporting both storage and query of data) that focus on analytical or OLAP use cases that generally involve large scanning or aggregation operations. Typically support distributed parallel execution of queries (and are therefore commonly referred to as MPP databases) with columnar compression, and often support a range of analytics beyond SQL queries, for example cube based MDX queries, machine learning, graph or geographical analytics. Some technologies also support a level of query federation using external tables (for example over data in Hadoop).  Some technologies run over Hadoop (exploiting HDFS and YARN), but will either use their own proprietary data format or will be positioned as a self contained analytical database.
<!--more-->

## Further Information

The following analyst material covers a number of technologies in this category::

* [Gartner Magic Quadrant & Critical Capabilities for Data Management Solutions for Analytics](https://www.google.co.uk/search?q=gartner+"Data+Management+Solutions+for+Analytics")
* [Forrester Wave: Big Data Warehouse](https://www.google.co.uk/search?q=Forrester+"Big+Data+Warehouse")

See our [Query Engines](/tech-categories/query-engines/) page for details of technologies that support similar capabilities but over external data (e.g. data in HDFS or source databases).

## Commercial Technologies

| IBM Db2 Warehouse (formerly dashDB for Analytics) | IBM Db2 and BLU (in memory) for Docker container supported infrastructure (also available as an appliance and cloud service - see below) - <https://www.ibm.com/aw-en/marketplace/db2-warehouse>
| Teradata Database | MPP database with support for a range of data warehouse and analytics functions; deployable on private or public cloud (also available as an appliance and a cloud service - see below) - <https://www.teradata.com/Products/Database>
| Teradata Analytics Platform | Analytics platform that supports graph, text and IoT analysis plus machine learning (also available as an appliance and a cloud service - see below) -  <https://www.teradata.co.uk/Products/Analytics-Platform>
| Vertica | MPP columnar database with support for a range of analytical functions including machine learning; deployable on commodity infrastructure or public/private cloud - <https://www.vertica.com/overview/>
| Actian Vector | MPP columnar database with support for vectorized execution, small incremental inserts and min-max indices, with a free community edition for databases under 1 Tb - <https://www.actian.com/analytic-database/vector-smp-analytic-database/>
| InfoBrightDB | Columnar database, now sold by Ignite Technologies - <http://www.ignitetech.com/solutions/information-technology/infobrightdb>
| SQream | Columnar GPU accelerated analytical database, available on premise or in the cloud - <https://sqream.com/>

## Open Source Technologies

| [Greenplum](/technologies/greenplum/) | MPP database based on PostgreSQL, with support for multiple storage models and analytical capabilities (including graph); open sourced in October 2015
| MariaDB ColumnStore | Columnar storage for MariaDB (the open source fork of MySQL) based on a fork of InfiniDB - <https://mariadb.com/products/technology/columnstore>
| MariaDB AX | Data warehousing solution based on MariaDB ColumnStore, with commercial support available from MariaDB - <https://mariadb.com/products/solutions/olap-database-ax>
| MonetDB | Open source columnar database - <https://www.monetdb.org/> ; <https://www.monetdbsolutions.com/>
| InifiDB | Open source columnar database, inactive since March 2015 - <https://github.com/infinidb/infinidb>
| AresDB | GPU powered real-time analytics db from Uber - <https://eng.uber.com/aresdb/>
| Apache Pinot (incubating) | Open source realtime distributed OLAP datastore from LinkedIn - <http://pinot.incubator.apache.org/>; <https://github.com/linkedin/pinot>

## Hadoop Based Open Source Technologies

| [Apache Hive](/technologies/apache-hive/) | An analytical database when used with LLAP, ORCFile and Tez; runs over Hadoop
| [Apache Impala](/technologies/apache-impala/) | An analytical database when used with Kudu or Parquet over HDFS; runs over Hadoop
| [Apache HAWQ](/technologies/apache-hawq/) | A port of the Greenplum MPP database (which itself is based on PostgreSQL) to run over Hadoop
| [Apache Tajo](/technologies/apache-tajo/) | Distributed analytical database engine that runs over Hadoop
| Presto | An analytical database when used over Hive/Hadoop , originally created and open sourced by Facebook - <https://prestodb.io/>
| [Druid](/technologies/druid) | OLAP database supporting real time aggregations of streaming data using HDFS/S3 as backing storage

## Hadoop Based Commercial Technologies

| Vertica on Hadoop | Vertica running on Hadoop - <https://www.vertica.com/product/vertica-for-sql-on-hadoop/>
| Actian Vector H | Version of Action Vector that runs as a native YARN app but requires data to be loaded into its proprietary data format - <https://www.actian.com/analytic-database/vectorh-sql-hadoop/>

## Appliances

| Oracle Exadata | An appliance consisting of an Oracle RAC cluster combined with a set of storage nodes via high bandwidth interconnect, with support for hybrid columnar compression - <https://www.oracle.com/engineered-systems/exadata/index.html>
| Microsoft Analytics Platform System | An appliance built around SQL Server Parallel Data Warehouse and PolyBase  - <https://www.microsoft.com/en-us/sql-server/analytics-platform-system>
| IBM Integrated Analytics System | Appliance built around Db2 Warehouse and BLU (in memory) acceleration with support for Spark - <https://www.ibm.com/us-en/marketplace/integrated-analytics-system>
| IBM PureData System for Analytics (formally Netezza) | Appliance utilising FPGA chips to run elements of queries in hardware, with support for a range of languages including R - <https://www.ibm.com/us-en/marketplace/puredata-system-for-analytics#product-header-top>
| Teradata IntelliFlex | Teradata capabilities as an appliance - <https://www.teradata.com/Products/IntelliFlex>
| Teradata IntelliBase | A mixture of Teradata and Hadoop nodes in a single appliance -  <https://www.teradata.com/Products/IntelliBase>
| Pivotal EMC Data Computing Appliance (DCA) | Greenplum appliance - <https://pivotal.io/emc-dca>

## Cloud Services

| Amazon Redshift | A MPP analytical database, with support for columnar storage and the ability to query data in Amazon S3 as external tables (Redshift Spectrum) - <https://aws.amazon.com/redshift/>
| Google BigQuery | Analytical SQL database service, with cost based on storage and query execution - <https://cloud.google.com/bigquery/>
| Azure SQL Data Warehouse | Scalable analytical database, with support for Azure Data Lake Store external tables - <https://azure.microsoft.com/en-us/services/sql-data-warehouse/>
| [Cloudera Altus Data Warehouse](/technologies/cloudera-altus/data-warehouse/) - [Apache Impala](/technologies/apache-impala/) as a cloud managed service over AWS or Azure
| Oracle Exadata Cloud | Oracle Exadata as a managed cloud service (including as an Oracle managed on premises offering) - <https://cloud.oracle.com/database>
| IBM Db2 Warehouse (formerly dashDB for Analytics) | IBM Db2 and BLU (in memory) acceleration as a cloud service - <https://www.ibm.com/us-en/marketplace/db2-warehouse-on-cloud>
| Teradata IntilliCloud | Teradata Database, Hadoop and Aster as a service - <https://www.teradata.com/Products/Cloud/IntelliCloud>
| Snowflake | Data Warehouse for the cloud, with separated compute and storage, columnar storage, vectorized execution, adaptive optimisation (no indexes, keys or tuning required) and support for semi-structured (JSON, Avro and XML) data - <https://www.snowflake.net/>

## Analytical In Memory Technologies

| MemSQL | Distributed in memory relational database, with wire compatibility with MySQL and support for row and columnar storage, and a free community edition - <http://www.memsql.com/>
| SAP HANA | In memory relational DBMS primarily focused on accelerating SAP applications - <https://www.sap.com/products/hana.html>
| EXASOL | In memory MPP database with columnar compression and SQL support - <http://www.exasol.com/>
| MapD | In memory, column store, SQL relational database that runs on GPUs - <https://www.mapd.com/>
| Kinetica | Distributed in memory relational database that runs on GPUs - <https://www.kinetica.com>

## Analytical Graph Databases

| DataStax Enterprise | Commercial product built on Apache Cassandra with the addition of graph and search capabilities - <https://www.datastax.com/>
| TigerGraph | Commercial hybrid OLTP/OLAP graph database that claims order of magnitude performance and scalability improvements over it's competitors; previously known as GraphSQL - <http://www.tigergraph.com>, <http://www.zdnet.com/article/tigergraph-a-graph-database-born-to-roar/>
| AnzoGraph | Massively parallel distributed graph database built for analytics - <https://www.cambridgesemantics.com/product/anzograph/>
| GraphBase | Commercial graph database designed for use in AI applications - <https://graphbase.ai/>
| JanusGraph | Open source distributed graph database that runs over a number of storage backends (including Cassandra, HBase and BigTable), with TinkerPop support including support for graph analytics; previously known as Titan - <http://janusgraph.org/>
| TinkerGraph | In memory graph databases that's part of TinkerPop as a reference implementation - <http://tinkerpop.apache.org>
| GRAKN.AI | Open Source graph database designed for AI use cases that also supports graph analytics - <https://grakn.ai>
| Complexible Stardog | RDF database that also support property graphs and data virtualisation, with a community edition available - <http://www.stardog.com/>
| Trovares xGT | Massively parallel analytical in memory graph database from Cray alumni - <https://trovares.com/>