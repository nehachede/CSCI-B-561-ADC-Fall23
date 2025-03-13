-- Script for Assignment 4

-- Creating database with full name

CREATE DATABASE assignment4;

-- Connecting to database 
\c assignment4

-- Setting encoding
set client_encoding to UTF8;

-- Relation schemas and instances for assignment 2

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
     (1006,'Amazon', 55000),
     (1007,'Netflix', 50000),
     (1008,'Amazon', 50000),
     (1009,'Apple',60000),
     (1010,'Amazon', 55000),
     (1011,'Google', 70000), 
     (1012,'Apple', 50000),
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
 (1019,'Networks'),
 (1010,'Databases'),
 (1011,'Databases'),
 (1013,'Databases'),
 (1014,'Databases'),
 (1017,'Databases'),
 (1019,'Databases'),
 (1005,'Databases'),
 (1006,'AI'),
 (1009,'Databases');
 

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
 (1014,1012),
 (1010,1002),
 (1010,1012),
 (1010,1018);

\qecho 'Problem 1'
/*Find each pair (c, pn) where c is the city and pn is the name of the person
that lives in c, and earns the highest salary among all persons living in c. You must not use set 
predicates in this query*/

create or replace function highest_salary_at(city_ TEXT)
returns table (name text) as
$$
     with persons_at_city as (
          select p.* from person p where p.city = city_
     )
     select pac.pname from persons_at_city pac join worksfor w on
     w.pid = pac.pid and 
     w.salary = (
          select max(w1.salary) from worksfor w1 
          join persons_at_city pac1
          on pac1.pid = w1.pid
     );

$$ language sql;

select distinct p.city "c" ,
highest_salary_at(p.city) "pn" from person p;

\qecho 'Problem 2'
/*Find the pid and name of each person who has fewer than 2 of the com-
bined set of job skills of persons who work for Netflix. By combined set
of jobskills we mean the set
{s | s is a jobskill of an employee of Netflix }
*You must not use set predicates in this query.*/
WITH netflix_job_skills AS(
	SELECT	s.skill
	FROM 	Skill s
	JOIN	    personSkill ps 
	ON	    ps.skill = s.skill
	JOIN	worksFor w
	ON		ps.pid = w.pid AND w.cname = 'Netflix'
	GROUP BY s.skill)
	
SELECT	p.pid,p.pname
FROM	Person p
GROUP	BY p.pid, p.pname
HAVING	(SELECT COUNT(*) FROM (
			SELECT	ps.skill
			FROM	personSkill ps
			WHERE 	ps.pid = p.pid
			INTERSECT
			SELECT * FROM netflix_job_skills)q) < 2;

\qecho 'Problem 3'
/*Find each pairs (s1; s2) of skills such that the set of persons with skill s1
is the same as the set of persons with skill s2.You must not use set predicates in this query.*/

SELECT DISTINCT	s1.skill AS s1,s2.skill AS s2
FROM	Skill s1,Skill s2
WHERE	(
	SELECT COUNT(q.pid) FROM(
		SELECT	q1.pid FROM (
			SELECT ps1.pid FROM personSkill ps1 WHERE ps1.skill = s1.skill
			EXCEPT
			SELECT ps2.pid FROM personSkill ps2 WHERE ps2.skill = s2.skill)q1)q) = 0;

\qecho 'Problem 4'
/*Find each pid of a person who knows at least three people who (a) work for
Apple and (b) who make less than 60000.
You must not use set predicates in this query.*/
		
SELECT	p.pid
FROM	Person p
WHERE (
	SELECT COUNT(*) FROM (
		SELECT	k.pid2
		FROM	knows k
		JOIN	(SELECT ws.pid FROM worksFor ws WHERE ws.salary < 60000 AND ws.cname = 'Apple' ) w
		ON		k.pid2 = w.pid
		AND		k.pid1 = p.pid)q) >= 3;

