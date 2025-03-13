-- Script for Assignment 1

-- Creating database with full name

CREATE DATABASE adcassingment1;

-- Connecting to database 
\c adcassingment1

-- Relation schemas and instances for assignment 1

CREATE TABLE Person(pid integer,
                    pname text,
                    city text,
                    primary key (pid));

CREATE TABLE Company(cname text,
                     headquarter text,
                     primary key (cname));

CREATE TABLE Skill(skill text,
                   primary key (skill));


CREATE TABLE worksFor(pid integer,
                      cname text,
                      salary integer,
                      primary key (pid),
                      foreign key (pid) references Person (pid),
                      foreign key (cname) references Company(cname));


CREATE TABLE companyLocation(cname text,
                             city text,
                             primary key (cname, city),
                             foreign key (cname) references Company (cname));


CREATE TABLE personSkill(pid integer,
                         skill text,
                         primary key (pid, skill),
                         foreign key (pid) references Person (pid) on delete cascade,
                         foreign key (skill) references Skill (skill) on delete cascade);


CREATE TABLE hasManager(eid integer,
                        mid integer,
                        primary key (eid, mid),
                        foreign key (eid) references Person (pid),
                        foreign key (mid) references Person (pid));

CREATE TABLE Knows(pid1 integer,
                   pid2 integer,
                   primary key(pid1, pid2),
                   foreign key (pid1) references Person (pid),
                   foreign key (pid2) references Person (pid));


CREATE TABLE hasManager1(eid integer,
                        mid integer,
                        primary key (eid, mid),
                        foreign key (eid) references Person (pid),
                        foreign key (mid) references Person (pid));

INSERT INTO Person VALUES
     (1001,'Jean','Cupertino'),
     (1002,'Vidya', 'Cupertino'),
     (1003,'Anna', 'Seattle'),
     (1004,'Qin', 'Seattle'),
     (1005,'Megan', 'MountainView'),
     (1006,'Ryan', 'Chicago'),
     (1007,'Danielle','LosGatos'),
     (1008,'Emma', 'Bloomington'),
     (1009,'Hasan', 'Bloomington'),
     (1010,'Linda', 'Chicago'),
     (1011,'Nick', 'MountainView'),
     (1012,'Eric', 'Cupertino'),
     (1013,'Lisa', 'Indianapolis'), 
     (1014,'Deepa', 'Bloomington'), 
     (1015,'Chris', 'Denver'),
     (1016,'YinYue', 'Chicago'),
     (1017,'Latha', 'LosGatos'),
     (1018,'Arif', 'Bloomington'),
     (1019,'John', 'NewYork');

INSERT INTO Company VALUES
     ('Apple', 'Cupertino'),
     ('Amazon', 'Seattle'),
     ('Google', 'MountainView'),
     ('Netflix', 'LosGatos'),
     ('Microsoft', 'Redmond'),
     ('IBM', 'NewYork'),
     ('ACM', 'NewYork'),
     ('Yahoo', 'Sunnyvale');


INSERT INTO worksFor VALUES
     (1001,'Apple', 65000),
     (1002,'Apple', 45000),
     (1003,'Amazon', 55000),
     (1004,'Amazon', 55000),
     (1005,'Google', 60000),
     (1006,'Amazon', 60000),
     (1007,'Netflix', 50000),
     (1008,'Amazon', 50000),
     (1009,'Apple',60000),
     (1010,'Amazon', 55000),
     (1011,'Google', 70000), 
     (1012,'Apple', 45000),
     (1013,'Yahoo', 55000),
     (1014,'Apple', 50000), 
     (1015,'Amazon', 60000),
     (1016,'Amazon', 55000),
     (1017,'Netflix', 60000),
     (1018,'Apple', 50000),
     (1019,'Microsoft', 50000);

INSERT INTO companyLocation VALUES
   ('Apple', 'Bloomington'),
   ('Amazon', 'Chicago'),
   ('Amazon', 'Denver'),
   ('Amazon', 'Columbus'),
   ('Google', 'NewYork'),
   ('Netflix', 'Indianapolis'),
   ('Netflix', 'Chicago'),
   ('Microsoft', 'Bloomington'),
   ('Apple', 'Cupertino'),
   ('Amazon', 'Seattle'),
   ('Google', 'MountainView'),
   ('Netflix', 'LosGatos'),
   ('Microsoft', 'Redmond'),
   ('IBM', 'NewYork'),
   ('Yahoo', 'Sunnyvale');

INSERT INTO Skill VALUES
   ('Programming'),
   ('AI'),
   ('Networks'),
   ('OperatingSystems'),
   ('Databases');

