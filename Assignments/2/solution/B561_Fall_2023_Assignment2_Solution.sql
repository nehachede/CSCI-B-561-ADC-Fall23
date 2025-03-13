
CREATE DATABASE assignment2;

\c assignment2;


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
   ('Databases'),
   ('WebDevelopment');

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
 (1017,'Programming'),
 (1018,'AI'),
 (1019,'Networks'),
 (1003,'WebDevelopment');

INSERT INTO hasManager VALUES
 (1004, 1003),
 (1006, 1003),
 (1015, 1003),
 (1016, 1004),
 (1016, 1006),
 (1008, 1015),
 (1010, 1008),
 (1007, 1017),
 (1002, 1001),
 (1009, 1001),
 (1014, 1012),
 (1011, 1005);

TRUNCATE TABLE Knows;

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
 (1012,1001),
 (1014,1001),
 (1018,1001),
 (1001,1001),
 (1002,1002),
 (1003,1003),
 (1004,1004),
 (1005,1005),
 (1006,1006),
 (1007,1007),
 (1008,1008),
 (1009,1009),
 (1010,1010),
 (1011,1011),
 (1012,1012),
 (1013,1013),
 (1014,1014),
 (1015,1015),
 (1016,1016),
 (1017,1017),
 (1018,1018),
 (1019,1019);


create table PC(parent integer,
               child integer);
insert into PC values
(1,2),
(1,3),
(1,4),
(2,5),
(2,6),
(3,7),
(5,8),
(8,9),
(8,10),
(8,11),
(7,12),
(7,13),
(12,14),
(14,15);

--Find each triple (c, p, s) where c is the cname of a company, p is the pid of a person
--who earns the lowest salary at that company and knows at least someone who has Operating Systems skill, and s is the salary of p.
\qecho 'Problem-1a'
--Formulate this query in Pure SQL by only using the
--EXISTS or NOT EXISTS set predicates. You can not use the set operations INTERSECT, UNION, and EXCEPT.

SELECT W1.CNAME AS C, P.PID AS P, W1.SALARY AS S
FROM WORKSFOR W1, PERSON P 
WHERE W1.PID = P.PID
    AND NOT EXISTS 
    (SELECT 1
    FROM WORKSFOR W2
    WHERE W1.PID <> W2.PID 
        AND W1.CNAME = W2.CNAME 
        AND W1.SALARY > W2.SALARY)
    AND EXISTS
        (SELECT 1 
            FROM KNOWS K, personSkill PS
            WHERE W1.PID = K.PID1 
                AND PS.PID = K.PID2 
                AND PS.SKILL = 'OperatingSystems')
ORDER BY 1;

\qecho 'Problem-1b'
--Formulate this query in Pure SQL by only using the IN, NOT IN, SOME, or ALL set membership predicates.
--You can not use the set operations INTERSECT, UNION, and EXCEPT.

SELECT W1.CNAME AS C, P.PID AS P, W1.SALARY AS S 
FROM WORKSFOR W1, PERSON P 
WHERE W1.PID = P.PID AND 
    W1.SALARY < ALL (SELECT W2.SALARY 
                    FROM WORKSFOR W2 
                    WHERE W1.PID <> W2.PID 
                    AND W1.CNAME = W2.CNAME)
    AND W1.PID IN
        (SELECT K.PID1
            FROM KNOWS K, PERSONSKILL PS
            WHERE PS.PID = K.PID2  
                AND PS.SKILL = 'OperatingSystems')
ORDER BY 1;

\qecho 'Problem-1c'
--Formulate this query in Pure SQL by only using the set operations INTERSECT, UNION, and EXCEPT.