\qecho 'Problem 5'
/*Find the cname of each company, such that some person that works there
knows at-least half of the people that work at Google.*/

create or replace function GoogleEmployees()
returns table(pid int) as
$$
    select w.pid from worksFor w where w.cname='Google';
$$ language sql;

create or replace function getNumEmpKnowingAtLeastHalf(companyName text)
returns int as
$$
    select count(*)
    from worksFor w
    where w.cname=companyName   and    2 * (select count(*) 
                                       from knows k 
                                       where k.pid1=w.pid and k.pid2 in (select * from GoogleEmployees())) >= (select count(*) from GoogleEmployees())
$$ language sql;

select distinct c.cname
from company c
where getNumEmpKnowingAtLeastHalf(c.cname) > 0;


\qecho 'Problem 6'
/*
Find each pair (c, a) where c is the cname of each company that has at
least one manager, and a is the minimum salary of all employees working at
the company who are not managers
*/

create or replace function mgr_count(cname_ text)
returns table (mgrs int) as 
$$

select count(*) from (

     select distinct h.mid from hasManager h join
     worksfor w on w.pid = h.mid and w.cname = cname_

)q;

$$ language sql;

create or replace function emp_min_salary(cname_ text)
returns table (minsal float) as 
$$
     with emps as (

                select w.pid 
                from worksfor w
                where w.cname = cname_
                except 
                select m.mid from hasManager m 

          )

     select * from (

               select min(w.salary) from worksFor w 
               join emps e on e.pid = w.pid

          )q;
     

$$ language sql;

select distinct c.cname "c", emp_min_salary(c.cname) "a"
from Company c where 
(select * from mgr_count(c.cname)) >= 1;

\qecho 'Problem 7'
\qecho '(a)'
/*Using the GROUP BY count method, define a function
create or replace function numberOfSkills(c text)
returns table (pid integer, salary int, numberOfSkills bigint) as
$$
...
$$ language sql;
that returns for a company identified by its cname, each triple (p,
s, n) where (1) p is the pid of a person who is employed by that
company, (2) s is the salary of p, and (3) n is the number of job skills
of p. (Note that a person may not have any job skills.)*/
CREATE OR REPLACE FUNCTION numberOfSkills(c TEXT)
RETURNS TABLE (pid INT, salary INT, numberOfSkills BIGINT) AS
$$
	SELECT	w.pid, w.salary, COUNT(*) AS n
	FROM	(SELECT * FROM worksFor ws WHERE ws.cname = c) w
	JOIN	personSkill ps ON w.pid = ps.pid
	GROUP	BY w.pid,w.salary
	UNION
	SELECT	w.pid, w.salary, 0 AS n
	FROM	    worksFor w
	WHERE	w.cname = c
	AND		w.pid NOT IN (SELECT ps.pid FROM personSkill ps)
	ORDER	BY n, pid;
$$ LANGUAGE SQL;

\qecho '(b)'
/*Test your function for Problem 7a for the companies Apple, Amazon,
and ACM.*/
SELECT * FROM numberOfSkills('Apple');
SELECT * FROM numberOfSkills('Amazon');
SELECT * FROM numberOfSkills('ACM');

\qecho '(c)'
/*Write the same function numberOfSkills as in Problem 7a but this
time without using the GROUP BY clause.*/
CREATE OR REPLACE FUNCTION numberOfSkills(c TEXT)
RETURNS TABLE (pid INT, salary INT, numberOfSkills BIGINT) AS
$$
	SELECT	w.pid, w.salary,
	(SELECT COUNT(ps.pid) FROM personSkill ps WHERE ps.pid = w.pid) AS n
	FROM	    worksFor w
	WHERE	w.cname = c
	UNION
	SELECT	q.pid, q.salary, 0 AS n -- NOT IN to EXCEPT
	FROM (
		SELECT w.* FROM worksFor w
		WHERE	w.cname = c
		EXCEPT
		SELECT w.* FROM worksFor w,personSkill ps 
		WHERE	w.cname = c AND w.pid = ps.pid)q
	ORDER BY n,pid;