INSERT INTO personSkill VALUES
 (1001,'Programming'),
 (1001,'AI'),
 (1002,'Programming'),
 (1002,'AI'),
 (1004,'AI'),
 (1004,'Programming'),
 (1005,'AI'),
 (1005,'Programming'),
 (1005,'Networks'),
 (1006,'Programming'),
 (1006,'OperatingSystems'),
 (1007,'OperatingSystems'),
 (1007,'Programming'),
 (1009,'OperatingSystems'),
 (1009,'Networks'),
 (1010,'Networks'),
 (1011,'Networks'),
 (1011,'OperatingSystems'),
 (1011,'AI'),
 (1011,'Programming'),
 (1012,'AI'),
 (1012,'OperatingSystems'),
 (1012,'Programming'),
 (1013,'Programming'),
 (1013,'OperatingSystems'),
 (1013,'Networks'),
 (1014,'OperatingSystems'),
 (1014,'AI'),
 (1014,'Networks'),
 (1015,'Programming'),
 (1015,'AI'),
 (1016,'OperatingSystems'),
 (1016,'AI'),
 (1017,'Networks'),
 (1017,'Programming'),
 (1018,'AI'),
 (1019,'Networks');

INSERT INTO hasManager VALUES
 (1004, 1003),
 (1006, 1003),
 (1015, 1003),
 (1016, 1004),
 (1016, 1006),
 (1008, 1015),
 (1010, 1008),
 (1013, 1007),
 (1017, 1013),
 (1002, 1001),
 (1009, 1001),
 (1014, 1012),
 (1011, 1005);

INSERT INTO Knows VALUES
 (1011,1009),
 (1007,1016),
 (1011,1010),
 (1003,1004),
 (1006,1004),
 (1002,1014),
 (1009,1005),
 (1018,1009),
 (1007,1017),
 (1017,1019),
 (1019,1013),
 (1016,1015),
 (1001,1012),
 (1015,1011),
 (1019,1006),
 (1013,1002),
 (1018,1004),
 (1013,1007),
 (1014,1006),
 (1004,1014),
 (1001,1014),
 (1010,1013),
 (1010,1014),
 (1004,1019),
 (1018,1007),
 (1014,1005),
 (1015,1018),
 (1014,1017),
 (1013,1018),
 (1007,1008),
 (1005,1015),
 (1017,1014),
 (1015,1002),
 (1018,1013),
 (1018,1010),
 (1001,1008),
 (1012,1011),
 (1002,1015),
 (1007,1013),
 (1008,1007),
 (1004,1002),
 (1015,1005),
 (1009,1013),
 (1004,1012),
 (1002,1011),
 (1004,1013),
 (1008,1001),
 (1008,1019),
 (1019,1008),
 (1001,1019),
 (1019,1001),
 (1004,1003),
 (1006,1003),
 (1015,1003),
 (1016,1004),
 (1016,1006),
 (1008,1015),
 (1010,1008),
 (1017,1013),
 (1002,1001),
 (1009,1001),
 (1011,1005),
 (1014,1012);



\qecho 'Problem 1'

-- Provide 4 conceptually different examples that illustrate how the
-- presence or absence of primary and foreign keys affect insert and
-- deletes in these relations.  To solve this problem, you will need to
-- experiment with the relation schemas and instances for this
-- assignment.  For example, you should consider altering primary keys
-- and foreign key constraints and then consider various sequences of
-- insert and delete operations.  You may need to change some of the
-- relation instances to observe the desired effects.  Certain inserts
-- and deletes should succeed but other should generate error
-- conditions.  (Consider the lecture notes about keys, foreign keys,
-- and inserts and deletes as a guide to solve this problem.)

\qecho 'Problem 1 conceptual example 1'

\qecho 'Problem 1 conceptual example 2'

\qecho 'Problem 1 conceptual example 3'

\qecho 'Problem 1 conceptual example 4'

\qecho 'Problem 2'

-- Find the pid, pname of each person who (a) lives in MountainView, (b)
-- works for a company which is headquartered in MountainView
-- , and (c) has a salary less than or equal to 60000

select p.pid, p.pname
from person p
where p.city='MountainView' 
and exists (select 1 from company c,worksFor w where p.pid = w.pid 
			and c.headquarter = 'MountainView' and w.cname=c.cname and w.salary<=60000)
order by 1;


\qecho 'Problem 3'
-- Find each company that has atleast 2 employees working for it.

select distinct w.cname
from worksFor w,worksFor w1
where w.cname = w1.cname
and w.pid <> w1.pid
order by 1;

\qecho 'Problem 4'
-- Find the ID of each person who knows someone living in Bloomington and having Networks skill.

select distinct p.pid
from person p
where exists (select 1 from knows k,personSkill ps,person p1
			 where k.pid1 = p.pid
			 and k.pid2 = ps.pid
			 and k.pid2 = p1.pid
			 and p1.city = 'Bloomington'
			 and ps.skill = 'Networks')
order by 1;

