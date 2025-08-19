--aggregated metrics grouped by date for Google and Facebook in one table
WITH combined_fb_ggl AS(
	SELECT ad_date 
	, 'google' 	AS medium
	, spend, impressions, reach, clicks, leads, value
	FROM facebook_ads_basic_daily
		UNION ALL
	SELECT ad_date 
	, 'facebook' AS medium
	, spend, impressions, reach, clicks, leads, value
	FROM google_ads_basic_daily)
SELECT ad_date, medium
	, round(avg(spend),2) 		AS avg_spend
	, round(avg(impressions),2) 	AS avg_impressions
	, round(avg(reach),2) 		AS avg_reach
	, round(avg(clicks),2) 		AS avg_clicks
	, round(avg(leads),2) 		AS avg_leads
	, round(avg(value),2) 		AS avg_value
	, max(spend) 		AS max_spend
	, max(impressions)	AS max_impressions
	, max(reach) 		AS max_reach
	, max(clicks)		AS max_clicks
	, max(leads) 		AS max_leads
	, max(value)		AS max_value
	, min(spend)		AS min_spend
	, min(impressions)	AS min_impressions
	, min(reach) 		AS min_reach
	, min(clicks) 		AS min_clicks
	, min(leads)		AS min_leads
	, min(value)		AS min_value
FROM combined_fb_ggl
GROUP BY 1,2
ORDER BY 1
;
