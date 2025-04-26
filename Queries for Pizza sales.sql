
Select * from pizza_sales

select sum(total_price) as Total_Revenue from pizza_sales
select sum(total_price)/count(distinct order_id) as Avg_order_value from pizza_sales
select sum(quantity) as Total_pizza_sold from pizza_sales
select count(distinct order_id) as Total_orders from pizza_sales

/* Quries for Charts Requirements */
select * from pizza_sales
select DATENAME(DW, order_date) as order_day, count(distinct order_id) as Total_Orders from pizza_sales
Group BY DATENAME(DW,order_date)

SELECT DATENAME(MONTH,order_date) as month_name , COUNT(DISTINCT order_id) from pizza_sales 
GROUP BY DATENAME(MONTH, order_date)

SELECT pizza_category , SUM(total_price)*100/ (SELECT SUM(total_price)from pizza_sales) from pizza_sales
as total_percentage_category Group BY pizza_category

SELECT	pizza_size , CAST(SUM(total_price)as DECIMAL(10,2)) as Total_sales , CAST(SUM(total_price)*
(SELECT SUM (total_price) from pizza_sales Where DATEPART(quarter, order_date) = 1)as decimal (10,2)) AS PCT from pizza_sales
WHERE DATEPART(quarter, order_date) = 1
Group BY pizza_size
Order BY PCT DESC

SELECT TOP 5 pizza_name , SUM(total_price) AS Total_Revenue FROM pizza_sales
Group BY pizza_name
Order BY Total_Revenue 