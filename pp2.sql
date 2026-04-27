select *
from INFORMATION_SCHEMA.TABLES

-- Exploration des dimensions
select distinct country from [gold.dim_customers]


-- Explorer toutes les catégories et les principales divisions
SELECT DISTINCT category ,subcategory,product_name from dim_products

-- Exploration des dates pour identifier les premières et dernières dates (bornes)
-- Comprendre l’étendue des données et la période couverte
-- Trouver la date de la première et de la dernière commande

SELECT 
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date,
    DATEDIFF(YEAR, MIN(order_date), MAX(order_date)) AS order_range_years
FROM dbo.fact_sales

-- Trouver les clients les plus jeunes et les plus âgés

select min(birthdate) as oldest_birthdate,
max(birthdate) as youngest_birthdate,
DATEDIFF(year,min(birthdate),GETDATE())as oldest_customer,
DATEDIFF(year,max(birthdate),GETDATE())as youngest_customer
from [gold.dim_customers]

-- Calculer le total des ventes
select sum(sales_amount) as total_sale
from fact_sales

-- Calculer le nombre total d’articles vendus
select sum(quantity) as total_quantity
from fact_sales

-- Calculer le prix de vente moyen
select avg(price) as avg_price
from fact_sales

-- Calculer le nombre total de commandes
select count(distinct (order_number)) as total_order 
from fact_sales

-- Calculer le nombre total de produits
select count(product_key) as total_product 
from dim_products

-- Calculer le nombre total de clients
select count(customer_key) as total_customer 
from [gold.dim_customers]

-- Calculer le nombre total de clients ayant passé une commande
select count(distinct(customer_key)) as total_orders
from fact_sales

-- Générer un rapport affichant les indicateurs clés de l’entreprise
 
select 'Total_sales' as measure_name , SUM(sales_amount) as measure_value
from fact_sales
union all
select 'Total quantity' as measure_name , sum(quantity) as measure_value
from fact_sales
union all
select 'Average price ' as measure_name , avg(price) as measure_value
from fact_sales
union all
SELECT 'Total Nr. Orders' as measure_name,
       COUNT(DISTINCT order_number) as measure_value
FROM fact_sales
UNION ALL
SELECT 'Total Nr. Products' as measure_name,
       COUNT(product_name) as measure_value
FROM dim_products
UNION ALL
SELECT 'Total Nr. Customers' as measure_name,COUNT(customer_key) as measure_value
FROM [gold.dim_customers]


-- Analyse de l’ampleur (magnitude)
-- Trouver le nombre total de clients par pays
SELECT COUNT(customer_key) as total_customers
FROM [gold.dim_customers]
group by country
order by total_customers desc

-- Trouver le nombre total de clients par genre
SELECT gender, COUNT(customer_key) as total_customers
FROM [gold.dim_customers]
group by gender
order by total_customers desc

-- Trouver le nombre total de produits par catégorie
select category,COUNT(product_key) as total_products
from dim_products
group by category 
order by total_products desc 

-- Quel est le coût moyen dans chaque catégorie ?
select category ,AVG(cost) as avg_costs
from dim_products
group by category
order by avg_costs desc

-- Quel est le revenu total généré par chaque catégorie ?
select 
    sum(f.sales_amount) as total_revenue,
    p.category
from fact_sales f
left join dim_products p
    on p.product_key = f.product_key
group by p.category;

-- Trouver le revenu total généré par chaque client
select c.customer_key,c.first_name,c.last_name,sum(f.sales_amount) as total_revenue
from fact_sales f
left join [gold.dim_customers] c 
on c.customer_key = f.customer_key
group by c.customer_key,c.first_name,c.last_name
order by total_revenue desc

-- Quelle est la répartition des articles vendus par pays ?
select c.country,sum(f.quantity) as total_sold_items
from fact_sales f 
left join [gold.dim_customers] c 
on c.customer_key=f.customer_key
group by c.country
order by total_sold_items 

-- Quels sont les 5 produits générant le plus de revenus ?
select top 5  p.product_name, sum(f.sales_amount) total_revenue
from fact_sales f 
left join  dim_products p
on p.product_key = f.product_key
group by p.product_name 
order by total_revenue desc;

