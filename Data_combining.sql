--Data Combining
DROP TABLE IF EXISTS `bike_data.combined_data` ;

--combining all 12 months of data from Jan 2022 to Dec 2022

CREATE TABLE IF NOT EXISTS `bike_data.combined_data` AS (
  SELECT * FROM `bike_data.May_2022`
  UNION ALL
  SELECT * FROM `bike_data.June_2022`
  UNION ALL
  SELECT * FROM `bike_data.July_2022`
  UNION ALL
  SELECT * FROM `bike_data.August_2022`
  UNION ALL
  SELECT * FROM `bike_data.September_2022`
  UNION ALL
  SELECT * FROM `bike_data.October_2022`
  UNION ALL
  SELECT * FROM `bike_data.November_2022`
  UNION ALL
  SELECT * FROM `bike_data.December_2022`
  UNION ALL
  SELECT * FROM `bike_data.January_2022`
  UNION ALL
  SELECT * FROM `bike_data.February_2022`
  UNION ALL
  SELECT * FROM `bike_data.March_2022`
  UNION ALL
  SELECT * FROM `bike_data.April_2022`
);
