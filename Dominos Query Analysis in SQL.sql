
--  Total Revenue

SELECT sum (total_price) as total_revenue
  FROM [Project].[dbo].[dominos_sales]   --  817860.049999993


  --  average Order Value

SELECT sum (total_price) / count(distinct order_id) as Avg_order_Value 
  FROM [Project].[dbo].[dominos_sales]   --  38.3288054175645


-- Total Pizzas Sold

SELECT SUM(quantity) AS Total_pizza_sold 
FROM [Project].[dbo].[dominos_sales]   --  49574


-- Total Orders

SELECT count(distinct order_id) AS Total_Orders  
FROM [Project].[dbo].[dominos_sales]    -- 21338


-- Average Pizzas Per Order

select cast(cast(sum(quantity) as decimal(10,2))/cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2))
FROM [Project].[dbo].[dominos_sales]    --   2.32


--Chart Requirement

--  Daily Trend for Total Orders

SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
from [Project].[dbo].[dominos_sales] 
group by DATENAME(DW,order_date)


--  Monthly Trend for Total Orders

SELECT DATENAME(MONTH, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
from [Project].[dbo].[dominos_sales] 
group by DATENAME(MONTH,order_date)


--  PERCENTAGE OF SALES BY PIZZA CATEGORY

SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from [Project].[dbo].[dominos_sales] ) AS DECIMAL(10,2)) AS PCT
FROM [Project].[dbo].[dominos_sales] 
GROUP BY pizza_category


--  PERCENTAGE OF SALES BY PIZZA SIZE

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from [Project].[dbo].[dominos_sales] ) AS DECIMAL(10,2)) AS PCT
FROM [Project].[dbo].[dominos_sales] 
GROUP BY pizza_size
ORDER BY pizza_size


--  TOTAL PIZZA SOLD BY PIZZA CATEGORY

select pizza_category, sum(quantity) as Total_Quantity_Sold
from [Project].[dbo].[dominos_sales] 
group by pizza_category
order by sum(quantity) desc


--Top 5 Pizzas by Revenue
SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM [Project].[dbo].[dominos_sales] 
GROUP BY pizza_name
ORDER BY Total_Revenue DESC


--Bottom 5 Pizzas by Revenue
SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM [Project].[dbo].[dominos_sales] 
GROUP BY pizza_name
ORDER BY Total_Revenue ASC


--Top 5 Pizzas by QUANTITY
SELECT Top 5 pizza_name, SUM(QUANTITY) AS Total_Pizza_Sold
FROM [Project].[dbo].[dominos_sales] 
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC


--Bottom 5 Pizzas by QUANTITY
SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM [Project].[dbo].[dominos_sales] 
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC


--Top 5 Pizzas by Total orders
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM [Project].[dbo].[dominos_sales] 
GROUP BY pizza_name
ORDER BY Total_Orders DESC


--Bottom 5 Pizzas by Total orders
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM [Project].[dbo].[dominos_sales] 
GROUP BY pizza_name
ORDER BY Total_Orders ASC


select * into new_table from(  )