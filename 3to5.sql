create database 3to5;
use 3to5;
create table students(Id int,Name varchar(20), Age int ,Course Varchar(20));
Insert into students values( 10,"Suman", 35,"DA");
Insert into students values( 20,"Vishal", 25,"DS");
select * from students;
 set sql_safe_updates=0;
delete from students where name ="suman";
desc students;
use 3to5;
select * from myemp;
select emp_id, salary from myemp;
select * from myemp limit 10;
select emp_id, salary from myemp limit 10;
select emp_id, salary from myemp order by salary desc limit 10;
select * from myemp where dep_id=60 or dep_id=90;
select * from myemp where dep_id=60 or dep_id=90 or job_id="pu_clerk";
select * from myemp where dep_id=60 and job_id="it_prog";
select * from myemp where dep_id in (60, 90, 50, 30);
select * from myemp where dep_id in (60, 90, 50, 30) 
and job_id in("it_prog","pu_clerk");
use 3to5;
select * from myemp where dep_id not in (60, 90, 50, 30);
select * from myemp where salary between 10000 and 24000;
select * from myemp where salary =10000 or salary>10000 
order by salary desc;
select  distinct job_id from myemp;
select * from myemp where job_id is  not null;
select * from offices where state is  null;
select * from myemp where first_name like "s%";
select * from myemp where first_name like "s%" 
and last_name like "s%";
select * from customers;
select * from myemp;
select emp_id, First_name, job_id, salary from myemp;
select 3+5;
select (3+5) as sum;




select emp_id, First_name, job_id, salary, 
case JOB_ID 
when "Ad_vp" then salary*0.35
when "IT_prog" then salary * 0.30
 else salary*0.20 end as bonus from myemp; -- jghfhfvhjfjh
 
 select emp_id, First_name, job_id, salary, 
case 
when salary >18000 then salary*0.35
when salary between 9000 and 17500 then salary * 0.30
 else salary*0.20 end as bonus from myemp;
 
 
select emp_id, First_name, job_id, salary, 
case 
when salary >18000 then " high salary"
when salary between 9000 and 17500 then " normal salary"
 else " less salary" end as remarks from myemp;
 
select emp_id, first_name, job_id, dep_id, salary, 
case 
when job_id= "ad_vp" then salary*0.35
when salary>15000 then salary*0.35
when dep_id= 50 then salary* 0.40
else salary*0.30 end as bonus from myemp;

select emp_id, first_name, job_id, dep_id, salary, 
case 
when job_id= "ad_vp" and salary>15000 then salary*0.42
when dep_id= 50 then salary* 0.40
when salary>15000 then salary*0.35
else salary*0.30 end as bonus from myemp;

select * from offices;
select officecode, state, isnull(state) from offices;
select officecode, state, ifnull(state, "NA") as newstate from offices;
select state,addressline2, addressline1, 
coalesce(state,addressline2, addressline1) as newstate from offices;
select * from myemp;


