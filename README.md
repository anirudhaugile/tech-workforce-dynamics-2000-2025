# Tech Workforce Dynamics (2001–2025)

## Project Overview

This project analyzes U.S. technology workforce cycles from 2001 to 2025 using a multi-tool analytical workflow integrating Python, SQL, and Tableau.

The objective is to model hiring expansions, layoff shocks, and overhiring corrections across major technology companies while contextualizing trends against U.S. macroeconomic indicators (GDP growth and unemployment).

---

## Objectives

- Identify peak hiring and layoff years  
- Quantify expansion and contraction cycles  
- Measure the 2020–2023 overhiring correction  
- Compare company-level workforce volatility  
- Integrate macroeconomic indicators (GDP & unemployment)  
- Implement a structured, end-to-end analytical pipeline  

---

## Data Processing (Python)

Raw company-level workforce data was cleaned and transformed using Pandas.

### Derived Metrics

- `net_change = new_hires − layoffs`
- `hiring_rate_pct`
- `attrition_rate_pct`

### Aggregated Outputs

- `company_year_dataset.csv`
- `yearly_summary.csv`
- `company_summary.csv`

Located in:

```
data/processed/
```

---

## Relational Database (SQL)

A normalized SQLite database was constructed to support structured analytical querying.

### Tables

**companies**
- `company_id` (Primary Key)
- `company_name` (Unique)

**employment_stats**
- `id` (Primary Key)
- `company_id` (Foreign Key → companies)
- `year`
- `total_employees`
- `new_hires`
- `layoffs`
- `net_change`
- `hiring_rate_pct`
- `attrition_rate_pct`

**yearly_macro**
- `year` (Primary Key)
- `gdp_growth_us_pct`
- `unemployment_rate_us_pct`

ER diagram available at:

```
visuals/er_diagram.png
```

---

## SQL Analytical Findings

Analytical queries were implemented to evaluate:

- Peak hiring years  
- Peak layoff years  
- Largest net expansion years  
- Expansion → contraction cycle (2020–2023)  
- Company-level total layoffs  
- Long-term net workforce growth by company  
- Workforce volatility (total hires + layoffs movement)  
- Worst contraction years  

Queries available in:

```
[`sql/analysis_queries.sql`](sql/analysis_queries.sql)
```

---

## Key Insights

- **2020 recorded the highest net workforce expansion (+617,916).**
- **2023 marked the largest contraction (-65,289).**
- Hiring expanded aggressively during 2020–2021 before slowing in 2022 and reversing in 2023.
- 2002 shows a mild contraction relative to other years.
- Amazon exhibits the highest cumulative workforce volatility in the dataset.
- Tech hiring behavior during the 2008–2009 macroeconomic crisis differed structurally from the 2023 tech-sector correction.

---

## Tableau Dashboard

**U.S. Tech Employment Cycles (2001–2025)**  
Expansion, Shock, and Overhiring Correction

Includes:

- Hiring vs Layoffs trend  
- Net Workforce Change  
- GDP & Unemployment overlay  
- Crisis annotations (2008, COVID, 2021–2023 correction)  

Files:

```
tableau/tech_employment_dashboard.twbx
visuals/tech_employment_dashboard.png
```

---

## Tech Stack

- Python (Pandas, NumPy)  
- SQLite  
- SQL  
- Tableau  
- Git / GitHub  

---

## Project Structure

```

tech-workforce-dynamics-2000-2025/
│
├── data/ # raw and processed datasets
├── python/ # data cleaning & feature engineering
├── sql/ # analytical SQL queries
├── tableau/ # Tableau workbook
├── visuals/ # exported dashboard & ER diagram
├── requirements.txt # Python dependencies
├── .gitignore
└── README.md

```

---

## Data Source

Workforce dataset sourced from:

Aryan Mishra  
Tech Hiring and Layoffs Workforce Data (2000–2025)  
Kaggle Dataset  
https://www.kaggle.com/datasets/aryanmdev/tech-hiring-and-layoffs-workforce-data-20002025  

All transformations, modeling, and analysis were performed independently for educational and portfolio purposes.

---

## Outcome

This project implements a structured, end-to-end analytical workflow spanning data transformation, relational modeling, and executive visualization.

It demonstrates:

- Reproducible data cleaning and feature engineering  
- Normalized relational schema design  
- Multi-level SQL aggregation and trend analysis  
- Integration of macroeconomic context with company-level data  
- Structured visualization of expansion and contraction cycles  
- Organized project architecture and version control discipline  

The result is a defensible analytical framework for examining long-term workforce dynamics using a layered data architecture (Python → SQL → Tableau).