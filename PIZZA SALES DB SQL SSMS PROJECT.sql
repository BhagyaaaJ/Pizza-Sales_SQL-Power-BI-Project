SELECT * FROM pizza_sales;

-- Business Queries------------------------------------------------------------------------------------------------------------------ --



-- Q.1 What is the Total Revenue ?

SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;


-- Q.2 What is the Average Order Value ?

SELECT SUM(total_price)/ COUNT(DISTINCT order_id) AS Average_Order_Value FROM pizza_sales;


-- Q.3 What is the Total number of pizzas sold ?

SELECT SUM(quantity) AS Total_Pizzas_Sold FROM pizza_sales;


--Q.4 What is the total number of orders placed ?

SELECT COUNT(DISTINCT order_id) AS Total_orders FROM pizza_sales;

--Q.5 What is the average number of pizzas sold per order ?

 SELECT SUM(quantity)/ COUNT(DISTINCT order_id) AS Avg_qty_per_order FROM pizza_sales;

 
 
 
 
 -- Questions regarding Trend Analysis for charts:- -- -------------------------------------------------------------------------------------------------

 

 --Q.6 Orders placed as per different days throughout the week ?

 SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS Total_orders 
 FROM pizza_sales
 GROUP BY DATENAME(DW, order_date);


 -- Q.7 Orders placed as per months ?

 SELECT DATENAME(MONTH, order_date) AS order_day, COUNT(DISTINCT order_id) AS Total_Orders
 FROM pizza_sales
 GROUP BY DATENAME(MONTH, order_date)
 ORDER BY Total_Orders DESC;

 SELECT * FROM pizza_sales;


 -- Q.8 Percentage of sales made by each category ?
 
 SELECT pizza_category, SUM(total_price) * 100/ (SELECT SUM(total_price) FROM pizza_sales) AS Total_Sales
 FROM pizza_sales
 GROUP BY pizza_category;


	 --Q.9 Revenue by each category?
 
	 SELECT pizza_category, SUM(total_price) AS Total_Revenue
	 FROM pizza_sales
	 GROUP BY pizza_category
	 ORDER BY Total_Revenue DESC;



 