SELECT W.CNAME AS C, P.PID AS P, W.SALARY AS S 
FROM WORKSFOR W, PERSON P,
    (SELECT Q.PID FROM
			(SELECT W.* FROM WORKSFOR W
				EXCEPT 
			 SELECT W1.* FROM WORKSFOR W1, WORKSFOR W2
				WHERE W1.PID <> W2.PID
					AND W1.CNAME = W2.CNAME
					AND W1.SALARY > W2.SALARY) Q 
	 INTERSECT 
	 SELECT K.PID1 
        FROM KNOWS K, PERSONSKILL PS 
        WHERE PS.PID = K.PID2 AND PS.SKILL = 'OperatingSystems') Q2
WHERE Q2.PID = W.PID AND W.PID = P.PID
ORDER BY 1;

-- Find the name, salary and city of each person
-- who (a) lives in a city where no one has the Networks skill and
-- (b) earns the highest salary in his/her company.

\qecho 'Problem-2a'
--Formulate this query in Pure SQL by only using the
--EXISTS or NOT EXISTS set predicates. You can not use the set operations INTERSECT, UNION, and EXCEPT.

SELECT P1.PNAME,W1.SALARY,P1.CITY
FROM PERSON P1, WORKSFOR W1
WHERE P1.PID= W1.PID  
AND NOT EXISTS (SELECT DISTINCT P2.CITY 
				FROM PERSONSKILL PS,PERSON P2
				WHERE PS.SKILL='Networks'
				AND P2.PID=PS.PID
				AND P1.CITY = P2.CITY)
AND NOT EXISTS (SELECT W2.SALARY 
				FROM WORKSFOR W2 
				WHERE W1.CNAME = W2.CNAME
				AND w2.salary > w1.salary)
ORDER BY 1;				
			

\qecho 'Problem-2b'
--Formulate this query in Pure SQL by only using the IN, NOT IN, SOME, or ALL set membership predicates.
--You can not use the set operations INTERSECT, UNION, and EXCEPT.

SELECT P1.PNAME,W1.SALARY,P1.CITY
FROM PERSON P1, WORKSFOR W1
WHERE P1.PID= W1.PID  
AND P1.CITY NOT IN (SELECT DISTINCT P2.CITY 
					FROM PERSONSKILL PS,PERSON P2
					WHERE PS.SKILL='Networks'
					AND P2.PID=PS.PID)
AND W1.SALARY >= ALL (SELECT W2.SALARY 
					  FROM WORKSFOR W2 
					  WHERE W1.CNAME = W2.CNAME)
ORDER BY 1;

\qecho 'Problem-2c'
--Formulate this query in Pure SQL by only using the set operations INTERSECT, UNION, and EXCEPT.

SELECT Q.PNAME,Q.SALARY,Q.CITY
FROM(SELECT P1.PNAME,W1.SALARY,W1.CNAME,P1.CITY
FROM PERSON P1, WORKSFOR W1
WHERE P1.PID= W1.PID  
EXCEPT
(SELECT P1.PNAME,W1.SALARY,W1.CNAME,P1.CITY
FROM PERSON P1, WORKSFOR W1, PERSONSKILL PS,PERSON P2
WHERE P1.PID= W1.PID
AND P1.CITY = P2.CITY
AND PS.SKILL='Networks'
AND P2.PID=PS.PID)
EXCEPT
(SELECT DISTINCT P1.PNAME,W1.SALARY,W1.CNAME,P1.CITY
FROM WORKSFOR W1, WORKSFOR W2, PERSON P1
WHERE W1.SALARY<W2.SALARY 
AND W1.CNAME = W2.CNAME))Q
ORDER BY 1;

--Find each pair (c1, c2) of cnames of different companies such that
--no employee of c1 and no employee of c2 live in Chicago.
\qecho 'Problem-3a'
--Formulate this query in Pure SQL by only using the
--EXISTS or NOT EXISTS set predicates. You can not use the set operations INTERSECT, UNION, and EXCEPT.

