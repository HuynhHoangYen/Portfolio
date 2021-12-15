--select * from Marketing_campaign

-- select data that we going to be using

--caculate the Age of Customer
--reorganize Marital_Status and Child_Status
--calculate total Spending by adding all spending on items

select ID, (year(Dt_Customer) - Year_Birth) as Age, Education, 
case when Marital_Status in ('YOLO', 'Single', 'Alone') then 'Single'
when Marital_Status in ('Together', 'Married') then 'Couple'
else 'Others'
end
as Marital_Status, 
Income, (Kidhome + Teenhome) as Child_Status, 
Recency, (MntFishProducts + MntFruits + MntGoldProds + MntMeatProducts + MntSweetProducts + MntWines) as Spending, MntWines, 
MntFruits, MntMeatProducts, MntFishProducts, MntSweetProducts, MntGoldProds, NumDealsPurchases
from Marketing_campaign

-- create table 1 and insert data was selected

drop table if exists Customer_Information
create table Customer_Information (
ID float, Age float, Education nvarchar(255), Marital_Status nvarchar (255), Income float, Child_Status float, Recency float,
Spending float, MntWines float, MntFruits float, MntMeatProducts float, MntFishProducts float, MntSweetProducts float,
MntGoldProds float, NumDealsPurchases float)
Insert into Customer_Information
select ID, (year(Dt_Customer) - Year_Birth) as Age, Education, 
case when Marital_Status in ('YOLO', 'Single', 'Alone') then 'Single'
when Marital_Status in ('Together', 'Married') then 'Couple'
else 'Others'
end
as Marital_Status, 
Income, (Kidhome + Teenhome) as Child_Status, 
Recency, (MntFishProducts + MntFruits + MntGoldProds + MntMeatProducts + MntSweetProducts + MntWines) as Spending, MntWines, 
MntFruits, MntMeatProducts, MntFishProducts, MntSweetProducts, MntGoldProds, NumDealsPurchases
from Marketing_campaign

--select * from Customer_Information

--created another table 

drop table if exists Distribution_channels
create table Distribution_channels (
ID float, NumStorePurchases float, NumDealsPurchases float, NumCatalogPurchases float, NumWebPurchases float, 
NumWebVisitsMonth float, WebConversionRate float)
insert into Distribution_channels
Select ID, NumStorePurchases, NumDealsPurchases, NumCatalogPurchases, NumWebPurchases, NumWebVisitsMonth, 
case when NumWebVisitsMonth = 0 then null else round((NumWebPurchases/(NumWebVisitsMonth*24))*100,2) end as WebConversionRate
from Marketing_campaign

--select * from Distribution_channels