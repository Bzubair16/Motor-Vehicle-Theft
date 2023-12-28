SELECT *
FROM stolen_vehicles;

# Cleaning the data by removing empty rows in the dataset
# DELETED THE NULL VALUES IN STOLEN VEHICLES TABLE
DELETE
FROM stolen_vehicles
WHERE vehicle_id IS NULL
OR
vehicle_type IS NULL
OR
make_id IS NULL
OR
model_year IS NULL
OR
vehicle_desc IS NULL
OR
color IS NULL
OR
date_stolen IS NULL
OR
location_id IS NULL;


# DAY OF WEEK VEHICLES ARE MOST OFTEN STOLEN
SELECT DAYNAME(date_stolen) AS day_of_week, 
       COUNT(vehicle_id) AS no_of_vehicles_stole
FROM stolen_vehicles
GROUP BY day_of_week
ORDER BY no_of_vehicles_stole DESC
LIMIT 1;
# Monday is the day that vehicles were most stolen  759 times 


# DAY OF WEEK VEHICLES ARE LEAST OFTEN STOLEN
SELECT DAYNAME(date_stolen) AS day_of_week, 
       COUNT(vehicle_id) AS no_of_vehicles_stole
FROM stolen_vehicles
GROUP BY day_of_week
ORDER BY no_of_vehicles_stole ASC
LIMIT 1;
# Saturday is the day that vehicles are least stolen  574 times


# TYPE OF VEHICLES MOST OFTEN STOLEN
SELECT COUNT(vehicle_type) AS no_stolen, 
             vehicle_type
FROM stolen_vehicles
GROUP BY vehicle_type
ORDER BY no_stolen DESC
LIMIT 1;
# Stationwagon is the most stolen vehicle which was stolen  944 times

# TYPE OF VEHICLES LEAST OFTEN STOLEN
SELECT COUNT(vehicle_type) AS no_stolen, vehicle_type
FROM stolen_vehicles
WHERE vehicle_type IS NOT NULL
GROUP BY vehicle_type
ORDER BY no_stolen ASC
LIMIT 2;
# Special Purpose Vehicle and Articulated Truck are only stolen once


# TYPE OF VEHICLES MOST OFTEN STOLEN BY REGION
SELECT COUNT(vehicle_type) AS no_stolen,
             region,
	          vehicle_type
FROM  locations l
JOIN  stolen_vehicles s
ON l.location_id = s.location_id
GROUP BY vehicle_type, region
ORDER BY no_stolen DESC;
# Saloon car is the most stolen at Auckland region which was stolen 326 times


# TYPE OF VEHICLES LEAST OFTEN STOLEN BY REGION
SELECT COUNT(vehicle_type) AS no_stolen,
             region,
             vehicle_type
FROM locations l
JOIN stolen_vehicles s
ON l.location_id = s.location_id
WHERE vehicle_type IS NOT NULL
GROUP BY vehicle_type, region
ORDER BY no_stolen ASC;


# AVERAGE AGE OF THE VEHICLES STOLEN
SELECT YEAR(CURRENT_DATE())- ROUND(AVG(model_year)) AS avg_age_of_vehicles_stolen
FROM stolen_vehicles;
# The average year of vehicles stolen is 18 years


# AVERAGE AGE OF VEHICLES STOLEN VARYING BY CAR
SELECT YEAR(CURRENT_DATE())- ROUND(AVG(model_year)) AS avg_age_of_vehicles_stolen, 
			vehicle_type
FROM stolen_vehicles
GROUP BY vehicle_type;


# REGION WITH THE MOST STOLEN VEHICLES
SELECT count(region) as no_of_vehicles_stolen,
			region
FROM locations l
JOIN stolen_vehicles s
ON l.location_id = s.location_id
GROUP BY region
ORDER BY no_of_vehicles_stolen DESC
LIMIT 1;
# Auckland is the region with most stolen vehicle, vehicles are stolen 1620 times and it is the region with the highest population among all regions recorded in the dataset


# REGION WITH THE LEAST STOLEN VEHICLES
SELECT count(region) as no_of_vehicles_stolen,
			region
FROM locations l
JOIN stolen_vehicles s
ON l.location_id = s.location_id
GROUP BY region
ORDER BY no_of_vehicles_stolen ASC
LIMIT 1;
# Southland is the region with the lowest record of vehicles stolen, vehicles are stolen only 26 times


# CHARACTERISTICS OF THE REGION WITH THE MOST STOLEN VEHICLES
SELECT count(region) as no_of_vehicles_stolen,
			region,
            population,
            density
FROM locations l
JOIN stolen_vehicles s
ON l.location_id = s.location_id
GROUP BY region
ORDER BY no_of_vehicles_stolen DESC
LIMIT 1;
# Auckland is the region with the highest number of vehicles stolen and it has the biggest population and density


SELECT region, population, density 
FROM locations
ORDER BY population DESC;
# The list of region with the population and density in descending order


# CHARACTERISTICS OF THE REGION WITH THE LEAST STOLEN VEHICLES
SELECT count(region) as no_of_vehicles_stolen,
			region,
            population,
            density
FROM locations l
JOIN stolen_vehicles s
ON l.location_id = s.location_id
GROUP BY region
ORDER BY no_of_vehicles_stolen ASC
LIMIT 1;
# Southland is the region with the least record of vehicles stolen with the population of 102,400 and density of 3.28  

















