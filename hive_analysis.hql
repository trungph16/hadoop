use flights;

--Phân tích tỷ lệ trễ chuyến theo từng hãng bay
INSERT OVERWRITE DIRECTORY '/user/demo/flights/hive_output/'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
SELECT carrier,
       carrier_name,
       AVG(arr_delay) AS avg_arrival_delay
FROM flights_sqoop_raw
WHERE year is not null
GROUP BY carrier, carrier_name
ORDER BY avg_arrival_delay DESC;

--Phân tích nguyên nhân delay lớn nhất
INSERT OVERWRITE DIRECTORY '/user/demo/flights/hive_output/'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
SELECT
    carrier,
    carrier_name,
    SUM(weather_ct) AS total_weather_delay,
    SUM(carrier_ct) AS total_carrier_delay,
    SUM(nas_ct) AS total_nas_delay
FROM flights_sqoop_raw
WHERE month is not null
GROUP BY carrier, carrier_name;

--Top 5 chặng bay có độ trễ cao nhất
INSERT OVERWRITE DIRECTORY '/user/demo/flights/hive_output/'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
SELECT origin, dest, AVG(arr_delay) AS avg_delay
FROM flights_sqoop_raw
WHERE year != 'year'
GROUP BY origin, dest
ORDER BY avg_delay DESC
LIMIT 5;