select* from myemp order by hire_date desc;
select count(*) from myemp;
select count(Emp_id) from myemp;
select count(Emp_id) from myemp where dep_id=50;
select count(Emp_id) from myemp where job_id="IT_prog";
select count(Emp_id) as "No of people got hired in 1987"
 from myemp where year(hire_date)=1987 ;
 select dep_id , count(emp_id) from myemp group by dep_id;
 select mgr_id , count(emp_id) from myemp group by mgr_id;
 
 
 select dep_id , count(emp_id) from myemp  
 where salary>10000 group by dep_id;
  select dep_id , count(emp_id) from myemp  
 group by dep_id having  sum(salary)>10000 ;
 
 
 select mgr_id , count(emp_id) from myemp  
 where job_id= "it_prog" group by mgr_id 
  having count(emp_id)>1;
 
 
 -- sum function 
 select sum(salary) from myemp;
 select dep_id, sum(Salary) from myemp group by dep_id;
  select mgr_id, sum(Salary) from myemp group by mgr_id;
   select mgr_id, sum(Salary) from myemp 
   where salary>10000 group by mgr_id;
   -- avg
   select dep_id, avg(salary) from myemp group by dep_id;
   select dep_id, round(avg(salary),2) from myemp group by dep_id;
   
   select dep_id, avg(salary) from myemp 
   where salary >5000 group by dep_id;
      select dep_id, avg(salary) from myemp 
    group by dep_id having avg(salary) >5000;
    
    -- max function
    select max(salary) from myemp;
    select dep_id, max(salary),min(salary) from myemp group by dep_id;
    
    select mgr_id , count(emp_id) as "No. of employee",
    round(avg(salary)) as "average salary",
    round(sum(salary)) as "Total salary",
    round(Max(salary)) as "Maximum Salary",
    round(min(Salary)) as "Minimum salary"  from  myemp group by mgr_id;
   use classicmodels;
   select * from payments;
   use 3to5;
   create  table votercard
   ( uid varchar(12) unique, name varchar(20) not null,
     age int  check(age>18), country varchar(10) default "India");
     desc votercard;
	insert into votercard values (123456789012,"Ram", 20,"USA");
    select * from votercard;
    insert into votercard  (uid, name, age) 
    values (null,"Mohit", 12);
    create table classda( id int, name varchar(20) ,
    age int, country varchar(10));
    insert into classda values( 1, "Suman", 35, "India");
     alter table classda modify name varchar(20) not null;
     alter table classda modify id int unique;
     alter table classda alter country set default "India";
     alter table classda add check(age>18);
insert into classda values( 2, "Suman1", 15, "India");
use 3to5;
desc classda;
create table dummy1 ( id int primary key);
insert into dummy1 values(null);

create table dummy2 ( id int not null unique,
 name varchar(20) not null unique);
create table dummy3 ( id int , name varchar(20), primary key(id,name));
desc dummy3;
alter table dummy3 drop primary key;
alter table dummy3 add primary key(id,name);
insert into dummy3 values(1,"Rohit");
insert into dummy3 values(2,"Mohit");
insert into dummy3 values(2,"Vishal");
create table trainee ( id int , name varchar(20), dep_id int);
insert into trainee values( 101, "Vishal", 1), ( 102, "Seema", 2), (103, "Kunal",2);
create table dept( dep_id int , dname varchar(10), coursefee int);
insert into dept values (1,"DA",500), (2, "DS", 500);
alter table dept add primary key(dep_id);
desc dept;
alter table trainee add foreign key (dep_id) 
references dept(dep_id) on update cascade on delete cascade;
desc trainee;
select * from dept;
update dept set dep_id=20 where dname="DS";
select * from dept;
select * from trainee;
set sql_safe_updates=0;
delete from dept where dname="DS";






-- alter table classda modify id int;
-- alter table classda drop index  id;
-- alter table classda drop check age;
-- alter table classda alter country drop default ;
    
    
    
    create table demo( id int unique);
    insert into demo values(null);
    select * from demo;
    
    
    
    use 3to5;
    select * from members;
    select * from movies;
select id,title,first_name from movies join members
on movies.id=members.movieid;
    USE 3TO5;
    SELECT * FROM STUDENTS;
    RENAME TABLE STUDENTS to Learners;
    
    select * from Learners;
    truncate table Learners;
    drop table Learners;
    use classicmodels;
select * from products;
create table pro2  as select * from products;
select * from pro2;
create table pro3  as select * from products;
select * from pro3;
truncate table pro2;
set sql_safe_updates=0;
delete from pro3 ;
use 3to5;
select * from myemp;
create view v1 as select * from myemp order by salary desc limit 10 ;
select * from v1;
alter view v1 as select Emp_id, salary from myemp 
order by salary desc;
drop view v1;
select * from global;
select * from global where rowid=40470;
create index newindex on  global(rowid);
desc global;
show indexes from global;
select * from global where rowid=40470;
select * from global;
create table indiadetails(id int, name varchar(20), PNO char(10));
select * from indiadetails;
create unique index  i2 on indiadetails(id,name);
show indexes from indiadetails;
insert into indiadetails values( 1, "Suman", "1234567890");
insert into indiadetails values( 1, "Sumandeep", "1234567890");
insert into indiadetails values( 2, "Suman", "1234567890");
insert into indiadetails values( 1, "Suman", "1234567890");
truncate indiadetails;
drop index i2 on indiadetails;
create unique index i2 on indiadetails(name, pno);
delimiter //
CREATE  PROCEDURE display_data1()
BEGIN
select * from myemp;
END//
delimiter ;

