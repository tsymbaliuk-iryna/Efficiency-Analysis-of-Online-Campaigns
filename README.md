# Efficiency Analysis of Online Campaigns

## Project Overview
This mini-project analyzes the effectiveness of online advertising campaigns.  
The analysis includes SQL queries in **PostgreSQL (via DBeaver)** and **BigQuery**, with results visualized in **Looker Studio**.

## Datasets
The project was based on two datasets:

- **Google Analytics 4 public e-commerce dataset (Google Store, 2020–2021)** – available via BigQuery.  
- **Google & Facebook Ads dataset (2020–2022)** – internal dataset provided by my training program (not publicly available).

**Main goals:**
- Identify patterns of campaign effectiveness
- Calculate ROMI and highlight top-performing campaigns
- Build a conversion funnel and detect drop-off points
- Compare landing page performance
- Explore correlation between engagement and purchases

---

## 🛠 Tools & Technologies
- **SQL (PostgreSQL, BigQuery)**
- **DBeaver** (query execution environment)
- **Looker Studio** (data visualization)

---

## 📂 Repository Structure
- [`queries/`](queries/) → SQL queries for each task
- `presentation/` → Project slides (PDF). You can find [a short video recording here](https://drive.google.com/file/d/1gomXzxLjz4N2-kmdYl83Z_vOqWZlxLTW/view?usp=sharing)
- `contents/` → Background of the project tasks, with my own summaries and notes on SQL concepts used (e.g., CTEs, window functions, Gaps & Islands)
- `dashboards/` → Screenshots + Links to Looker Studio dashboards below

---

## Key Results
- Built conversion funnel from session → cart → checkout → purchase
- Identified campaigns with record value and reach
- Found top 5 dates with the highest ROMI
- Analyzed landing page efficiency (traffic vs conversion)
- Correlation between engagement time and purchases

🔗 [Interactive Dashboard 1 in Looker Studio](https://lookerstudio.google.com/reporting/05538902-a092-4539-aeac-89e6e7a5080d)   
🔗 [Dashboard 2](https://lookerstudio.google.com/reporting/676d5a1f-bead-421c-b0fa-86cbbc3fa102)

---

## Value & Learnings gained from this project
- Hands-on experience in SQL with real datasets
- Advanced queries (CTE, joins, window functions, Gaps & Islands method)
- Practical BI data preparation
- Clear business insights for campaign optimization
- Experience presenting technical findings

---

