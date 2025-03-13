/* --------------------------------- B561 Assignment 6, Fall 2023 ---------------------------------*/


/* --------------------------------- Create tables ---------------------------------*/
DROP TABLE IF EXISTS Person;
CREATE TABLE Person(pid integer,
                    pname text,
                    primary key (pid));

DROP TABLE IF EXISTS Company;
CREATE TABLE Company(cname text,
                     headquarter text,
                     primary key (cname));

DROP TABLE IF EXISTS worksFor;
CREATE TABLE worksFor(pid integer,
                      cname text,
                      salary integer,
                      primary key (pid),
                      foreign key (pid) references Person (pid),
                      foreign key (cname) references Company(cname));


/* --------------------------------- Insert into Company (run this only once) ---------------------------------*/
INSERT INTO Company VALUES
     ('Apple', 'Cupertino'),
     ('Amazon', 'Seattle'),
     ('Google', 'MountainView'),
     ('Netflix', 'LosGatos'),
     ('Microsoft', 'Redmond'),
     ('IBM', 'NewYork'),
     ('ACM', 'NewYork'),
     ('Yahoo', 'Sunnyvale'),
     ('Adobe','Georgia'),
     ('Nvidia','Austin'),
     ('Splunk','Pittsburgh'),
     ('Databricks','Seattle'),
     ('Salesforce','Indianapolis'),
     ('RedHat','Redmond'),
     ('Stripe','LosGatos');


/* --------------------------------- Populate the tables with random data ---------------------------------*/

CREATE OR REPLACE FUNCTION insertNewRecords(recSize int)
RETURNS VOID AS 
$$ 

-- Delete existing records
 DELETE FROM worksFor;
 DELETE FROM Person;
 
-- Generate random values for the Person Table
INSERT INTO Person (pid,pname) 
   SELECT
   *,(ARRAY['Jake','John','Tim','Bob','O.J','Chris', 'Rock','Fred','Seema','Nirma',
			'Oscar','Michael','Craig','Simpson','Lata','Will' ,'Smith','Bruce','Wayne',
		    'Luffy','Zoro','Sanji','Nami','Chopper','Usopp','Brook','Robin','Franky',
		    'Yamato','Shanks','Kaido','Linlin','Teach','Link','Dante'])
			[floor(random() * (34) + 1) :: int]
   FROM generate_series(1001,1001 + recSize,1);

-- Generate random values for the worksFor Table
INSERT INTO worksFor
   SELECT p.pid,
   (ARRAY(SELECT cname FROM company))[floor(random() * (14) + 1) :: int],
   floor(random()*(85000 - 20000)) :: int
   from Person p;

$$ LANGUAGE SQL;


/* --------------------------------- Explanation ---------------------------------*/

-- 3

-- Clears and Inserts New Records in Person and worksFor
select * from insertNewRecords(100); -- 1000, 10000

-- View records
select * from Person;
select * from worksFor;

-- https://www.postgresql.org/docs/current/sql-explain.html
explain analyze select pid, cname
				from worksFor where salary between s1 and s2;
				-- test across different values for s1 and s2

-- my code
-- 100 records without index
DELETE FROM worksFor;
select * from insertNewRecords(100);
select * from worksFor;
vacuum;

explain analyze select pid, cname
from worksFor where salary between 60000 and 100000;

vacuum;

explain analyze select pid, cname
from worksFor where salary between 80000 and 1100000;

-- 1000 records without index
DELETE FROM worksFor;
select * from insertNewRecords(1000);
select * from worksFor;
vacuum;

explain analyze select pid, cname
from worksFor where salary between 60000 and 100000;

vacuum;

explain analyze select pid, cname
from worksFor where salary between 80000 and 1100000;

-- 100000 records without index
DELETE FROM worksFor;
select * from insertNewRecords(100000);
select * from worksFor;
vacuum;

explain analyze select pid, cname
from worksFor where salary between 60000 and 100000;

vacuum;

explain analyze select pid, cname
from worksFor where salary between 80000 and 1100000;

-- Test your Indexes 
-- create index ...

-- my code with index
-- 100 records with index
DELETE FROM worksFor;
DROP INDEX IF EXISTS sal_idx;

select * from insertNewRecords(100);
select * from worksFor;

CREATE INDEX sal_idx ON worksFor(salary);
vacuum;

explain analyze select pid, cname
from worksFor where salary between 60000 and 100000;

vacuum;

explain analyze select pid, cname
from worksFor where salary between 80000 and 1100000;

-- 1000 records with index
DELETE FROM worksFor;
DROP INDEX IF EXISTS sal_idx;

select * from insertNewRecords(1000);
select * from worksFor;

CREATE INDEX sal_idx ON worksFor(salary);
vacuum;

explain analyze select pid, cname
from worksFor where salary between 60000 and 100000;

vacuum;

explain analyze select pid, cname
from worksFor where salary between 80000 and 1100000;

-- 100000 records with index
DELETE FROM worksFor;
DROP INDEX IF EXISTS sal_idx;

select * from insertNewRecords(100000);
select * from worksFor;

CREATE INDEX sal_idx ON worksFor(salary);
vacuum;

explain analyze select pid, cname
from worksFor where salary between 60000 and 100000;

vacuum;

explain analyze select pid, cname
from worksFor where salary between 80000 and 1100000;

-- 4

explain analyze select pid, pname
				from Person where pid in (select pid from worksFor where cname = c);
				-- test across different cnames

-- my code
-- 100 records without index
DELETE FROM worksFor;
delete from Person;

select * from insertNewRecords(100);

select count(*) from person;
select count(*) from worksFor;

