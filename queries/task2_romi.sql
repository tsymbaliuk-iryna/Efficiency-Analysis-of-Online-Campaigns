--Q2 - finding 5 days with max total ROMI for data from both G and F ordered DESC
SELECT ad_date
	, round((sum(value)::NUMERIC-sum(spend)::NUMERIC)/sum(spend)::NUMERIC,2) AS total_romi
FROM 
	(SELECT ad_date, value, spend 
	FROM facebook_ads_basic_daily
	WHERE spend>0
	UNION ALL
	SELECT ad_date, value, spend 
	FROM google_ads_basic_daily
	WHERE spend>0) combined
GROUP BY 1
ORDER BY 2 DESC 
LIMIT 5
;
