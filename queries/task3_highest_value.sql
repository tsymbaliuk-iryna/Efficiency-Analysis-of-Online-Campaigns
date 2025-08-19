--Q3 - campaign with the highest total value in a week
SELECT 
	CAST(date_trunc('WEEK',ad_date) AS date) AS ad_week		--to satisfy the week condition
	, campaign
	, round(sum(value)::NUMERIC,2) AS total_value
FROM 
	(SELECT 	
		ad_date
		, coalesce(value,0) AS value 		--to avoid NULL results
		, fbc.campaign_name AS campaign
	FROM facebook_ads_basic_daily fbd
	LEFT JOIN facebook_campaign fbc ON fbd.campaign_id = fbc.campaign_id		--to get actual campaign name from different table
	UNION ALL
	SELECT 
		ad_date
		, coalesce(value,0) AS value
		, campaign_name AS campaign 
	FROM google_ads_basic_daily) combined
GROUP BY 1,2
ORDER BY 3 DESC 
LIMIT 1
;