\qecho 'Problem 5'
-- Find the pairs of pids (p1, p2) such that p1 and p2 both have atleast one common skill.

select distinct ps1.pid as pid1, ps2.pid as pid2
from personSkill ps1, personSkill ps2
where ps1.pid > ps2.pid 
and exists (
                select 1 from personSkill ps3
                where ps3.pid=ps1.pid and ps3.skill in (select ps4.skill from personSkill ps4 where ps4.pid=ps2.pid)
           );

\qecho 'Problem 6'
-- Find the ID, cname, and salary of each person who works for company which is located in Cupertino and who has the
-- next to lowest salary (i.e., the second lowest salary) at that company.

with worksx as
(select w.pid,w.cname,w.salary from worksfor w,companyLocation cl where w.cname=cl.cname
and cl.city='Cupertino'
except
select w.pid,w.cname,w.salary from worksfor w,companyLocation cl where w.cname=cl.cname
and cl.city='Cupertino'
and w.salary<=all (select w1.salary from worksfor w1 where w1.cname=w.cname))

select wq.pid,wq.cname,wq.salary from
worksx wq
where wq.salary<=all(select wx.salary from worksx wx where wx.cname=wq.cname);


\qecho 'Problem 7'
-- Find the ID of managers having AI skill who is the manager for atleast 2 people

select distinct ps.pid
from personSkill ps,hasManager hm1, hasManager hm
where ps.pid = hm.mid
and hm1.mid = hm.mid
and hm.eid <> hm1.eid
and ps.skill = 'AI';

\qecho 'Problem 8'
-- For each company, list the company name having atleast 2 employees along with the 
-- least salary made by employees who work for it. (The query is expected to return the
-- company name and salary fields as output)

select distinct w.cname, w.salary
from worksFor w,worksFor w1
where not exists (select 1 
                from worksFor w1
                where w1.cname=w.cname and w1.salary < w.salary)
and w.pid <> w1.pid
and w.cname = w1.cname;

\qecho 'Problem 9'
-- Find the ID, name and city of each person who knows atleast one person who knows
-- another person making a salary of more than 65000

select distinct p.pid,p.pname,p.city
from person p,person p1,knows k
where p.pid = k.pid1
and k.pid2 = p1.pid
and exists (select 1 from knows k1,worksFor w where k1.pid2 = w.pid
		   and k1.pid1 = p1.pid
		   and w.salary > 65000
		   and w.pid <> p.pid)
order by 1;

\qecho 'Problem 10'
select distinct p.pid, p.pname, w.cname, w.salary
from   Person p, worksFor w,Company c
where  p.pid = w.pid and
       p.city = 'Bloomington' and
       40000 <= w.salary and
       c.headquarter = 'Seattle'
	   and w.cname = c.cname;


\qecho 'Problem 11'
SELECT ps.pid
FROM personSkill ps, hasManager hm, Person m
WHERE ps.skill = 'Programming' AND hm.eid = ps.pid AND hm.mid = m.pid
	  AND EXISTS (SELECT 1
	  			  FROM personSkill ms
				  WHERE ms.pid = m.pid and ms.skill != 'Programming');	

\qecho 'Problem 12'
SELECT ps.skill
FROM Person p, personSkill ps
WHERE p.pid = ps.pid and p.city != 'Bloomington'
	  AND EXISTS (SELECT m.pid
	  			  FROM Person m, hasManager hm
				  WHERE hm.eid = p.pid AND hm.mid = m.pid AND m.city = 'Bloomington');


\qecho 'Problem 13'

SELECT m.pid, m.pname
FROM Person m
WHERE NOT EXISTS (SELECT 1
				  FROM hasManager hm
				  WHERE hm.mid = m.pid AND
				  NOT EXISTS (SELECT 1
				  			  FROM Person e
							  WHERE hm.eid = e.pid AND
							  		e.city =  m.city));


\qecho 'Problem 18'
SELECT TRUE = ALL(SELECT EXISTS(SELECT 1
					       FROM hasManager hm2
					       WHERE hm2.mid = hm1.mid AND hm1.eid != hm2.eid)
			  FROM hasManager hm1) as managesatleast2;

\qecho 'Problem 19'
select exists (select 1
               from   Person p, worksFor pw
               where  p.pid = pw.pid and
                      true = all(select pw.salary < mw.salary
                                  from   hasManager hm, worksFor mw
                                  where  hm.eid = p.pid and hm.mid = mw.pid)) as "constraintSatisfied";

\qecho 'Problem 20'
select not exists (select 1
                   from   hasManager em, worksFor e, worksFor m
                   where  em.eid = e.pid and
                          em.mid = m.pid and
                          e.cname <> m.cname) as "constaintSatisfied";

-- Connect to default database
\c postgres;

-- Drop database created for this assignment
DROP DATABASE adcassingment1;



