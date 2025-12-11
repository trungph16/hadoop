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
    carrier_ct INT,
    weather_ct INT,
    nas_ct INT,
    security_ct INT,
    late_aircraft_ct INT,
    arr_cancelled INT,
    arr_diverted INT,
    arr_delay DECIMAL(10,2),
    carrier_delay DECIMAL(10,2),
    weather_delay DECIMAL(10,2),
    nas_delay DECIMAL(10,2),
    security_delay DECIMAL(10,2),
    late_aircraft_delay DECIMAL(10,2)
)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n' 
LOCATION '/user/demo/flights/sqoop_data/';

--Get metadata of table
DESCRIBE flights_sqoop_raw;

--Get count of table
SELECT COUNT(*) FROM flights_sqoop_raw;

--Get data of table
SELECT * FROM flights_sqoop_raw LIMIT 5

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
    carrier_ct INT,
    weather_ct INT,
    nas_ct INT,
    security_ct INT,
    late_aircraft_ct INT,
    arr_cancelled INT,
    arr_diverted INT,
    arr_delay DECIMAL(10,2),
    carrier_delay DECIMAL(10,2),
    weather_delay DECIMAL(10,2),
    nas_delay DECIMAL(10,2),
    security_delay DECIMAL(10,2),
    late_aircraft_delay DECIMAL(10,2)
)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n' 
LOCATION '/user/demo/flights/flume_data/';

--Get metadata of table
DESCRIBE flights_flume_raw;

--Get count of table
SELECT COUNT(*) FROM flights_flume_raw;

--Get data of table
SELECT * FROM flights_flume_raw LIMIT 5