$$ LANGUAGE SQL;

\qecho '(d)'
/*Test your function for Problem 7c for the companies Apple, Amazon,
and ACM.*/
SELECT * FROM numberOfSkills('Apple');
SELECT * FROM numberOfSkills('Amazon');
SELECT * FROM numberOfSkills('ACM');

\qecho '(e)'
/*Using the function numberOfSkills but without using set predicates,
write the following query: "Find each pair (c; p) where c is the name
of a company and where p is the pid of a person who (1) works for
company c, (2) makes more than 50000 and (3) has the most job
skills among all the employees who work for company c."*/
SELECT	c.cname, nos.pid
FROM	Company c, numberOfSkills(c.cname) nos
WHERE	nos.salary > 50000
AND		nos.numberOfSkills = (SELECT	MAX(q.numberOfSkills) FROM (
					SELECT	nos1.numberOfSkills
					FROM	Company c1, numberOfSkills(c1.cname) nos1
					WHERE	c1.cname = c.cname)q );

\qecho 'Problem 8'
/*Find the pid and name of each person who knows all the
persons who (a) live in Seattle, (b) make at least
45000, and (c) have at least one skill.*/
				
CREATE OR REPLACE FUNCTION Knows(pid int) 
  RETURNS TABLE (pid int) AS
  $$
   SELECT k.pid2
   FROM   knows k
   WHERE  k.pid1 = Knows.pid;
  $$ LANGUAGE SQL;
  
CREATE OR REPLACE VIEW CONDITIONAL AS
   SELECT distinct p.pid
   FROM   person p 
   join worksfor w on p.pid=w.pid and w.salary>=45000
   join personskill ps on p.pid = ps.pid
   WHERE p.city ='Seattle';

SELECT PID, PNAME
FROM PERSON P
WHERE NOT EXISTS(SELECT * FROM CONDITIONAL
				EXCEPT
				SELECT * FROM KNOWS(P.PID));


\qecho 'Problem 9'
/*Find the cname of each company who only employs man-
agers who make more than 50000.*/
CREATE OR REPLACE FUNCTION Managers(CNAME text) 
  RETURNS TABLE (mid int) AS
  $$
   SELECT distinct pid
   FROM worksfor w
   JOIN hasmanager h on h.mid = w.pid
   WHERE  w.cname = Managers.cname;
  $$ LANGUAGE SQL;


CREATE OR REPLACE FUNCTION makesmore(CNAME text) 
  RETURNS TABLE (eid int) AS
  $$
   SELECT distinct pid
   FROM worksfor w
   WHERE  w.cname = makesmore.cname
   and w.salary > 50000;
  $$ LANGUAGE SQL;

\qecho 'THIS WILL ALSO CONTAIN THE COMPANIES WHICH DO NOT HAVE ANY MANAGERS EMPLOYED.'

SELECT distinct c.CNAME
FROM company C
WHERE NOT EXISTS(SELECT mid FROM Managers(c.cname)
				where mid not in(
				SELECT eid FROM makesmore(c.cname)));


\qecho 'Problem 10'
/*Find the pid and name of each person who knows at least
4 people who each have at most 2 skills.*/
CREATE OR REPLACE FUNCTION KnowsAll(pid_k integer)  
returns table (pid integer) AS
$$
SELECT k.pid2
FROM Knows k
WHERE k.pid1 = pid_k
$$ language sql;

CREATE OR REPLACE FUNCTION Skills_Atmost2()  
returns table (pid integer) AS
$$
SELECT DISTINCT ps.pid
FROM personSkill ps
GROUP BY ps.pid
HAVING COUNT(ps.skill)<=2
$$ language sql;

SELECT p.pid,p.pname
FROM Person p
WHERE(SELECT COUNT(1)
	  FROM (SELECT *
			FROM KnowsAll(p.pid)
			INTERSECT
			SELECT * 
			FROM Skills_Atmost2()) q) >=4;

