-- print employee data
select * from company.emp_data;

-- print employee data with different columns  
select ï»¿EEID,FullName,Department from company.emp_data;

-- where clause
select * from company.emp_data where City="Seattle";

-- where clause with multiple columns or multiple conditions with AND condition
select * from company.emp_data where City="Seattle" and Gender="Male";

-- where clause with multiple columns or multiple conditions with OR condition
select * from company.emp_data where City="Seattle" or Gender="Male";

-- where clause with multiple columns or multiple conditions with NOT condition
select * from company.emp_data where not Gender="Male";

-- LIKE condition
select * from company.emp_data where Fullname like "%kumar%";

-- orderby condition ascending
select * from company.emp_data order by Department asc;

-- orderby condition multiple columns ascending descending
select * from company.emp_data order by Department asc, Age desc;

-- limit upto 10
select * from company.emp_data limit 10;

-- limit starts from 5 and goes upto 5 more
select * from company.emp_data limit 5,5;

-- BETWEEN condition
select * from company.emp_data where Age between 50 and 60 order by Age desc;

-- IN condition multiple columns get inside
select * from company.emp_data where Department in ("IT","Finance") order by Department asc;

-- NOT IN condition print rest 
select * from company.emp_data where Department not in ("IT","Finance") order by Department asc;

-- IN condition with multiple columns
select * from company.emp_data where Department in ("IT","Finance") and Country in ("United States")order by Department asc;

-- STRING function
-- concatinate
select concat(JobTitle," - ",Department) as Designation from company.emp_data order by Designation asc;

-- Most useful concat_ws
select concat_ws(" - ",JobTitle,Department,Gender) as EmployeeDetails from company.emp_data order by EmployeeDetails asc;

-- length
select FullName, length(FullName) as digitCount from company.emp_data order by digitCount desc;

-- uppercase and lowercase
select FullName, upper(FullName) as UPPERCASE from company.emp_data;
select FullName, lower(FullName) as lowercase from company.emp_data;

-- print left words,right,mid
select FullName, left(FullName,4) as username from company.emp_data;
select FullName, right(FullName,4) as username from company.emp_data;
select FullName, mid(FullName,2,8) as username from company.emp_data;

-- data aggregation numerice funcion
-- sum
select sum(Age) as TotalSum from company.emp_data;

-- count
select count(FullName) as TotalCustomers from company.emp_data;

-- average
select avg(Age) as AverageAge from company.emp_data;

-- max
select max(Age)  as AverageAge from company.emp_data;

-- min
select min(Age) as AverageAge from company.emp_data;

-- remove decimal values 0 decimal value hogi
select truncate(AnnualSalary,0) as amount from company.emp_data;

-- round of to higher last value
select ceil(amount) as roundoffvalue from company.emp_data;

-- round of to lower last value
select floor(amount) as roundoffvalue from company.emp_data;

-- Date functions
select date(Payment_date) as dates from company.emp_data;

-- Time functions
select time(Payment_date) as dates from company.emp_data;

-- Difference between two dates columns
select datediff(HireDate,ExitDate) as dates from company.emp_data;

-- day, dayname, month, monthname, year, hour, minute, second
select day(HireDate) as daynumbers from company.emp_data;
select dayname(HireDate) as daynames from company.emp_data;
select month(HireDate) as monthnumbers from company.emp_data;
select monthname(HireDate) as monthnames from company.emp_data;
select year(HireDate) as years from company.emp_data;
select hour(HireDate) as hours from company.emp_data;
select minute(HireDate) as minutes from company.emp_data;

-- Case operator in mYSql 
-- case variable here we use when then as if else ,here only one condition
select FullName, Department, Gender, Age,
case 
     when Age>50 then "Retired"
     else "Not Retired"
end as UpdatedEmployees from company.emp_data order by Age;

