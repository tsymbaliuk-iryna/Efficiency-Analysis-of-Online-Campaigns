--Q4 - campaign with the highest reach as absolute difference between current and previous month reach
WITH combined AS (																--CTE1 to get month, campaign_name and total reach
	SELECT 
		fbc.campaign_name 		AS campaign
		, CAST(date_trunc('MONTH',ad_date) AS date) 	AS ad_month				--to satisfy the month condition
		, coalesce(reach,0) 	AS reach 										--to avoid NULL results
	FROM facebook_ads_basic_daily fbd
	LEFT JOIN facebook_campaign fbc ON fbd.campaign_id = fbc.campaign_id		--to get actual campaign name from different table
	WHERE campaign_name IS NOT NULL 
		UNION ALL
	SELECT 
		campaign_name 			AS campaign 
		, CAST(date_trunc('MONTH',ad_date) AS date) 	AS ad_month
		, coalesce(reach,0) 	AS reach 										
	FROM google_ads_basic_daily
	WHERE campaign_name IS NOT NULL)
, date_mon AS (
	SELECT ad_month
		, campaign
		, sum(reach) 			AS total_reach
	FROM combined 
	GROUP BY 1,2)
, lag_reach AS ( 																--CTE2 to get the previous reach grouped by campaign and month
	SELECT ad_month
		, campaign
		, total_reach
		, lag(total_reach, 1) OVER (PARTITION BY campaign ORDER BY ad_month) AS total_prev_reach 	--to get the previous reach
	FROM date_mon)
SELECT 
	ad_month
	, campaign
	, total_reach-total_prev_reach 	AS reach_increase
FROM lag_reach
WHERE total_prev_reach IS NOT NULL
ORDER BY 3 DESC 
LIMIT 1 
;
