use flights;

--Thống kê số chuyến bay theo từng hãng
INSERT OVERWRITE DIRECTORY '/user/demo/flights/hive_output/output_1/'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
SELECT carrier, carrier, COUNT(*) AS total_flights
FROM flights_sqoop_raw
WHERE month is not null 
GROUP BY carrier, carrier_name;

--Tính tỷ lệ delay theo từng hãng
INSERT OVERWRITE DIRECTORY '/user/demo/flights/hive_output/output_2/'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
SELECT 
    carrier, carrier_name,
    SUM(arr_del15) AS delayed_flights,
    SUM(arr_flights) AS total_flights,
    (SUM(arr_del15) / SUM(arr_flights)) * 100 AS delay_rate_percent
FROM flights_sqoop_raw
WHERE month is not null
GROUP BY carrier, carrier_name
ORDER BY delay_rate_percent DESC;

--Tìm top 5 sân bay có tổng phút delay cao nhất
INSERT OVERWRITE DIRECTORY '/user/demo/flights/hive_output/out_put_3/'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
SELECT 
    airport, airport_name,
    SUM(arr_delay) AS total_arrival_delay_minutes
FROM flights_sqoop_raw
WHERE month is not null 
GROUP BY airport, airport_name
ORDER BY total_arrival_delay_minutes DESC
LIMIT 5;

--Phân tích nguyên nhân delay theo từng hãng
INSERT OVERWRITE DIRECTORY '/user/demo/flights/hive_output/output_4/'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
SELECT 
    carrier, carrier_name,
    SUM(weather_delay) AS weather_delay_min,
    SUM(carrier_delay) AS carrier_delay_min,
    SUM(nas_delay) AS nas_delay_min,
    SUM(security_delay) AS security_delay_min,
    SUM(late_aircraft_delay) AS late_aircraft_delay_min,
    (SUM(weather_delay) 
     + SUM(carrier_delay) 
     + SUM(nas_delay) 
     + SUM(security_delay) 
     + SUM(late_aircraft_delay)) AS total_delay_min
FROM flights_sqoop_raw
WHERE month is not null
GROUP BY carrier, carrier_name
ORDER BY total_delay_min DESC;