\qecho 'Problem 11'
/*Find the cname of each company that employs an odd number of 
persons where atleast two persons have the salary greater than or equal to 55000*/
CREATE OR REPLACE FUNCTION employee_pid(companyName text)  
returns table (pid integer) AS
$$
SELECT w.pid
FROM worksFor w
WHERE w.cname = companyName
$$ language sql;

CREATE OR REPLACE VIEW AtleastTwo AS (SELECT W1.PID FROM WORKSFOR W1
WHERE EXISTS (SELECT 1
	FROM WORKSFOR W
	WHERE W.SALARY>=55000
	GROUP BY W.CNAME
	HAVING COUNT(W.PID)>=2
	AND W.CNAME = W1.CNAME));

SELECT c.cname
FROM Company c
WHERE MOD((SELECT COUNT(1)
	   FROM (SELECT *
			 FROM employee_pid(c.cname)
			 INTERSECT
			 SELECT *
			 FROM AtleastTwo)q),2) <> 0;

\qecho 'Problem 12'
/*Find the pairs (p1, p2) of different person pids such that
the person with pid p1 and the person with pid p2 have the
same number of skills.*/
CREATE OR REPLACE FUNCTION countskill(pid int) 
  RETURNS TABLE (cnt int) AS
  $$
   SELECT count(skill)
   FROM personskill p
   WHERE  p.pid = countskill.pid
   group by p.pid;
  $$ LANGUAGE SQL;

SELECT Distinct P.PID as PID1, C.PID as PID2
FROM PERSONSKILL P
join PERSONSKILL C
on P.PID <> C.PID
WHERE NOT EXISTS(SELECT * FROM countskill(P.PID)
				EXCEPT
				SELECT * FROM countskill(C.PID));

\qecho 'Problem 13'
/*Write a trigger to check for primary key constraint. Trigger should include
definition and function.*/

CREATE OR REPLACE FUNCTION check_Company_key_constraint()
RETURNS trigger AS
$$
BEGIN
IF NEW.cname IN (SELECT cname FROM Company) THEN
RAISE EXCEPTION 'cname already exists';
END IF;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_Company_key
BEFORE INSERT ON Company
FOR EACH ROW EXECUTE PROCEDURE check_Company_key_constraint();

\qecho 'INSERT INTO Company VALUES("Google","NewYork");'

\qecho 'psql:B561_Assignment4.sql:572: ERROR:  cname already exists'
\qecho 'CONTEXT:  PL/pgSQL function check_company_key_constraint() line 4 at RAISE'

\qecho 'Problem 14'
/*Write a trigger to check for referential integrity constraint. Trigger should
include definition and function.*/

CREATE OR REPLACE FUNCTION check_WorksFor_ForeignKey_constraint()
RETURNS trigger AS
$$
BEGIN
IF NEW.cname NOT IN (SELECT cname FROM Company)THEN
RAISE EXCEPTION 'cname does not exists in Company';
END IF;
IF (NEW.pid, NEW.cname, NEW.salary) IN (SELECT pid,cname,salary FROM worksFor) THEN
RAISE EXCEPTION '(pid,cname,salary) already exists in worksFor';
END IF;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_worksFor_Foreignkey
BEFORE INSERT ON worksFor
FOR EACH ROW EXECUTE PROCEDURE check_WorksFor_ForeignKey_constraint();


\qecho 'INSERT INTO worksFor VALUES(1001,"Airbnb", 65000);'

\qecho 'psql:B561_Assignment4.sql:597: ERROR:  cname does not exists in Company'
\qecho 'CONTEXT:  PL/pgSQL function check_worksfor_foreignkey_constraint() line 4 at RAISE'

\qecho 'Problem 15'
/*Consider two relations R(A:integer,B:integer) and S(B:integer)
and a view with the following definition:*/

