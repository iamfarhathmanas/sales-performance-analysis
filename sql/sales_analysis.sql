-- Sales Performance Analysis

-- 1. Overall revenue, profit and margin
SELECT
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(100.0 * SUM(profit) / NULLIF(SUM(revenue), 0), 2) AS profit_margin_pct
FROM sales_data;

-- 2. Product performance
SELECT
    product,
    SUM(quantity) AS units_sold,
    ROUND(SUM(revenue), 2) AS revenue,
    ROUND(SUM(profit), 2) AS profit
FROM sales_data
GROUP BY product
ORDER BY revenue DESC;

-- 3. Regional performance
SELECT
    region,
    ROUND(SUM(revenue), 2) AS revenue,
    ROUND(SUM(profit), 2) AS profit
FROM sales_data
GROUP BY region
ORDER BY revenue DESC;

-- 4. Monthly revenue and profit
SELECT
    DATE_TRUNC('month', CAST(order_date AS DATE)) AS month,
    ROUND(SUM(revenue), 2) AS revenue,
    ROUND(SUM(profit), 2) AS profit
FROM sales_data
GROUP BY 1
ORDER BY 1;

-- 5. Channel margin
SELECT
    channel,
    ROUND(SUM(revenue), 2) AS revenue,
    ROUND(SUM(profit), 2) AS profit,
    ROUND(100.0 * SUM(profit) / NULLIF(SUM(revenue), 0), 2) AS margin_pct
FROM sales_data
GROUP BY channel
ORDER BY margin_pct DESC;
