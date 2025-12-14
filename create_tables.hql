--Drops existing database
DROP DATABASE IF EXISTS flights CASCADE;

--Creates new database 
CREATE DATABASE IF NOT EXISTS flights;

--Use database
USE flights;

--Creates flights_sqoop_raw external table  link: '/user/demo/flights/sqoop_data/'
CREATE EXTERNAL TABLE IF NOT EXISTS flights_sqoop_raw (
    year SMALLINT,
    month TINYINT,
    carrier STRING,
    carrier_name STRING,
    airport STRING,
    airport_name STRING,
    arr_flights INT,
    arr_del15 INT,
    carrier_ct FLOAT,
    weather_ct FLOAT,
    nas_ct FLOAT,
    security_ct FLOAT,
    late_aircraft_ct FLOAT,
    arr_cancelled INT,
    arr_diverted INT,
    arr_delay DECIMAL(10,2),
    carrier_delay DECIMAL(10,2),
    weather_delay DECIMAL(10,2),
    nas_delay DECIMAL(10,2),
    security_delay DECIMAL(10,2),
    late_aircraft_delay DECIMAL(10,2)
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'=',',
  'serialization.format'=','
)
LOCATION '/user/demo/flights/sqoop_data/'
TBLPROPERTIES (
  'skip.header.line.count'='1'
);

--Get metadata of table
DESCRIBE flights_sqoop_raw;

--Get count of table
SELECT COUNT(*) FROM flights_sqoop_raw;

--Get data of table
SELECT * FROM flights_sqoop_raw LIMIT 5;

--Creates flights_flume_raw external table  link: '/user/demo/flights/flume_data/'
CREATE EXTERNAL TABLE IF NOT EXISTS flights_flume_raw (
        year SMALLINT,
    month TINYINT,
    carrier STRING,
    carrier_name STRING,
    airport STRING,
    airport_name STRING,
    arr_flights INT,
    arr_del15 INT,
    carrier_ct FLOAT,
    weather_ct FLOAT,
    nas_ct FLOAT,
    security_ct FLOAT,
    late_aircraft_ct FLOAT,
    arr_cancelled INT,
    arr_diverted INT,
    arr_delay DECIMAL(10,2),
    carrier_delay DECIMAL(10,2),
    weather_delay DECIMAL(10,2),
    nas_delay DECIMAL(10,2),
    security_delay DECIMAL(10,2),
    late_aircraft_delay DECIMAL(10,2)
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'=',',
  'serialization.format'=','
)
LOCATION '/user/demo/flights/flume_data/'
TBLPROPERTIES (
  'skip.header.line.count'='1'
);

--Get metadata of table
DESCRIBE flights_flume_raw;

--Get count of table
SELECT COUNT(*) FROM flights_flume_raw;

--Get data of table
SELECT * FROM flights_flume_raw LIMIT 5;
