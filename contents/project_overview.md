# Tasks Overview

This file provides context for the tasks completed in the project.  
Each task includes: a summary, key SQL techniques, and the main business insight.

---

## Task 1 — Campaign Performance Analysis (Google & Facebook Ads)
**Goal:** Aggregate campaign metrics and compare performance across platforms.  
**SQL Concepts:** CTEs, `UNION ALL`, aggregation functions (`AVG`, `MAX`, `MIN`).  

![Campaign Performance Analysis](img/task1_aggregation.png)  

**Insight:** Campaign performance varies significantly by date. While average values are stable, some campaigns reach record highs — showing that most campaigns perform at a baseline, but occasional spikes drive much of the total value.

---

## Task 2 — Top-Performing Dates by ROMI
**Goal:** Identify the days with the highest Return on Marketing Investment (ROMI).  
**SQL Concepts:** Subquery in `FROM`, filtering by spend > 0, `::NUMERIC` cast for data type control.

![ROMI_top 5 results](img/task2_romi.png)

**Insight:** The top 5 dates occurred at the start of 2022. For example, on **Jan 11, each $1 invested generated $1.49 net profit** — valuable information for optimizing budget allocation.

---

## Task 3 — Record-Value Campaigns (Weekly)
**Goal:** Find campaigns with the highest total weekly value.  
**SQL Concepts:** `date_trunc`, JOINs for campaign names, `COALESCE` to handle NULLs.  

![Record Value](img/task3_highest_value.png)

**Insight:** The **Expansion campaign in April 2022** generated record weekly revenue, highlighting a successful push or major promotion.

---

## Task 4 — Campaign Reach Growth (MoM)
**Goal:** Identify campaigns with the largest month-to-month reach increase.  
**SQL Concepts:** CTEs, `lag()` window function, `UNION ALL`, `LEFT JOIN`.  

![Reach Growth](img/task4_highest_reach.png)

**Insight:** The **Hobbies campaign** showed a reach increase of +4.3M users in one month, likely due to a large-scale activation or successful creative.

---

## Task 5 — Longest Continuous Campaign (Adsets)
**Goal:** Determine which adset ran for the longest uninterrupted period.  
**SQL Concepts:** `DISTINCT` combinations, window functions, Gaps & Islands method for continuity, `INTERVAL`.  

![Continuous Adset](img/task5_continous_adset.png) 

**Insight:** Some adsets ran continuously for weeks, reflecting “always-on” campaigns, while others were more tactical with shorter runs.

---

## Task 6 — Conversion Funnel (GA4 Dataset)
**Goal:** Build a funnel from session → cart → checkout → purchase.  
**SQL Concepts:** BigQuery, user-session IDs (concatenation), `COUNT DISTINCT` + `CASE`, `safe_divide`, `TIMESTAMP_MICROS`.  

![Conversion Funnel](img/task7_conversions_traffic.png)

**Insight:** The funnel reveals **critical drop-off between “add to cart” and “checkout”**, suggesting friction in the buying process.

---

## Task 7 — Landing Page Conversion Rates (GA4 Dataset)
**Goal:** Compare conversion rates of different landing pages.  
**SQL Concepts:** Extracting page paths from URLs, unique session id by `||`, `_TABLE_SUFFIX` to filder time period.  

![Sessions vs purchases](img/task9_landing_pages.png)

**Insight:** High-traffic pages (e.g., Homepage) convert poorly (~2%), while niche pages achieve much higher conversion (~4.6%) despite lower traffic. Targeted traffic proves more effective.

---

## Task 8 — Correlation Between Engagement and Purchases
**Goal:** Test whether engagement metrics predict purchases.  
**SQL Concepts:** `COALESCE`, type casting, correlation functions (`corr`).  

![Correlation](img/task8_correlation.png)

**Insight:** Correlation between engagement time and purchases was **32% (weak-moderate)**, while correlation with “session engaged” was only **4% (very weak)**. Engagement alone does not guarantee conversions.

---
