%default CF account

-- This script simply gets a row count of the given column family
rows = LOAD 'cassandra://pygmalion/$CF' USING CassandraStorage();
counted = foreach (group rows all) generate COUNT($1);
dump counted;