WITH no_chicago AS (
    SELECT w.cname 
    FROM person p, worksFor w 
    WHERE p.pid = w.pid 
    AND p.city = 'Chicago'
)
SELECT DISTINCT c1.cname AS C1, c2.cname AS C2 
FROM company c1, company c2 
WHERE c1.cname <> c2.cname 
AND NOT EXISTS (SELECT 1
                FROM no_chicago ch
                WHERE  ch.cname = c1.cname or ch.cname = c2.cname)
ORDER BY 1, 2;

\qecho 'Problem-3b'
--Formulate this query in Pure SQL by only using the IN, NOT IN, SOME, or ALL set membership predicates.
--You can not use the set operations INTERSECT, UNION, and EXCEPT.

WITH no_chicago AS (
    SELECT w.cname 
    FROM person p, worksFor w 
    WHERE p.pid = w.pid 
    AND p.city = 'Chicago'
)
SELECT DISTINCT c1.cname AS C1, c2.cname AS C2 
FROM company c1, company c2 
WHERE c1.cname <> c2.cname 
AND c1.cname NOT IN (SELECT ch1.cname
                        FROM no_chicago ch1)
AND c2.cname NOT IN (SELECT ch2.cname
                        FROM no_chicago ch2)
ORDER BY 1, 2;

\qecho 'Problem-3c'
--Formulate this query in Pure SQL by only using the set operations INTERSECT, UNION, and EXCEPT.

WITH no_chicago AS (
    SELECT w.cname 
    FROM person p, worksFor w 
    WHERE p.pid = w.pid 
    AND p.city = 'Chicago'
)
SELECT q1.cname, q2.cname 
from (SELECT c1.cname 
        FROM company c1 
        EXCEPT 
        SELECT ch1.cname 
        from no_chicago ch1) Q1,
    (SELECT c1.cname 
        FROM company c1 
        EXCEPT 
        SELECT ch1.cname 
        from no_chicago ch1) Q2 
    WHERE Q1.cname <> Q2.cname
ORDER BY 1,2;

--Reconsider Problem 1. Formulate this query in RA SQL
\qecho 'Problem-4b'

SELECT W.CNAME AS C, P.PID AS P, W.SALARY AS S 
FROM PERSON P 
NATURAL JOIN WORKSFOR W 
NATURAL JOIN    (SELECT Q.PID FROM(
                SELECT W.* FROM WORKSFOR W
                EXCEPT 
                SELECT W1.* FROM WORKSFOR W1 
                JOIN WORKSFOR W2 ON (W1.PID <> W2.PID AND W1.CNAME = W2.CNAME AND W1.SALARY > W2.SALARY)
                ) Q 
                INTERSECT 
                SELECT K.PID1 
                FROM KNOWS K 
                JOIN (SELECT PS.PID FROM PERSONSKILL PS WHERE PS.SKILL='OperatingSystems') PS1 ON (K.PID2=PS1.PID)) Q2
ORDER BY 1;

--Reconsider Problem 2. Formulate this query in RA SQL
\qecho 'Problem-5b'
SELECT Q.PNAME,Q.SALARY,Q.CITY
FROM(SELECT P1.PNAME,W1.SALARY,W1.CNAME,P1.CITY
FROM PERSON P1 
	 NATURAL JOIN WORKSFOR W1 
EXCEPT
(SELECT P1.PNAME,W1.SALARY,W1.CNAME,P1.CITY
FROM PERSON P1 
 NATURAL JOIN WORKSFOR W1 
 NATURAL JOIN PERSONSKILL PS 
 JOIN PERSON P2 ON(P1.CITY = P2.CITY 
				   AND P2.PID=PS.PID)
 WHERE PS.SKILL='Networks')
EXCEPT
(SELECT DISTINCT P1.PNAME,W1.SALARY,W1.CNAME,P1.CITY
FROM WORKSFOR W1 
 JOIN WORKSFOR W2 ON (W1.SALARY<W2.SALARY 
					  AND W1.CNAME = W2.CNAME) 
 JOIN PERSON P1 ON (P1.PID=W1.PID))) Q