/*select distinct r.A
from R r, S s
where r.A > 10 and r.B = s.B;*/

/*Suppose we want to maintain this view as a materialized
view called V(A:integer) upon the insertion of tuples in R
and in S. (You do not have to consider deletions in this question.)

Define SQL insert triggers and their associated trigger functions
on the relations R and S that implement this materialized view.
Write your trigger functions in the language 'plpgsql.'

Make sure that your trigger functions act in an incremental way
and that no duplicates appear in the materialized view.*/


CREATE TABLE IF NOT EXISTS R(A INT, B INT);
CREATE TABLE IF NOT EXISTS S(B INT);
CREATE TABLE IF NOT EXISTS V(A INT);


CREATE OR REPLACE FUNCTION INSERT_R() RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO V
	(SELECT A FROM R
		WHERE A > 10 AND B IN (SELECT B FROM S)
	 	AND A NOT IN (SELECT A FROM V));
RETURN NULL;
END;
$$ LANGUAGE PLPGSQL;
	  
	  
CREATE TRIGGER INSERT_R AFTER
	INSERT ON R
	FOR EACH ROW EXECUTE PROCEDURE INSERT_R();

	CREATE OR REPLACE FUNCTION INSERT_S() RETURNS TRIGGER AS $$ BEGIN
		INSERT INTO V
			(SELECT A FROM R
				WHERE B IN (SELECT B FROM S)
					AND A > 10
					AND A NOT IN (SELECT A FROM V));
	RETURN NULL;
    END;
$$ LANGUAGE PLPGSQL;
    
CREATE TRIGGER INSERT_S AFTER
INSERT ON S
FOR EACH ROW EXECUTE PROCEDURE INSERT_S();

/*TEST YOUR TRIGGERS ACROSS THE BELOW RECORDS.*/

/* -----------*/

INSERT INTO R VALUES(15,35);
INSERT INTO S VALUES(35);
SELECT * FROM V;


INSERT INTO R VALUES(4,12);
INSERT INTO S VALUES(12);
SELECT * FROM V;

INSERT INTO R VALUES(26,13);
INSERT INTO S VALUES(11);
SELECT * FROM V;


INSERT INTO R VALUES(101,106);
INSERT INTO S VALUES(106);
SELECT * FROM V;


DROP TABLE IF EXISTS R;
DROP TABLE IF EXISTS S;
DROP TABLE IF EXISTS V;

/* -----------*/

\qecho 'Problem 16'
/*Consider applying the following constraint over the relation
personSkill. Each skill of a person who works for Apple
should also be the skill of the person who works for Google.
Write a trigger that maintains the constraint when inserting
new pairs of (pid,skill) into the personSkill relation.(You
can ignore the constraint restriction to hold upon the al-
ready existing previous records).*/


CREATE OR REPLACE FUNCTION INSERT_INTO_PERSONSKILL() 
RETURNS TRIGGER AS $$
BEGIN
IF NEW.CNAME = 'Google' THEN
INSERT INTO personSkill (SELECT DISTINCT NEW.PID, PS.SKILL
							   		FROM PERSONSKILL PS JOIN WORKSFOR W
							   		ON PS.PID = W.PID AND W.CNAME = 'Apple');
END IF;
RETURN NULL;
END;
$$ LANGUAGE PLPGSQL;


CREATE TRIGGER INSERT_INTO_PS_RELATION 
AFTER
INSERT ON WORKSFOR
FOR EACH ROW EXECUTE PROCEDURE INSERT_INTO_PERSONSKILL();


/* NEW RECORDS TO BE INSERTED*/


INSERT INTO Person VALUES
    (2001,'Kevin','Cupertino');
INSERT INTO worksFor VALUES
    (2001,'Apple', 65000);

INSERT INTO Person VALUES
    (2002,'Julia', 'Cupertino');
INSERT INTO worksFor VALUES
	(2002,'Google', 45000);
