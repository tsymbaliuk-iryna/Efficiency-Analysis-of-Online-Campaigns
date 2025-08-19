--Q5 - the longest and continuous duration of adset
WITH combined_data AS ( 				-- to combine both platforms and get unique adset-date combinations
	SELECT DISTINCT
		fba.adset_name
		, fbd.ad_date
	FROM facebook_ads_basic_daily fbd
	LEFT JOIN facebook_adset fba ON fbd.adset_id = fba.adset_id
	WHERE fba.adset_name IS NOT NULL
		UNION
	SELECT DISTINCT
		adset_name
		, ad_date  
	FROM google_ads_basic_daily
	WHERE adset_name IS NOT NULL
),
gaps_and_islands AS ( 				    -- to create groups for consecutive dates 
    SELECT 
        adset_name,
        ad_date,
        ad_date - ROW_NUMBER() OVER (PARTITION BY adset_name ORDER BY ad_date) * INTERVAL '1 day' AS group_id
    FROM combined_data
)
--SELECT * FROM  gaps_and_islands 	-- to check CTE result
, consecutive_periods AS ( 		    -- to calculate duration of each consecutive period
    SELECT 
        adset_name
        , group_id
        , MIN(ad_date) AS start_date
        , MAX(ad_date) AS end_date
        , MAX(ad_date) - MIN(ad_date) + 1 AS duration_days	  -- +1 to include both start and end dates
    FROM gaps_and_islands
    GROUP BY 1,2
)
--SELECT * FROM  consecutive_periods 	-- to check CTE result
SELECT 			-- to get adset with overall longest continuous period
    adset_name
    , duration_days
FROM consecutive_periods
ORDER BY duration_days DESC
LIMIT 1;
