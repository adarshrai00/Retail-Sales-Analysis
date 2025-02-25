create database sql_project;
use sql_project;
SHOW DATABASES;

create table Retail(
				transactions_id int primary key,
					sale_date	date,
					sale_time	time,
					customer_id	int ,
					gender	varchar(10),
					age	 int ,
					category varchar(20),	
					quantiy	int,
                    price_per_unit float,	
					cogs	float,
					total_sale float

             );
             select* from Retail
             where 
                transactions_id is null 
                or 
                sale_date is null
                or
                sale_time is null
                or 
                customer_id is null
                or 
                gender is null
                or
                age is null
                or
                category is null
                or 
                price_per_unit is null
                or
                cogs is null
                or 
                total_sale is null;
                
                -- how many sales we have --  
                select count(*) as total_sales from retail;
                
                 -- how many customer do we have 
                 select count(*) as no_customer from retail
                 where customer_id is not null;
                
			  -- number of unique customer
              select count(distinct customer_id) as unique_custoemr
              from retail;
                 -- different categorey
                 select count(distinct category) as products
                 from retail;
                 
                 -- Data analysis and Business key problems and answers--
                 
			-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
				  select * 
				  from retail
				   where sale_date='2022-11-05';
               
               -- number of sales on that date-- 
				   select count(*)
				   from retail
				   where  sale_date ='2022-11-05';
              
              -- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
					  SELECT *
						FROM retail
						WHERE category = 'Clothing'
						  AND quantiy > 3
						  AND DATE_FORMAT(sale_date, '%Y-%m') = '2022-11';
						  select * from retail;
                          
			  -- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
              
						  select category, sum(total_sale) as total_sale
						 from retail 
						   group by category;
                           
				-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
                select avg(age) as average_age
                from retail 
                where category='beauty';
                
                -- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
                   select transactions_id
                   from retail 
                   where total_sale>1000;
              
				-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
                 select category,gender, count(transactions_id)
                 from retail
                 group by gender ,category;
                 -- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
                    
                    select year(sale_date) as year,month(sale_date) as month
                     ,avg(total_sale) 
                     from retail
                     group by 2,1;
                     -- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
                     select customer_id,sum(total_sale) as total_sale
                     from retail
                     group by 1
                     order by 2 desc
                     limit 5;
                     -- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
                     select count(distinct customer_id),category
                     from retail
                     group by 2;
                     -- Q.10 Write a SQL query to create each shift  of orders (Example Morning <=12, Afternoon Between 12 & 17)
                    select *,
                        case  
                          when hour(sale_time)<12 then "morning" 
                          when  hour(sale_time) between 12 and 17 then  "afternoon"
                          end as shift
                          from retail;
                                               
                     
                  
