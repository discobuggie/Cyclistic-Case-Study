# demo-repo
# Introduction
This is an analysis for case study 1 from the Google Data Analytics Certificate (Cyclistic).  I will perform many real-world tasks of a junior data analyst at a fictional company, Cyclistic. To address key business tasks, I will follow the steps of the data analysis process: Ask, Prepare, Process, Analyze, Share, and Act
# Shortcuts
Data Source: [Divvy](https://divvy-tripdata.s3.amazonaws.com/index.html) 

Data Visualization: (tableau link here)
# Background 
<h3> About Cyclistic </h3> 

Cyclistic is a bike-share program with an extensive fleet of over 5,800 bicycles and 600 docking stations. What sets Cyclistic apart is its commitment to inclusivity, offering reclining bikes, hand tricycles, and cargo bikes, catering to individuals with disabilities and those who cannot use standard two-wheeled bikes. While the majority of riders prefer traditional bikes, approximately 8% utilize the assistive options. Cyclistic users often use the bikes for leisurely rides, while around 30% rely on them for their daily work commute.

Up until this point, Cyclistic's marketing approach focused on creating widespread awareness and attracting a wide range of consumers. A key factor enabling this strategy was the flexibility of its pricing plans, which offered single-ride passes, full-day passes, and annual memberships. Customers who opt for single-ride or full-day passes are known as casual riders, while those who choose annual memberships become Cyclistic members.

As per the findings of Cyclistic's finance analysts, annual members prove to be significantly more profitable than casual riders. While the pricing flexibility aids in attracting a broader customer base, Moreno, the fictional director of marketing and my fictional manager, emphasizes that maximizing the number of annual members will be pivotal for future growth. Instead of focusing solely on new customers, Moreno believes there is a great opportunity to convert casual riders into members, considering their existing awareness of the Cyclistic program and their active choice of Cyclistic for their mobility requirements.

With a clear objective in mind, Moreno has tasked the marketing analyst team with devising strategies to convert casual riders into annual members. To achieve this goal, they must gain a deeper understanding of the distinctions between annual members and casual riders, explore the motivations behind casual riders purchasing a membership, and assess the potential impact of digital media on their marketing approaches. To uncover valuable insights, Moreno and her team plan to analyze Cyclistic's historical bike trip data, seeking trends and patterns that can guide their marketing decisions.

<h3>Scenario</h3>
As a junior data analyst on the marketing team at Cyclistic, a bike-share company in Chicago, I am tasked with a crucial mission: to help maximize the number of annual memberships, which the director of marketing sees as vital for the company's future success. To achieve this, my team and I aim to uncover the distinctions in how casual riders and annual members utilize Cyclistic bikes. Armed with these valuable insights, we will craft a targeted marketing strategy to convert casual riders into loyal annual members. However, before implementing our recommendations, we understand the need to present compelling data insights and professional data visualizations to gain approval from Cyclistic executives.

# Ask
<h3>Business Task and Objectives</h3> 

Analyze Cyclistic historical bike data to identify casual riders and annual members usage patterns in order to design a new marketing strategy to convert riders into annual members.

<h3>Analysis Questions</h3>
1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digital media to influence casual riders to become members?

# Prepare

<h3>Data Source</h3>

For this casestudy I have used Cyclistic’s historical trip data from Jan 2022 to Dec 2022 to analyze and identify trends. 

This is public data that can be used to explore how different customer types are using Cyclistic bikes. But note that data-privacy issues prohibit from using riders’ personally identifiable information. This means that I am unable to connect pass purchases to credit card numbers to determine if casual riders live in the Cyclistic service area or if they have purchased multiple single passes.

<h3>Data Organization</h3>

The data is divided into 12 files, each following the naming convention of "YYYYMM-divvy-tripdata." These files encompass information for individual months, including ride ID, bike type, start time, end time, start station, end station, start location, end location, and rider membership status (member or casual). The corresponding column names are ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, and member_casual.

# Process
For combining and cleaning the various datasets, BigQuery is the chosen platform. This decision stems from Microsoft Excel's limitation of handling only 1,048,576 rows, making it unsuitable for the Cyclistic dataset, which contains over 5.6 million rows. BigQuery's capacity to handle vast amounts of data makes it the ideal choice for this task.

<h3>Data Combination</h3>

SQL Query: (insert link).  
A dataset named '2022_tripdata' holds 12 CSV files, each uploaded as a separate table. Additionally, a table called "combined_data" is generated, consolidating 5,667,717 rows of data spanning the entire year.

<h3>Data Exploration</h3>

SQL Query: (insert link).  
Reviewing the data to identify and understand any inconsistencies present.

Findings and Observations:

&nbsp; 1. Below is a table displaying all column names along with their respective data types. The ride_id column serves as the primary key.  
&nbsp;&nbsp;&nbsp;&nbsp;<img width="414" alt="column names nad data types" src="https://github.com/discobuggie/demo-repo/assets/108239917/6c4affe4-9585-42cc-bb3a-35fa73bb616e">

&nbsp; 2. The number of **null values** in each column.  
&nbsp;&nbsp;&nbsp;&nbsp;<img width="1340" alt="Null Values" src="https://github.com/discobuggie/demo-repo/assets/108239917/18b43aae-9bfb-481d-9f52-5486aba1bcfa">


&nbsp; 3. ride_id has no null values, and there are no duplicate rows present in the data.

&nbsp; 4.  All ride_id values have a length of 16. The column is already in a consistent and uniform format, with all values being 16 characters long. If the ride_id column follows a standardized pattern and there are no discrepancies or missing values, there would be no need to clean it further.


&nbsp; 5. The dataset contains three distinct types of bikes (**rideable_type**).  
&nbsp;&nbsp;&nbsp;&nbsp; <img width="384" alt="unique bike types" src="https://github.com/discobuggie/demo-repo/assets/108239917/11a1fdef-faa2-4402-9177-1a2dfe5bb7da">

&nbsp; 6.  The "started_at" and "ended_at" columns display the trip's start and end times in the format YYYY-MM-DD hh:mm:ss UTC. By calculating a new column called "ride_length," we can determine the total duration of each trip. However, we should remove 5360 trips with a duration longer than a day and 122283 trips with durations less than a minute or end times earlier than start times. Additionally, the "day_of_week" and "month" columns offer valuable insights for analyzing trips at different times throughout the year.

&nbsp; 7. A total of 833,064 rows have missing values for both "start_station_name" and "start_station_id," which must be removed from the dataset.

&nbsp; 8. A total of 892,742 rows have missing values for both "end_station_name" and "end_station_id," which should be removed from the dataset.

&nbsp; 9. A total of 5,858 rows have missing values for both "end_lat" and "end_lng," which should be removed from the dataset.

&nbsp; 10. The "member_casual" column contains two unique values: "member" and "casual rider."  
&nbsp;&nbsp;&nbsp;&nbsp; <img width="382" alt="unique user types" src="https://github.com/discobuggie/demo-repo/assets/108239917/939ed100-d108-4b3a-b0a6-a513fa5f1168">

&nbsp; 11. The columns "start_station_id" and "end_station_id" will be removed from the analysis as they do not contribute to solving our current problem. However, the longitude and latitude location columns can be kept for potential use in visualizing a map.

<h3>Data Cleaning</h3>

SQL Query: (insert link here)

The data cleaning process involves the following steps:

&nbsp;&nbsp;&nbsp;&nbsp; 1. Deleting all rows with missing values.  
&nbsp;&nbsp;&nbsp;&nbsp; 2. Adding three new columns: "ride_length" for trip duration, "day_of_week," and "month."  
&nbsp;&nbsp;&nbsp;&nbsp; 3. Excluding trips with durations less than a minute and longer than a day.  
&nbsp;&nbsp;&nbsp;&nbsp; 4. As a result of these steps, a total of 1,375,912 rows are removed from the dataset.

## Analyze and Share

SQL Query: (insert link here)  
Data Visualization: (insert tableau here)

The data has been appropriately stored and prepared for analysis. Multiple relevant tables were queried, and the findings were visualized using Tableau. The primary analysis question is to understand the differences in how annual members and casual riders utilize Cyclistic bikes.

To begin, we compare member and casual riders based on the type of bikes they use. ![Bike types used in 2022 png](https://github.com/discobuggie/demo-repo/assets/108239917/654ec631-3f32-4404-9dc6-1aed1630038a)  
**Conclusion**: Out of the total riders, members constitute 59.7%, while casual riders make up the remaining 40.3%. Each bike type chart presents the percentage distribution based on the total riders. The classic bike is the most commonly used, followed by the electric bike. Docked bikes are least utilized and are exclusively preferred by casual riders.

Additionally, we will also look at a summary of the total trip count to gain insights into their riding habits. This comprehensive examination will enable us to explore and dissect the distribution of trips concerning the months, days of the week, and hours of the day.  
![Total Trip Count Summary in 2022](https://github.com/discobuggie/demo-repo/assets/108239917/309c9d03-5191-40c8-93fb-4d88f1a58fc5)![Total Trips Per Month 2022](https://github.com/discobuggie/demo-repo/assets/108239917/9fdf6e0b-53a8-4156-81f6-a079f115a67a)![trips per day of week 2022](https://github.com/discobuggie/demo-repo/assets/108239917/c6853a07-9164-4871-ab71-23d803cc7120)![Total Trips Per Hour in 2022](https://github.com/discobuggie/demo-repo/assets/108239917/85df8112-253a-4905-9e3c-919ef00740dc)  
**Monthly Trips**: Both casual riders and members demonstrate similar patterns, with more trips occurring in the spring and summer months and fewer in the winter. The gap between casual riders and members is smallest during July, in the summer season.  
**Days Of Week**: Casual riders tend to take more journeys on weekends, while members show a decline in trips over the weekend compared to other weekdays.  
**Hourly**: Members exhibit two peaks in trip numbers: one early in the morning from around 6 am to 8 am and another in the evening from around 4 pm to 8 pm. On the other hand, casual riders' trip count consistently increases throughout the day until the evening and then decreases.  
**Conclusion**: Members predominantly use bikes for weekday commuting to and from work, whereas casual riders utilize bikes throughout the day, particularly more frequently during weekends for leisure purposes. Both groups exhibit heightened activity during the summer and spring seasons.

The ride duration of the trips is compared to uncover differences in the behavior of casual and member riders: ![Total Trip Duration Summary 2022 (Hours)](https://github.com/discobuggie/demo-repo/assets/108239917/f70ac7b4-4540-45f6-a7a6-9e29edc431da) ![Avg Ride Duration per Month in 2022](https://github.com/discobuggie/demo-repo/assets/108239917/11422472-b3c3-4985-aad1-8c4c4508bda2) ![Average Ride Duration Per Day of Week in 2022](https://github.com/discobuggie/demo-repo/assets/108239917/26d4d790-f0d9-4162-a3ee-67d9bad8fc66) ![Average Ride Duration Per Hour in 2022](https://github.com/discobuggie/demo-repo/assets/108239917/6318ddb7-6228-4b8c-8761-b44a08b19e49)  
Notably, casual riders tend to have longer average ride durations compared to members.  For members, the average journey length remains relatively constant throughout the year, week, and day. However, there are variations in how long casual riders cycle. During the spring and summer, on weekends, and from 10 am to 2 pm, they cover greater distances. Conversely, they have shorter trips between five and eight in the morning.  
**Conclusion**: Casual commuters travel longer distances, approximately 2x more than members, but with less frequency. They tend to embark on longer journeys during weekends and outside of commuting hours during the day, especially in the spring and summer seasons, indicating that these trips may be primarily for recreational purposes.

To gain deeper insights into the disparities between casual and member riders, an analysis of the starting and ending station locations can be conducted. This analysis will focus on stations with the highest trip volumes, employing filters to draw meaningful conclusions.![Total Trips at Starting Locations in 2022](https://github.com/discobuggie/demo-repo/assets/108239917/734b235b-5c1e-411a-bd57-40b9e4f32cf8)  
Casual riders tend to start their trips more often from stations located near museums, parks, beaches, harbor points, and aquariums. On the other hand, members tend to start their journeys from stations in proximity to universities, residential areas, restaurants, hospitals, grocery stores, theaters, schools, banks, factories, train stations, parks, and plazas.  
![Total Trips at Ending Stations in 2022](https://github.com/discobuggie/demo-repo/assets/108239917/2f47afcf-5030-4a9f-a9b6-080bd2d67b9d)  
The same pattern can be observed in the ending station locations, with casual riders often concluding their journeys near parks, museums, and other recreational sites, while members tend to end their trips in close proximity to universities, residential, and commercial areas. This further supports the evidence that casual riders utilize bikes primarily for leisure activities, while members heavily rely on them for daily commuting.

**Summary**:
| Casual | Member|
|--------|-------|
|Prefer using bikes throughout the day, particularly more frequently on weekends during the summer and spring seasons, engaging in leisure activities.| Prefer riding bikes on weekdays during commute hours, specifically around 8 am and 5 pm, particularly in the summer and spring seasons.|
|Travel 2x longer distances than members, but with less frequency.| More frequent travel but shorter rides, approximately half the duration of casual riders' trips.|
|Rides start and end near parks, museums, along the coast and other recreational sites.| Rides start and end close to universities, residential and commercial areas.|

## Act


Having identified the distinctions between casual and member riders, we can now devise marketing strategies aimed at enticing casual riders to become members.  
The following recommendations are proposed:  
&nbsp;&nbsp;&nbsp;&nbsp; 1. Conduct marketing campaigns during the spring and summer seasons at tourist and recreational locations popular among casual riders.  Based on the patterns of casual riders, the best time to launch a marketing campaign would be beginning of April.  
&nbsp;&nbsp;&nbsp;&nbsp; 2.Consider providing seasonal or weekend-only memberships, as casual riders are most active on weekends and during the summer and spring.  
&nbsp;&nbsp;&nbsp;&nbsp; 3. Given that casual riders utilize bikes for longer durations compared to members, offering discounts for longer rides can serve as an incentive for casual riders and encourage members to opt for extended riding periods as well.