INSERT INTO SKILL VALUES('Devops');	
INSERT INTO personSkill VALUES
	(2002,'Devops');
     
INSERT INTO Person VALUES
    (2003,'Dora', 'Seattle');
INSERT INTO worksFor VALUES	 
	(2003,'Google', 55000);
INSERT INTO SKILL VALUES('Cloud');
INSERT INTO personSkill VALUES
	(2003,'Cloud');

INSERT INTO Person VALUES
     (2004,'Peter', 'Seattle');
INSERT INTO worksFor VALUES	 
	 (2004,'Apple', 55000);
INSERT INTO SKILL VALUES('Design');
INSERT INTO personSkill VALUES
	 (2004,'Design');


INSERT INTO Person VALUES
    (2005,'Alex','Cupertino');
INSERT INTO worksFor VALUES
    (2005,'Apple', 65000);

/* -----------*/

/* TEST YOUR RESULTS*/

SELECT * FROM PERSONSKILL WHERE PID = 2001;
SELECT * FROM PERSONSKILL WHERE PID = 2002;
SELECT * FROM PERSONSKILL WHERE PID = 2003;
SELECT * FROM PERSONSKILL WHERE PID = 2004;
SELECT * FROM PERSONSKILL WHERE PID = 2005;

/* -----------*/

/* RETAINING THE ORIGINAL DATA*/

DELETE FROM PERSONSKILL PS WHERE PS.PID IN (2002,2003,2004);
DELETE FROM SKILL S WHERE S.SKILL IN ('Devops','Cloud','Design');
DELETE FROM WORKSFOR W WHERE W.PID IN (2001,2002,2003,2004,2005);
DELETE FROM PERSON P WHERE P.PID IN (2001,2002,2003,2004,2005);

/* SECTION 16 END */



\qecho 'Problem 17'

/* SECTION Q17 BEGIN */

CREATE TABLE KNOWS_COPY AS SELECT * FROM KNOWS;

CREATE OR REPLACE FUNCTION RETAIN_DATA(P INT, C TEXT)
RETURNS VOID AS $$
	BEGIN
        UPDATE WORKSFOR SET CNAME = C
          WHERE WORKSFOR.PID = P;
		
		TRUNCATE TABLE KNOWS;
		INSERT INTO KNOWS SELECT * FROM KNOWS_COPY;
    END;
$$ LANGUAGE plpgsql;

-- Building the Trigger
CREATE OR REPLACE FUNCTION UpdateKnows() 
RETURNS TRIGGER AS $$
BEGIN

INSERT INTO Knows (SELECT DISTINCT NEW.pid AS PID1, W.PID AS PID2
						FROM WORKSFOR W 
						JOIN HASMANAGER HM
						ON (W.PID = HM.MID)
						WHERE W.CNAME = NEW.CNAME
						AND W.PID <> NEW.PID)
						ON CONFLICT (PID1,PID2) DO NOTHING;
RETURN NULL;
END;
$$ LANGUAGE PLPGSQL;


CREATE TRIGGER UpdateKnowsTrigger 
AFTER
UPDATE ON WORKSFOR
FOR EACH ROW EXECUTE PROCEDURE UpdateKnows();

UPDATE WORKSFOR SET CNAME='Apple' WHERE WORKSFOR.PID = 1005;

/* Check your trigger and return the results*/
SELECT * FROM KNOWS K WHERE K.PID1 = 1005;

/* retaining the data */
SELECT * FROM RETAIN_DATA(1005,'Google');


UPDATE WORKSFOR SET CNAME='Google' WHERE WORKSFOR.PID = 1012;

/* Check your trigger and return the results*/
SELECT * FROM KNOWS K WHERE K.PID1 = 1012;

/* retaining the data */
SELECT * FROM RETAIN_DATA(1012,'Apple');


DROP TABLE KNOWS_COPY;


/* SECTION Q17 END */

-- Connect to default database
\c postgres

-- Drop database created for this assignment
DROP DATABASE assignment4;