-- here for multiple conditions
select FullName, Department, Gender, Age,
case 
     when Age>=50 then "OLD PERSON"
	 when Age<=30 then "YOUNG PERSON"
     else "AVERAGE AGE"
end as UpdatedEmployees from company.emp_data order by Age;

-- Group by
select Department, count(ï»¿EEID) from company.emp_data group by Department order by count(ï»¿EEID) asc;
select Gender, count(ï»¿EEID) from company.emp_data group by Gender order by count(ï»¿EEID) asc;

-- Having clause use hoga group by ke sath, groupby ke sath where ka use nhi hota
-- count
select Department, count(ï»¿EEID) from company.emp_data group by Department having count(ï»¿EEID)>200;

-- sum
select Department, sum(AnnualSalary) from company.emp_data group by Department having sum(AnnualSalary);

-- joins in(inner, left, right, cross)
-- inner joins means common data

-- synatx of inner join
-- select table1.column1, table2.column1
-- from table1 inner join table2 on
-- table1.matchingcolumn=table2.matching column

select products.productName, orderdetails.quantityOrdered from company.emp_data
inner join orderdetails
on product.productCode=orderdetails.ProductCode;

-- inner join group by
select products.productName, sum(orderdetails.quantityOrdered) from company.emp_data
inner join orderdetails
on product.productCode=orderdetails.ProductCode
group by products.prouctName;
 
-- left mei left vala aur common milega
select products.productName, orderdetails.quantityOrdered 
from company.emp_data left join orderdetails
on product.productCode=orderdetails.productCode;

-- right mei right vala aur common milega
select products.productName, orderdetails.quantityOrdered 
from company.emp_data right join orderdetails
on product.productCode=orderdetails.productCode;

-- outer join cross join mei pura milega A B aur common
select * from products cross join orderdetails;

-- set operator
select *from google.employee1;
select *from microsoft.employee2;

-- union and union all
select first_name,department_name from google.employee1
union
select first_name,department_name from microsoft.employee2;

-- intersect
select first_name,department_name from google.employee1
where first_name in (select first_name from microsoft.employee2);

-- except means only A
select first_name,department_name from google.employee1
where first_name not in (select first_name from microsoft.employee2);

-- subqueries
select * from company.emp_data where Age > 
(select avg(Age) from company.emp_data)order by Age asc;

-- views in sql views are virtual tabel
create view newview as
select Country, count(ï»¿EEID) from company.emp_data group by Country;

-- stored procedure in my sql
Delimiter &&
create procedure get_data()
begin 
     select * from company.emp_data;
end &&
Delimiter ;
call company.get_data()

-- in
Delimiter &&
create procedure get_limit(in var int)
begin 
     select * from company.emp_data limit var;
end &&
Delimiter ;
call company.get_data();
call company.get_limit(3)

-- out
Delimiter &&
create procedure get_credit(out var int)
begin 
     select max(Age) into var from company.emp_data;
end &&
Delimiter ;
call company.get_data();
call company.get_limit(3);
call company.credit_limit(@m);
select @m

-- inout
Delimiter &&
create procedure get_name(inout var int)
begin 
     select FullName from company.emp_data where Department=var;
end &&
Delimiter ;
set@m=125;
call company.credit_name(@m);
select @m;

-- window functions
select * from hp.products;
select CustomerID, PaymentMethod, Product, sum(Quantity)
from hp.products group by CustomerID, PaymentMethod, Product;

-- correct method to get total 
select CustomerID, PaymentMethod, Product, sum(Quantity)
over (partition by PaymentMethod order by Product)from hp.products;

-- row number
select Product,row_number()
over(partition by Products.Product) from hp.products; 

-- rank
select CustomerID, PaymentMethod, Product, rank()
over (partition by PaymentMethod order by Product)from hp.products;

-- dense rank
select CustomerID, PaymentMethod, Product, dense_rank()
over (partition by PaymentMethod order by Product)from hp.products;






















