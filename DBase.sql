create database tipster;
use tipster;
drop table if exists tips;
create table if not exists tips(
selection varchar(255),
odds decimal,
probability int,
ratings int,
league varchar(100),
hometeam varchar(100),
awayteam varchar(100),
datee varchar(100),
timee time,
rate varchar(100)
);
load data  
infile '/var/lib/mysql-files/outputter.csv'
 into table tips
 fields terminated by ","
 ignore 1 lines;
 #truncate table tips;
select * from tips
limit 5