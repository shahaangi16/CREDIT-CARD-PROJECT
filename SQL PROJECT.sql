use bank;
select * from customer;
select * from credit_card;

-- 1. List all customers with basic details
select ï»¿Client_Num, Customer_Age, Gender, Income
from customer;

-- 2. Show customers earning more than 50,000
select ï»¿Client_Num, Income
from customer
where Income > 50000;

-- 3. count the clinets by martiatl status
select Marital_Status, count(*) as total_customers
from customer
group by Marital_Status;

-- 4. show the customers who own a car and has a house
SELECT ï»¿Client_Num, Car_Owner, House_Owner
FROM customer
WHERE Car_Owner='yes' AND House_Owner='yes';

-- 5. Get distinct education level
select distinct Education_Level
from customer;

-- 6.show top 10 highest credit limit
select ï»¿Client_Num, Credit_Limit
from credit_card
order by Credit_Limit desc
limit 10;

-- 7. Join customers with credit card accounts
select c.ï»¿Client_Num , c.Customer_Age, cc.Card_Category,cc.Annual_Fees
from customer c 
join credit_card cc on c.ï»¿Client_Num = cc.ï»¿Client_Num;


-- 8.  Customers whose income is above overall average
SELECT ï»¿Client_Num, Income
FROM customer
WHERE Income > (SELECT AVG(Income) FROM customer);

-- 9.For each state, rank customers by satisfaction score
SELECT ï»¿Client_Num, state_cd, Cust_Satisfaction_Score,
       DENSE_RANK() OVER (PARTITION BY state_cd ORDER BY Cust_Satisfaction_Score DESC) AS rank_in_state
FROM customer;

-- 10. Rank credit cards based on utilization ratio
SELECT Card_Category, Avg_Utilization_Ratio,
       RANK() OVER (ORDER BY Avg_Utilization_Ratio DESC) AS util_rank
FROM credit_card;

-- 11. Customers with highest total interest earned
SELECT ï»¿Client_Num, total_interest
FROM (
    SELECT ï»¿Client_Num, SUM(Interest_Earned) AS total_interest
    FROM credit_card
    GROUP BY ï»¿Client_Num
) t
ORDER BY total_interest DESC
LIMIT 10;













