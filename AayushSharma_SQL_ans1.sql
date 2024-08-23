CREATE TABLE Poll_Data (
    User_ID VARCHAR(50),
    Poll_Id VARCHAR(50),
    Poll_Option_Id VARCHAR(50),
    Amount INT,
    Created_dt DATE
);

INSERT INTO Poll_Data (User_ID, Poll_Id, Poll_Option_Id, Amount, Created_dt) VALUES
('id1', 'p1', 'A', 200, '2021-12-01'),
('id2', 'p1', 'C', 250, '2021-12-01'),
('id3', 'p1', 'A', 200, '2021-12-01'),
('id4', 'p1', 'B', 500, '2021-12-01'),
('id5', 'p1', 'C', 50, '2021-12-01'),
('id6', 'p1', 'D', 500, '2021-12-01'),
('id7', 'p1', 'C', 200, '2021-12-01'),
('id8', 'p1', 'A', 100, '2021-12-01');

select * from Poll_Data;

-- a+b+d=Select sum(Amount) 
-- from Poll_Data 
-- where Poll_Option_Id!='C';

-- c=Select sum(Amount)
-- from Poll_Data 
-- where Poll_Option_Id='C';

Select User_ID,((Select sum(Amount) from Poll_Data where Poll_Option_Id!='C')
    /
    (Select sum(Amount)from Poll_Data where Poll_Option_Id='C')
    +1)
    *
    Amount as Returns
from Poll_Data 
where Poll_Option_Id='C';









