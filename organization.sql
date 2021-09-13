# create database
create database organization;

# use database for further work
use organization;

# create a table and define column name  while creating a table
create table ee_details (ee_id int not null unique auto_increment ,
	first_name varchar(20),	
    last_name varchar (20),	
    gender char(5),	DOJ date,   
    DOB	date , 
    dept_name varchar(20));
    
# alter ee_id data constraint:- auto_increment  start with 1001
alter table ee_details
 auto_increment =1001 ;

# now insert values on particular columns
insert into ee_details(first_name, last_name,gender,DOJ	,DOB,dept_name)
values ('kiran','sharma','f','2020-03-16','1996-01-01','FINANCE'),
('mahima','khanna','f','2020-02-20','1995-08-05','MARKETING'),
('prem','kapoor','m','2020-03-16','1994-09-04','HR'),
('ishika','mehra','f','2020-01-15','1996-01-01','DATA ANALYST'),
('karan','verma','m','2020-01-19','1997-09-06','OPERATIONS'),
('afsha	','akhtar','f','2020-01-25','2001-02-15','SALES'),
('khusboo','verma','f','2020-10-14','2000-05-16','PURCHASE'),
('karishma','singh','f','2020-10-16','1995-01-27','IT'),
('sid','khan','	m','2020-10-15','1997-10-30	','BUSINESS ANALYST'),
('shashi','	morya','f','2020-01-27','1998-09-25','FINANCE'),
('meena	','sharma','f','2020-03-10','1996-02-16	','MARKETING'),
('shalu	','singh','	f','2021-04-02','1999-03-29','HR'),
('navneet','singh','m','2021-04-02','1997-05-05','DATA ANALYST'),
('priyanka','batra','f'	,'2021-04-03','2000-09-05','OPERATIONS'),
('kajol','mehta','f','2021-04-08','	1995-08-07','SALES'),
('leela','shah','f','2020-01-21','1996-08-11','PURCHASE'),
('rupali','ganguly','f','2020-03-21','1999-07-13','IT'),
('nidhi','gupta','f','2021-04-19','1996-04-21','BUSINESS ANALYST'),
('kalpana','joshi','f','2021-04-06','1998-09-27','FINANCE'),
('khusboo','bhatt','f','2021-09-01','1997-10-18','MARKETING'),
('chandni','nair','	f','2021-09-02','1997-04-09','HR'),
('mehul','modi','m','2021-09-01	','1996-07-11','DATA ANALYST'),
('farukh','saeed','m','2021-09-02','1994-06-03','OPERATIONS'),
('ansh','kapoor','m','2020-10-16','1998-12-02','SALES'),
('kanina','kaur','f','2020-03-16','1997-06-24','PURCHASE');

# fetch data from ee_details
select*from ee_details;

/* now we are going to communicate our database with the help of mysql queries*/

-- let's see the data without duplication ;
select distinct *from ee_details;

-- retrieve all data where dept_name is finance;
select*from ee_details
where dept_name = 'finance';

-- where clause with and;
select first_name,ee_id  from ee_details
where ee_id > 1005 and gender ='f' ;

-- where clause with or ;
select * from ee_details
where ee_id <1005 or gender='m';

-- where clause with not;
select*from ee_details
where not ee_id >1005;

-- order by (ascending / desending);
select *from ee_details
order by dept_name desc;

select*from ee_details
order by dept_name asc;

-- check if null values is or not in data;
select ee_id,first_name,last_name from ee_details
where gender is null;

select ee_id,first_name from ee_details
where gender is not null;

-- limit - specify the no. of records;
select*from ee_details
where dept_name='sales'
order by dept_name desc
limit 2;

-- min;
select min(ee_id)  from ee_details;

-- max;
select max(dept_name) from  ee_details;

-- count;
select count(gender) from ee_details;
select count(*) from ee_details;

-- avg;
select avg(ee_id) from ee_details;

-- sum;
select sum(ee_id)from ee_details;

/* concatenation
as - alias (temporary name)*/

select concat(first_name,'  ',last_name) as full_name  from ee_details;

-- like
select *from ee_details
where first_name like 'k%' ;

select*from ee_details
where first_name like 'k____';

select *from ee_details
where first_name like '_i%';

-- in operator;
select *from ee_details
where dept_name in ('finance','sales');

-- between;
select ee_id,first_name,doj,dob
from ee_details
where ee_id between 1001 and 1010;

-- group by
select *from ee_details
where gender='f'
group by dept_name;

select count(*),dept_name from ee_details
group by dept_name;

-- having;
select count(*)as number ,dept_name from ee_details
group by dept_name
having count(dept_name)>1
order by number asc ;

-- cases;
select first_name,last_name,dob,dept_name,
case
    when gender ='f' then ' employee is female'
    when gender ='m' then 'employee is male'
    else 'none'
end as gender_details
from ee_details;

-- alter column name:
alter table ee_details change gender GENDER char(2);
select*from ee_details;

-- modify column data type:
alter table ee_details
modify column gender varchar(5) not null;

-- length :
select length(first_name), first_name from ee_details;

-- right:
select right(first_name,2),first_name from ee_details;

-- left:
select left(first_name,2),first_name from ee_details;

-- instr - it show position of particular string:
select instr(first_name,"a" ) , first_name from ee_details;

-- mid:
select mid(first_name,2,3), first_name from ee_details;

-- upper:
select upper(first_name) from ee_details;

-- lower:
select lower(first_name) from ee_details;

-- substr:
select substr(first_name,2,3) from ee_details;

-- datetime:
select curdate();
select curdate() + 10;
select sysdate();
select dayofmonth('2020-2-26');
select dayname('2021-09-11');
select dayofyear('2021-09-11');
select day('2021-09-11');
select now();
select year('2021-09-11');
select month('2021-09-11');
select monthname('2021-09-11');