vacuum;
explain analyze select pid, pname
from Person where pid in (select pid from worksFor where cname = 'Amazon');
vacuum;
explain analyze select pid, pname
from Person where pid in (select pid from worksFor where cname = 'Netflix');
vacuum;
explain analyze select pid, pname
from Person where pid in (select pid from worksFor where cname = 'Stripe');

-- 1000 records without index
DELETE FROM worksFor;
delete from Person;

select * from insertNewRecords(1000);

select count(*) from person;
select count(*) from worksFor;

vacuum;
explain analyze select pid, pname
from Person where pid in (select pid from worksFor where cname = 'Amazon');
vacuum;
explain analyze select pid, pname
from Person where pid in (select pid from worksFor where cname = 'Netflix');
vacuum;
explain analyze select pid, pname
from Person where pid in (select pid from worksFor where cname = 'Stripe');

-- 10000 records without index
DELETE FROM worksFor;
delete from Person;

select * from insertNewRecords(10000);

select count(*) from person;
select count(*) from worksFor;

vacuum;
explain analyze select pid, pname
from Person where pid in (select pid from worksFor where cname = 'Amazon');
vacuum;
explain analyze select pid, pname
from Person where pid in (select pid from worksFor where cname = 'Netflix');
vacuum;
explain analyze select pid, pname
from Person where pid in (select pid from worksFor where cname = 'Stripe');

-- my code
-- 100 records with index
DELETE FROM worksFor;
delete from Person;

drop index if exists cname_idx;
drop index if exists pid_idx;
select * from insertNewRecords(100);

select count(*) from person;
select count(*) from worksFor;

CREATE INDEX cname_idx ON Company(cname);
CREATE INDEX pid_idx ON Person(pid);

vacuum;
explain analyze select pid, pname
from Person where pid in (select pid from worksFor where cname = 'Amazon');
vacuum;
explain analyze select pid, pname
from Person where pid in (select pid from worksFor where cname = 'Netflix');
vacuum;
explain analyze select pid, pname
from Person where pid in (select pid from worksFor where cname = 'Stripe');

-- 1000 records with index
DELETE FROM worksFor;
delete from Person;

drop index if exists cname_idx;
drop index if exists pid_idx;
select * from insertNewRecords(1000);

select count(*) from person;
select count(*) from worksFor;

CREATE INDEX cname_idx ON Company(cname);
CREATE INDEX pid_idx ON Person(pid);

vacuum;
explain analyze select pid, pname
from Person where pid in (select pid from worksFor where cname = 'Amazon');
vacuum;
explain analyze select pid, pname
from Person where pid in (select pid from worksFor where cname = 'Netflix');
vacuum;
explain analyze select pid, pname
from Person where pid in (select pid from worksFor where cname = 'Stripe');

-- 10000 records with index
DELETE FROM worksFor;
delete from Person;

drop index if exists cname_idx;
drop index if exists pid_idx;
select * from insertNewRecords(10000);

select count(*) from person;
select count(*) from worksFor;

CREATE INDEX cname_idx ON Company(cname);
CREATE INDEX pid_idx ON Person(pid);

vacuum;

explain analyze select pid, pname
from Person where pid in (select pid from worksFor where cname = 'Amazon');

explain analyze select pid, pname
from Person where pid in (select pid from worksFor where cname = 'Netflix');

explain analyze select pid, pname
from Person where pid in (select pid from worksFor where cname = 'Stripe');

-- use this command to clear your cache after running a trial
VACUUM;
-- https://www.postgresql.org/docs/current/sql-vacuum.html

/* --------------------------------- Helper Functions ---------------------------------*/

create or replace function 
BinaryRelationOverIntegers(n int, l_1 int, u_1 int, l_2 int, u_2 int) 
returns table (x int, y int) as
$$
   select floor(random() * (u_1-l_1+1) + l_1)::int as x, 
          floor(random() * (u_2-l_2+1) + l_2)::int as y
   from   generate_series(1,n);
$$ language sql;


create or replace function 
FunctionOverIntegers(n int, l_1 int, u_1 int, l_2 int, u_2 int) 
returns table (x int, y int) as
$$
   select x, floor(random() * (u_2-l_2+1) + l_2)::int as y
   from   generate_series(l_1,u_1) x order by random() limit(n);
$$ language sql;


create or replace function 
SetOfIntegers(n int, l int, u int)
returns table (x int) as
     $$  
        select floor(random() * (u-l+1) + l)::int as x 
        from   generate_series(1,n) 
        group by (x) order by 1;
$$ language sql;

create or replace function 
makeS (n integer)
returns void as
$$
begin 
    drop table if exists S;
    create table S (x int);
    insert into S select * from SetOfIntegers(n,1,n);
end;    
$$ language plpgsql;

-- question 8 
select makeS(10);

VACUUM;

explain analyze select x from S;

explain analyze select x from S order by 1;

explain analyze select distinct x from S;

explain analyze select distinct x from S order by 1;

EXPLAIN ANALYZE SELECT DISTINCT x FROM S GROUP BY 1;

EXPLAIN ANALYZE SELECT DISTINCT x FROM S GROUP BY 1 order by 1;

-- 8 

delete from R;
delete from S;
delete from P;

INSERT INTO P (a)
SELECT x FROM SetOfIntegers(10000, 1, 10000);

INSERT INTO R (a, b)
SELECT x, y FROM BinaryRelationOverIntegers(10000, 1, 10000, 1, 10000);

INSERT INTO S (b)
SELECT x FROM SetOfIntegers(10000, 1, 10000);

vacuum;

explain analyse
select distinct p.a
from P p, R r1, R r2, R  r3, S s
where p.a = r1.a and r1.b = r2.a and r2.b = r3.a and r3.b = s.b;

explain analyse
SELECT DISTINCT p.a
FROM P p
natural JOIN R r1 
natural JOIN R r2 
natural JOIN R r3 
natural JOIN S s;
