-- tech-workforce-dynamics-2000-2025
-- SQL Analytics: Workforce Cycles, Company Volatility, Macro Context

-- 1) Peak hiring years (top 5)
SELECT 
    year,
    SUM(new_hires) AS total_hires
FROM employment_stats
GROUP BY year
ORDER BY total_hires DESC
LIMIT 5;

-- 2) Peak layoff years (top 5)
SELECT 
    year,
    SUM(layoffs) AS total_layoffs
FROM employment_stats
GROUP BY year
ORDER BY total_layoffs DESC
LIMIT 5;

-- 3) Largest net expansion years (top 5)
SELECT 
    year,
    SUM(net_change) AS total_net_change
FROM employment_stats
GROUP BY year
ORDER BY total_net_change DESC
LIMIT 5;

-- 4) Net change during expansion → correction (2020–2023)
SELECT 
    year,
    SUM(net_change) AS total_net_change
FROM employment_stats
WHERE year BETWEEN 2020 AND 2023
GROUP BY year
ORDER BY year;

-- 5) Companies with highest total layoffs (top 10)
SELECT 
    c.company_name,
    SUM(e.layoffs) AS total_layoffs
FROM employment_stats e
JOIN companies c
ON e.company_id = c.company_id
GROUP BY c.company_name
ORDER BY total_layoffs DESC
LIMIT 10;

-- 6) Companies with highest total net growth (top 10)
SELECT 
    c.company_name,
    SUM(e.net_change) AS total_net_growth
FROM employment_stats e
JOIN companies c
ON e.company_id = c.company_id
GROUP BY c.company_name
ORDER BY total_net_growth DESC
LIMIT 10;

-- 7) Most volatile companies (hires + layoffs movement) (top 10)
SELECT 
    c.company_name,
    SUM(e.new_hires) AS total_hires,
    SUM(e.layoffs) AS total_layoffs,
    SUM(e.new_hires + e.layoffs) AS total_movement
FROM employment_stats e
JOIN companies c
ON e.company_id = c.company_id
GROUP BY c.company_name
ORDER BY total_movement DESC
LIMIT 10;

-- 8) Most stable companies (lowest movement) (bottom 5)
SELECT 
    c.company_name,
    SUM(e.new_hires + e.layoffs) AS total_movement
FROM employment_stats e
JOIN companies c
ON e.company_id = c.company_id
GROUP BY c.company_name
ORDER BY total_movement ASC
LIMIT 5;

-- 9) Worst contraction years (most negative net change) (bottom 5)
SELECT 
    year,
    SUM(net_change) AS total_net_change
FROM employment_stats
GROUP BY year
ORDER BY total_net_change ASC
LIMIT 5;

-- 10) Macro join: hires with GDP growth + unemployment by year
SELECT 
    e.year,
    SUM(e.new_hires) AS total_hires,
    m.gdp_growth_us_pct,
    m.unemployment_rate_us_pct
FROM employment_stats e
JOIN yearly_macro m
ON e.year = m.year
GROUP BY e.year
ORDER BY e.year;