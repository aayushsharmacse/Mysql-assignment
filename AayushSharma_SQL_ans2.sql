CREATE TABLE Sales_Data (
    City VARCHAR(50),
    Year INT,
    Month INT,
    Sales INT
);
INSERT INTO Sales_Data (City, Year, Month, Sales) VALUES
('Delhi', 2020, 5, 4300),
('Delhi', 2020, 6, 2000),
('Delhi', 2020, 7, 2100),
('Delhi', 2020, 8, 2200),
('Delhi', 2020, 9, 1900),
('Delhi', 2020, 10, 200),
('Mumbai', 2020, 5, 4400),
('Mumbai', 2020, 6, 2800),
('Mumbai', 2020, 7, 6000),
('Mumbai', 2020, 8, 9300),
('Mumbai', 2020, 9, 4200),
('Mumbai', 2020, 10, 9700),
('Bangalore', 2020, 5, 1000),
('Bangalore', 2020, 6, 2300),
('Bangalore', 2020, 7, 6800),
('Bangalore', 2020, 8, 7000),
('Bangalore', 2020, 9, 2300),
('Bangalore', 2020, 10, 8400);

select * from Sales_Data;
//help taken from gpt
select a.City,a.Year,a.Month,a.Sales,b.Sales as "Previous Monthes Sales",c.Sales 
as "Next Month Sales",(SELECT SUM(d.Sales)
        FROM Sales_Data d
        WHERE d.City = a.City AND d.Year = a.Year AND d.Month <= a.Month
       ) AS "YTD Sales"
from Sales_Data as a Left Join Sales_Data as b
On ((a.Month-1)=b.Month and a.City=b.City and a.Year=b.Year)
LEFT JOIN Sales_Data AS c
ON (a.Month + 1 = c.Month AND a.City = c.City AND a.Year = c.Year);

































