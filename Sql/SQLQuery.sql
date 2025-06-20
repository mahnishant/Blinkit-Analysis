select * from blinkit_data

select cast(sum(total_sales) /1000000 as decimal(10,2)) as Total_Sales_millions
from blinkit_data
where Outlet_Establishment_Year= 2020

select cast( avg(total_sales) as int) as Avg_sales
from blinkit_data
where Outlet_Establishment_Year =2022

select count(*) as no_of_items from blinkit_data
where Outlet_Establishment_Year =2020

select cast(avg(Rating) as decimal(10,2)) as Avg_rating 
from blinkit_data


select Item_Fat_Content , 
	   Cast(Sum(total_sales)/1000 as decimal(10,2)) as TotalSales_thousands,
	   cast( avg(total_sales) as decimal(10,2)) as Avg_sales,
	   count(*) as no_of_items,
	   cast(avg(Rating) as decimal(10,2)) as Avg_Rating
from blinkit_data
group by Item_Fat_Content
order by TotalSales_thousands

select TOP 10 Item_Type , 
	   Cast(Sum(total_sales)/1000 as decimal(10,2)) as TotalSales_thousands,
	   cast( avg(total_sales) as decimal(10,2)) as Avg_sales,
	   count(*) as no_of_items,
	   cast(avg(Rating) as decimal(10,2)) as Avg_Rating
from blinkit_data
group by Item_Type
order by TotalSales_thousands DESC

Select Outlet_Location_Type,
		isnull([Low Fat],0) as Low_Fat,
		isnull([Regular],0) as Regular
From
(
select Outlet_Location_Type, Item_Fat_Content , 
	   Cast(Avg(Rating) as decimal(10,2)) as AvgRating
from blinkit_data
group by Outlet_Location_Type, Item_Fat_Content
) As SourceTable
PIVOT
(
	sum(AvgRating)
	for Item_Fat_Content in ([Low Fat],[Regular])
	) as PivotTable
	order by Outlet_Location_Type



select Outlet_Establishment_Year,
	   Cast(Sum(total_sales)/1000 as decimal(10,2)) as TotalSales_thousands,
	   cast( avg(total_sales) as decimal(10,2)) as Avg_sales,
	   count(*) as no_of_items,
	   cast(avg(Rating) as decimal(10,2)) as Avg_Rating
from blinkit_data
group by Outlet_Establishment_Year
order by Outlet_Establishment_Year


select Outlet_Size, 
		Cast(Sum(total_sales) as decimal(10,2)) as total_sales,
		Cast(Sum(total_sales) *100.0 / sum(sum(total_sales)) over() AS decimal(10,2)) as SalesPercentage 
from blinkit_data
group by Outlet_Size
order by total_sales DESC

select Outlet_Location_Type,
	   Cast(Sum(total_sales) as decimal(10,2)) as total_sales,
	   Cast(Sum(total_sales) *100.0 / sum(sum(total_sales)) over() AS decimal(10,2)) as SalesPercentage,
	   cast( avg(total_sales) as decimal(10,2)) as Avg_sales,
	   count(*) as no_of_items,
	   cast(avg(Rating) as decimal(10,2)) as Avg_Rating
from blinkit_data
where Outlet_Establishment_Year =2011
group by Outlet_Location_Type
order by total_sales desc

select Outlet_Type,
	   Cast(Sum(total_sales) as decimal(10,2)) as total_sales,
	   Cast(Sum(total_sales) *100.0 / sum(sum(total_sales)) over() AS decimal(10,2)) as SalesPercentage,
	   cast( avg(total_sales) as decimal(10,2)) as Avg_sales,
	   count(*) as no_of_items,
	   cast(avg(Rating) as decimal(10,2)) as Avg_Rating
from blinkit_data
group by Outlet_Type
order by total_sales desc