ORDER BY 1;


--Reconsider Problem 3. Formulate this query in RA SQL
\qecho 'Problem-6b'
WITH no_chicago AS (
    SELECT w.cname 
    FROM (SELECT P.PID FROM PERSON P WHERE P.CITY = 'Chicago') P NATURAL JOIN worksFor w
)
SELECT Q1.cname, Q2.cname 
from (SELECT c1.cname 
        FROM company c1 
        EXCEPT 
        SELECT ch1.cname 
        from no_chicago ch1) Q1
    JOIN
    (SELECT c2.cname 
        FROM company c2
        EXCEPT 
        SELECT ch2.cname 
        from no_chicago ch2) Q2 
    ON (Q1.cname <> Q2.cname)
ORDER BY 1,2;

\qecho 'Problem 10'

/*Create a materialized view CompanyKnownPerson such that, for each company,
the view returns the pid of Persons who are known by at least two different people (other than pid)
from the same company and the pid earns more salary than them. Then test your view.*/

CREATE materialized VIEW companyknownperson
AS (SELECT DISTINCT K.pid2 as pid
    FROM    knows K,
            knows K1,
            worksfor W,
            worksfor W1,
            worksfor W2
    WHERE   K.pid1 <> K1.pid1 
            AND K.pid2 = K1.pid2
            AND K.pid2 = W.pid
            And K.pid1 = W1.pid 
            AND K1.pid1 = W2.pid 
            AND W.cname = W1.cname 
            AND W.cname = W2.cname
            AND W.salary > W1.salary
            AND W.salary > W2.salary);

SELECT *
FROM   companyknownperson
ORDER  BY 1;


\qecho 'Problem 11'

/*Create a parameterized view SkillOnlyOnePerson (skill1 text) that returns pair of different persons pid1, pid2 such that
pid1 should have the skill identified by skill1 and pid2 should not have the skill identified by skill1.
Note that pid2 should have at least one skill.
Test your view for skill1 = WebDevelopment.*/

CREATE OR REPLACE FUNCTION SkillOnlyOnePerson (skill1 text)
RETURNS TABLE (pid1 int, pid2 int) AS                                                                                                                  
$$
WITH hasskill
     AS (SELECT ps.pid
         FROM   personskill ps
         WHERE  ps.skill = skill1),
     nothasskill
     AS (SELECT ps1.pid
         FROM   personskill ps1
         WHERE  ps1.pid NOT IN (SELECT pid
                              FROM   hasskill))
SELECT DISTINCT h.pid,
                n.pid
FROM   hasskill h,
       nothasskill n;
$$ LANGUAGE SQL;

SELECT * FROM SkillOnlyOnePerson ('WebDevelopment') ORDER  BY 1,2;



\qecho 'Problem 12'
/*Let PC(parent: integer, child: integer) be a rooted parent-child tree. So a pair (n,m) in PC indicates that node n is a parent of node m.
The sameGeneration(n1, n2) binary relation is inductively defined using the following two rules:
If n is a node in PC, then the pair (n,n) is in the sameGeneration relation. (Base rule)
If n_1 is the parent of m1 in PC and n2 is the parent of m2 in Tree and (n1,n2) is a pair in the sameGeneration relation then (m1,m2) is a pair in the sameGeneration relation. (Inductive Rule)
Write a recursive view for the sameGeneration relation.
Test your view. */

create or replace recursive view sameGeneration (n1,n2)
as  ((select  e.parent as n1, e.parent as n2
     from    PC e
     union
     select  e.child as n1, e.child as n2
     from    PC e)
     union
     select  e1.child, e2.child
     from    PC e1, sameGeneration sg, PC e2
     where   e1.parent = sg.n1 and e2.parent = sg.n2 );
select n1, n2 from sameGeneration
order by 1,2;


-- Connect to default database
\c postgres

-- Drop database created for this assignment
DROP DATABASE assignment2;

