use sqlbasics;
--  Write a query to create a students table with the student ID, first name, last name, class, and age fields and ensure that the last name, first name, and student ID fields have the NOT NULL constraint and that the student ID field is a primary key:
create table students (
std_id varchar(20) not null primary key,
first_name varchar(20) not null,
last_name varchar(20) not null,
class varchar(10),
age int);

-- Write a query to create a marksheet table with score, year, ranking, class, and student ID fields:
create table marksheet (
score int,
year int,
ranking varchar(20),
class varchar(10),
std_id varchar(20) not null);

-- Write a query to insert values into the students table:
insert into students(std_id, first_name, last_name, class, age)
values (1,'krishna','gee',10,18),
(2,'stephen','christ',10,17),
(3,'kailash','kumar',10,18),
(4,'ashish','jain',10,16),
(5,'khushbu','jain',10,17),
(6,'madhan','lal',10,16),
(7,'sourabh','kothari',10,15),
(8,'vinesh','roy',10,14),
(9,'rishika','r',10,15),
(10,'sara','rayan',10,16),
(11,'rosy','kumar',10,16);

Select*from students;

-- Write a query to insert values into the marksheet table:
insert into marksheet (score, year, ranking, class, std_id)
values (989,2014,1,10,1),
(454,2014,10,10,2),
(880,2014,4,10,3),
(870,2014,5,10,4),
(720,2014,7,10,5),
(670,2014,8,10,6),
(900,2014,3,10,7),
(540,2014,9,10,8),
(801,2014,6,10,9),
(420,2014,11,10,10),
(970,2014,2,10,11),
(720,2014,12,10,12);

Select*from marksheet;

-- Write a query to display the student ID and first name of every student in the students table whose age is greater than or equal to 16 and whose last name is Kumar:
select std_id, first_name from students where age>=16 and last_name='kumar';

-- Write a query to display the details of every student from the marksheet table whose score is between 800 and 1000:
select*from marksheet where score between 800 and 1000;
select s.std_id, s.first_name, m.score from students s left join marksheet m on s.std_id=m.std_id where score between 800 and 1000;
-- Write a query to increase the score in the marksheet table by five and create a new score column to display this new score:
select*,score+5 as new_score from marksheet;

-- Write a query to display the marksheet table in descending order of the score:
select*from marksheet order by score desc;

-- Write a query to display the details of every student whose first name starts with an ‘a':
select*from students where first_name like 'a%';

-- You are required to identify the rank and row number and calculate the cumulative distribution and percentile score based on the student score from the marksheet table:
select s_id, score, rank() over (order by score desc) my_rank, percent_rank() over (order by score desc) percentile_rank, row_number() over (order by score) row_num, cume_dist() over (order by score) cum_dist_value from marksheet_datasets;