-- add a new column :
alter table ee_details
add column age int not null;

insert into ee_details
(ee_id,age)
values
(1001,25),
(1002,26),
(1003,27),
(1004,25),
(1005,24),
(1006,20),
(1007,21),
(1008,26),
(1009,23),
(1010,22),
(1011,25),
(1012,22),
(1013,24),
(1014,21),
(1015,26),
(1016,25),
(1017,22),
(1018,25),
(1019,22),
(1020,23),
(1021,24),
(1022,25),
(1023,27),
(1024,22),
(1025,24)
on duplicate key update 
age= values(age);

select*from ee_details;
-- # there must be only one auto_increment column and that must be defined on that column which is primary key.:

/* view :- view is a virtual table , with the help of view statement , 
user can give a access to other to see limited column of table so, by this security maintain */
create view imp_column as
select ee_id,first_name,last_name,age
from ee_details
where dept_name= 'Hr';

select *from imp_column;

show create view imp_column;

alter view imp_column as
select ee_id,first_name,last_name,age,dept_name
from ee_details
where dept_name like  'Data A%';

select*from imp_column;

/* drop view
drop view imp_column*/

-- store procedure help to save code to reuse over and over again

Delimiter //
create procedure operations_ee()
begin
    select*from ee_details
    where dept_name ='operations';
end //

delimiter ;

call  operations_ee();

delimiter &&
create procedure ee_greater_than_21(in n int)
begin
    select*from ee_details where age > 21 limit n;
end &&
delimiter ;

drop procedure if exists ee_greater_than_21;

call ee_greater_than_21(5);

insert into ee_details values (1026,'aman','reddy','m','2020-3-16','1994-5-19','finance',27);
select*from ee_details;    

-- triggers;
-- Before trigger;

delimiter //
create trigger sample_trigger
before insert on ee_details for each row
begin
IF NEW.age < 0  THEN SET NEW.age = 0;
END IF;
end //
delimiter ;
/* now i am going to insert age value which is against trigger.*/
insert into ee_details values(1027,'gopi','nath','m','2020-3-16','1996-10-27','sales',-24);
/* but trigger correct it(if age less than 0 in then convert into 0 because age never be in minus ) here trigger
 help us to rectify it ,if user enter incorrect value*/
select*from ee_details;
use organization;
alter table ee_details
add column c_id int;

alter table ee_details
add foreign key (c_id) references ee_city(c_id);

insert into ee_details
(ee_id,c_id) values(1001,1),
(1002,2),
(1003,3),
(1004,7),
(1005,5),
(1006,7),
(1007,2),
(1008,4),
(1009,3),
(1010,4),
(1011,3),
(1012,7),
(1013,1),
(1014,1),
(1015,5),
(1016,4),
(1017,3),
(1018,7),
(1019,6),
(1020,6),
(1021,1),
(1022,2),
(1023,5),
(1024,7),
(1025,6),
(1026,2),
(1027,1)
on duplicate key update
c_id=values(c_id);

select*from ee_details;


-- now i am goinfg to create a new table;

create table ee_city(c_id int,city varchar(8), primary key(c_id));

alter table ee_city
modify column city varchar (8) not null ;

alter table ee_city
add check (c_id <=7);

alter table ee_city
alter city set default 'delhi';

insert into ee_city(c_id,city)
values 
(2,'MUMBAI'),
(3,'UP'),
(4,'ASSAM'),
(5,'BIHAR'),
(6,'GUJRAT'),
(7,'GOA');

select*from ee_city;

insert into ee_city (c_id) values (1);


/*trigger after insert
delimiter //
create trigger after_trigger
after insert on ee_details for each row
begin
INSERT INTO ee_details VALUES (new.first_name,new.last_name,CURTIME());  
END //  

drop trigger if exists after_trigger;
select*from ee_details;

insert into ee_details values 
(1028,'komal','rexwal','f','2020-10-16','1994-6-24','sales',27,2)*/




 select*from ee_city;
 select*from ee_details;
 use organization;
 
 -- index:
 /* lets execute command  without index commands */
 select * from ee_details
 where first_name like '%a____';
 
 /* without index command , above query take 0.063 sec to fetch data
 and now we are going to execute above command with index command */
 
 create index f_name
 on ee_details(first_name);
 -- lets rerun above command to check how much time its take to fetch data with index command;
  select * from ee_details
 where first_name like '%a____';
 
 -- here time taken by above query is 0.000 sec;
 
 -- drop index
 drop index f_name
 on ee_details;
 
 -- joins
/* inner_join
 left_join
 right_join
 cross join
*/ 
 -- inner join;
 select con from ee_details
 inner join ee_city on ee_details.c_id=ee_city.c_id;
 
 -- inner join with alias(temporary name)
 select e.ee_id,e.first_name,e.dob,e.doj,e.dept_name,e.age,c.city
 from ee_details as e
 inner join ee_city as c on e.c_id =c.c_id
 where c.city='mumbai';
 -- left join 
 select * from ee_details as e
 left join ee_city as c on e.c_id =c.c_id;
 
-- RIGHT JOIN; 
select * from ee_details as e
right join ee_city as c on e.c_id =c.c_id;

-- Cross join;
select*from ee_details
cross join ee_city ;

select e.first_name,e.dob,c.city
from ee_details as e
cross join ee_city as c;

select e.first_name,e.dob,c.city
from ee_details as e
, ee_city as c;

-- union
select ee_id,first_name from ee_details
union
select c_id, city from ee_city;

-- union all;
select ee_id,first_name from ee_details
union all
select c_id , city from ee_city;
use organization;

/* table rename 
alter table ee_details rename to e_details*/






 
 
 
 














