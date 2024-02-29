# Cyclistic-Case-Study
This case study is part of the Google Data Analytics Professional Certificate. Cyclistic is a fictional bike sharing company in chicago, the financial team has advised that inorder to maximize revenue the best way is to increase subscription by ensuring more casual riders become annual paying members. The marketing team has a clear goal the design a marketing strategy aimed at coverting casual irders into annual memmbers, in order to devise a marketing strategy 3 questions witll guide the future of the marketing program 

1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digital media to influence casual riders to become members?

The data analyst were required to answer the first question and produce a report with the following deliverables 
1. A clear statement of the business task
2. A description of all data sources used
3. Documentation of any cleaning or manipulation of data
4. A summary of your analysis
5. Supporting visualizations and key findings
6. Your top three recommendations based on your analysis

Q. How do annual members and casual riders use Cyclistic bikes differently?

Ans. The business statement is for cyclists to get more annual memberships / subscriptions to earn more revenue, the financial analysts have concluded that annual memberships are more profitable than casual riders, and a few 
     of the relevant questions are stated (above) to help acheive this goal. one of them is the question stated above. Marketing team plans to sell annual memeberships to casual riders to acheive more revenue
	 Annual members of cyclists are those who pay for an annual subscription and have access to bikes that way, whereas casual riders are those who pay the fee for either one time or one day.
	 
End Goal : Design marketing strategies aimed at converting casual riders into annual members. In order to do that, however, the team needs to better understand how annual members and casual riders differ, why casual riders would   buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to identify trends.


For the prepare part, prev 12 months of data for 2023 was downloaded of the link provided, this gave us 12 csv files 
	uploaded one of the CSVs in google big query,  https://console.cloud.google.com/bigquery?project=cyclisticdataset-414911&ws=!1m9!1m4!4m3!1scyclisticdataset-414911!2scyclistic_TripData!3sTripData2023!1m3!8m2!1s3128281954!2s23521b819c7d4701a07449a2dcce0979
	
	
	 
	 Files named 'Divvy_trips_xxx' were ignored since the data didn't seem valid, column names were not consistent  , and they didn't contain most recent data i.e of the year 2023
	 
	 202301-divvy-tripdata
	 202302-divvy-tripdata
	 202303-divvy-tripdata
	 202304-divvy-tripdata
	 202305-divvy-tripdata
	 202306-divvy-tripdata
	 202307-divvy-tripdata
	 202308-divvy-tripdata
	 202309-divvy-tripdata
	 202310-divvy-tripdata
	 202311-divvy-tripdata
	 202312-divvy-tripdata, these files were used to import data into the 'TripData2023' table on google big query
	 
	 Data is located on a folder on my machine, organized by month for the year 2023. There is license to download and use this data 
	 
	 There are some issues with the consistency of the data , start station id / end station id is not consistent , end station name and end station id is often missing.
	  
	 Data should be credible since data has been provided by google / coursera itself as part of this project , and been made available by Motivate Intl Inc. under a license
	 
	 Some data manipulation is definately required, to calculate average ride times for riders for example, and to potentially ignore rows where end station id / name is missing to ensure the final results are more accurate.
	 
	 As part of cleaning and analyzing process, 
		checked if there were duplicates in ride id or not -> no duplicates in ride ID 
		rows with null values for end station id / start station id can potentially be ignored for further calculation, but for now NOT going to remove them 
		Extra column will be created to note down the ride_length of each ride 
		Extra column will also be created to document day of the week 
		Extra column will also be added to document month of the year 
		ignore rows where ride_length is negative in calculations , 
		created an extra column of distance by taking difference between latitudes and longititudes using pythragorus theorem. (NOTE: actual formula is calculating distance in terms of km is vastly different, but since 
		this only involves city of chicago, assumption was made as taking city as flat 2d surface and taking difference between coordinates like that )
		
		


Analysis:

	The excel files were loaded on google big query, and multiple aggregate queries were run to try and determine the answer to the fundamental question, how casual and members use cyclistic bikes differently . 
	
	. The first aggregate query is showing the number of rides of casual vs member . and out of 5707557 rides , members had 3653669 rides compared to 2053888 rides by casual riders, showing that members use cyclyistic bikes more
	  frequently
	. On the contrary if we compute average ride time of member vs casual , the average ride time of member is 12.55 min whereas for casual it is 28.32 minutes 
![image](https://github.com/Osama1995819/Cyclistic-Case-Study/assets/123731570/45460b23-723a-444e-a00d-33d9c2bd8723)

	. For the type of bike that was ridden by memebr vs causal, most members had a roughly equal ratio of electric bike (1836767) to classic bike (1816902) , whereas most casual riders preferred electric bike (1099880) to classic bike (875825) or docked bike (78183).
	. When we break down number of bike rides for member vs casual for member vs casual, we notice a significant increase around weekend  and on weekend for casual riders(friday, saturday , sunday) when compared with other days of the week. Comparitively members have a somewhat consistent number of rides throughout the week, infact slightly decreasing around the weekend. 
	. The average distance travelled by casual riders is also higher than for members 
	. If we look at number of rides for member vs casual per month, then we see an increase during the summer as compared for both casual vs memebr , but for casual the % increase in rides is much more marked as compared to members.
	
		
Recommendations : 
	Based of the analysis done and supporting visualizations, the main differences between casual and member riders were pointed out. The primary purpose of the excerise was to ensure how to more casual riders might become 
	members to increase revenue of the company. 
		. The number of casual riders increase over the weekend and taper off the rest of the week, whereas it is opposite for members. Meaning out of casual riders lesse rnumber of riders use cyclistic bikes to commute to work.
		  Cyclistic marketing team can recommend casual riders to commute to work more frequently via bikes by emphasising on health benefits and how it can be more beneficial for the environment. 
		
		. Another thing that was noted from analysis was that in the summer months there is an increase in number of riders for both casual and member riders, but for casual riders the % increase (month to month) in riders for
     	  summer months and subsequent decrease in winter is far more pronounced for casual riders as compared to members , which leads to a hypothesis that there a higher % of school / college going riders for casual as compared
		  to members, and the suggestion for marketing team is to look to target students more in order to increase subscription. 
		  
		. From that stats it was evident that the average ride time of casual riders is more than member riders, which leads to suggest that the average age for casual members is younger, and as a marketing tactic , younger
		  riders can be targetted more by the marketing team in order to increase subscription.
		  
		. In order to better confirm the hypothesis in the 2nd and 3rd point additonal data can be collected about the age of the rider in question for each ride and their gender as well for a more well rounded analysis. 

Attaching sql files used in analysis , as well as link to tablaue public page 

Link to visualizations on tablaue https://public.tableau.com/app/profile/osama.naeem6613/viz/CyclisticCaseStudyDataVisualizations/Dashboard1 