use classicmodels;
call 3to5.display_data1; 
call out_proc(@a); 
select @a;
call inout_proc(121,130,@a);
select @a;

use 3to5;
select @a;
select cube1(7);

select *, count(emp_id) over () as "no of emp" from myemp;

select * , max(salary) over(),min(salary) over(), 
avg(salary) over() from myemp;
 
select First_name,dep_id ,salary, max(salary) over(partition by dep_id) as max,
min(salary) over(partition by dep_id) as min, 
avg(salary) over(partition by dep_id) as avg from myemp;
 
 CREATE TABLE NEWEMP LIKE MYEMP;
 
 
 create table tab1 ( id int);
 insert into tab1 values(1),(2),(3), (4);
 select * from tab1;
 create table tab2 ( id int);
 insert into tab2 values(1),(2),(5), (6);
 select * from tab2;
 select id from tab1 union select id from tab2;
 select id from tab1 union all select id from tab2;
 select id , title, first_name from movies left join members on 
 movies.id = members.movieid union
 select id , title, first_name from movies right join members on 
 movies.id = members.movieid;
    select id , title, first_name from movies left join members on 
 movies.id = members.movieid union all
 select id , title, first_name from movies right join members on 
 movies.id = members.movieid;
 select * , nth_value(salary, 5) over ( order by salary desc) from myemp;
 select * from myemp;
select * , nth_value(salary, 5) over () from myemp;
select  *,nth_value(salary,2) over(order by salary desc)from myemp limit 1;

select * from myemp order by salary desc limit 2,1;


 with newemp as
 (select *, dense_rank() over (order by salary desc)as rnk from myemp) 
select * from newemp where rnk=6;

select first_name from myemp order by salary desc limit 1; 
with newemp as
 (select *, dense_rank() over (order by salary desc)as rnk from myemp) 
select first_name from newemp where rnk=1;

select * from myemp where salary >(select avg(Salary) from myemp);

select avg(Salary) from myemp;
select * from offices;
select * from employees;
select  * from employees where officecode in 
(select officecode from offices where country="Usa");


create table tab12(id int , name varchar(20), unique(id));
insert into tab12 values(1,"sum");

insert into tab12 values(  null,"sum");
select * from tab12;
create table tab21(id int , name varchar(20), unique(name));
insert into tab21 values(1,"sum");
insert into tab21 values(  2,null);
insert into tab21 values(  3,null);
insert into tab21 values(  5,"");

    select * from tab11;
    drop table tab11;
create table tab11(id int , name varchar(20), constraint c1 unique(id,name));
show indexes from tab11;
desc tab11;


insert into tab11 values(1,"sum");
insert into tab11 values(  2,null);
insert into tab11 values(  null,"id");
desc tab11;
    use 3to5;
 select * from books;   
    SELECT * FROM 3to5.books;
alter table books add column books_sold int default 0;
update books set books_sold= books_sold+2 where bookid=1;
update books set books_sold= books_sold+3 where bookid=1;
select * from books;
select * from book_sales;
create table ewh (emp_id int, name varchar(20), w_hour int);
insert into ewh values(1, "Suman",40),(2,"Vishal",30),(3,"Manoj",-35);
select * from ewh;
insert into ewh values(4,"Saroj",-40);
update ewh set w_hour=35 where emp_id=3;


create table g_trans(id int not null, name varchar(20),amt int,
 tot datetime);
 create table f_trans(id int, name varchar(20), msg varchar(30) 
 default "fraud transaction", amt int, tot datetime);
 alter table g_trans modify amt decimal(10,3);
 alter table f_trans modify amt decimal(10,3);
 select * from g_trans;
 select * from F_trans;
 