-- Quels sont les 5 produits les moins performants en termes de ventes ?
select top 5  p.product_name, sum(f.sales_amount) total_revenue
from fact_sales f 
left join  dim_products p
on p.product_key = f.product_key
group by p.product_name 
order by total_revenue asc;

-- Trouver les 10 clients ayant généré le plus de revenus
select c.customer_key,
c.first_name,
c.last_name,
sum(f.sales_amount) as total_revenue 
from fact_sales f 
left join [gold.dim_customers] c 
on c.customer_key = f.customer_key
group by c.customer_key ,c.first_name,c.last_name
order by total_revenue desc 

-- Les 10 clients ayant passé le moins de commandes
select top 10 c.customer_key,
c.first_name,
c.last_name,
count (distinct order_number ) as total_orders  
from fact_sales f 
left join [gold.dim_customers] c 
on c.customer_key = f.customer_key
group by c.customer_key ,c.first_name,c.last_name
order by total_orders


--advanced analytics 

--changes over the time analysis (par mois)
--its for analysis the trends and identigiy seasonitly in this data
SELECT 
    month(order_date) AS order_year,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM fact_sales
WHERE order_date IS NOT NULL
GROUP BY month(order_date)
ORDER BY order_year;

--anaylysis cumlative 
--aggreate the data progrsssively oiber time helps to undertsand whether our buisnnessi growing or decling 
--Cumulative (Running Total) Analysis
--Why:To understand the progression and growth of the business by adding values progressively over time rather than looking at individual periods in isolation.
SELECT 
    order_date,
    total_sales,
    SUM(total_sales) OVER (ORDER BY order_date) AS running_total_sales
FROM (
    SELECT DATETRUNC(month, order_date) AS order_date, SUM(sales_amount) AS total_sales
    FROM fact_sales
    GROUP BY DATETRUNC(month, order_date)
) t;
---Performance Analysis (Year-over-Year)
--: To compare current performance against a target or a previous period 
--(e.g., comparing this year's sales to last year's) to measure success


--Part-to-Whole Analysis
--Why: To determine the proportion of a category relative to the entire business,
--helping to identify the most impactful segments.

WITH yearly_product_sales AS (
    SELECT 
        YEAR(f.order_date) AS order_year,
        p.product_name,
        SUM(f.sales_amount) AS current_sales
    FROM fact_sales AS f
    LEFT JOIN dim_products AS p 
        ON f.product_key = p.product_key
    WHERE f.order_date IS NOT NULL
    GROUP BY 
        YEAR(f.order_date), 
        p.product_name
),

sales_with_prev AS (
    SELECT
        order_year,
        product_name,
        current_sales,
        LAG(current_sales) OVER (
            PARTITION BY product_name 
            ORDER BY order_year
        ) AS previous_year_sales
    FROM yearly_product_sales
)

SELECT
    order_year,
    product_name,
    current_sales,
    previous_year_sales,
    current_sales - previous_year_sales AS diff_prev_year,
    CASE
        WHEN previous_year_sales IS NULL THEN 'No Previous Data'
        WHEN current_sales > previous_year_sales THEN 'Increase'
        WHEN current_sales < previous_year_sales THEN 'Decrease'
        ELSE 'No Change'
    END AS py_change
FROM sales_with_prev
ORDER BY product_name, order_year;

--Data Segmentation (Customer)
--This segments customers into groups based on two metrics
--: Lifespan (how long they've been with the company) and Total Spending.
--Logic: * VIP: At least 12 months history AND > $5,000 spent
--Regular: At least 12 months history AND = $5,000 spent
WITH customer_spending AS (
    SELECT 
        customer_key,
        SUM(sales_amount) AS total_spending,
        DATEDIFF(MONTH, MIN(order_date), MAX(order_date)) AS lifespan
    FROM gold.fact_sales
    GROUP BY customer_key
)
SELECT 
    customer_key,
    total_spending,
    lifespan,
    -- Create Segments
    CASE 
        WHEN lifespan >= 12 AND total_spending > 5000 THEN 'VIP'
        WHEN lifespan >= 12 AND total_spending <= 5000 THEN 'Regular'
        ELSE 'New'
    END AS customer_segment
FROM customer_spending;
