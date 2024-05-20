# StarBench

StarBench is an evolution of SSB the Star Schema benchmark (https://www.cs.umb.edu/~poneil/StarSchemaB.PDF) created by Pat O’Neil and his team to test specific Star Schema features such as the “slowly changing dimension”.  We followed the same idea as SSB in the sense that the SSB2 schema is based on TPC-H: ORDERS and LINEITEM are joined into the LINEORDER fact table and PART, SUPPLIER and CUSTOMER become dimensions. But, unlike in SSB we did not drop the PARTSUPP table – instead we merged the useful PARTSUPP information linking part availability and cost from suppliers into the PART table. SSB also included a time dimension and we did not need.  Note that while at Teradata we used SSB for the PPI Wizard testing.
Another substantial difference between SSB and SSB2 is the queries. While the SSB designers SSB were limited in their query set due to the lack of availability of PARTSUPP information we have rewritten all the 22 TPC-H queries to produce exactly the same results on SSB2 as the original TPC-H queries on a TPC-H schema.

How to run the StarBench


1. Generate the data for the tpch for a representative scale factor.
  To generate the scale factor do the following steps.
a. clone the repostory at https://github.com/electrum/tpch-dbgen.
b. run the make to compile the code which produces qgen and dbgen. (make )
c. dbgen -s SF -r. this step produces *.tbl files (please note the location of these files).

2. Clone the repository of the StarBench.
3. change the location of the data in load.sql of corresponding database locations.
   This repository has following directories
   mysql
      tpch
      ssb
      scripts
   tidb
      tpch
      ssb
      scripts
    pg
      tpch
      ssb
      scripts
   
   To run the StarBench for a particular database one needs to submit the following command.
   ```shell
   ./run.sh pg (for postgres, mysql for mysql and tidb for tidb).
   ```
   

   This assumes that the postgres | mysql | tidb is installed on the machine.
   there is an optional parameter -l which loads the data based on the location provided
   ./run.sh pg -l (loads the data and runs the queries in ssb and tpch and compares the results).



