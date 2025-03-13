-- Script for Assignment 6

-- Creating database with full name

CREATE DATABASE assignment5;

-- Connecting to database 
\c assignment5

-- Relation schemas and instances for assignment 5

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


-- We define the following functions and predicates

/*
Functions:
set_union(A,B)               A union B
set_intersection(A,B)        A intersection B
set_difference(A,B)          A - B
add_element(x,A)             {x} union A
remove_element(x,A)          A - {x}
make_singleton(x)            {x}
choose_element(A)            choose some element from A
bag_union(A,B)               the bag union of A and B
bag_to_set(A)                coerce a bag A to the corresponding set

Predicates:
is_in(x,A)                   x in A
is_not_in(x,A)               not(x in A)
is_empty(A)                  A is the emptyset
is_not_emptyset(A)           A is not the emptyset
subset(A,B)                  A is a subset of B
superset(A,B)                A is a super set of B
equal(A,B)                   A and B have the same elements
overlap(A,B)                 A intersection B is not empty
disjoint(A,B)                A and B are disjoint 
*/

-- Set Operations: union, intersection, difference

-- Set union $A \cup B$:
create or replace function set_union(A anyarray, B anyarray) 
returns anyarray as
$$
   select array(select unnest(A) union select unnest(B) order by 1);
$$ language sql;

-- Set intersection $A\cap B$:
create or replace function set_intersection(A anyarray, B anyarray) 
returns anyarray as
$$
   select array(select unnest(A) intersect select unnest(B) order by 1);
$$ language sql;

-- Set difference $A-B$:
create or replace function set_difference(A anyarray, B anyarray) 
returns anyarray as
$$
   select array(select unnest(A) except select unnest(B) order by 1);
$$ language sql;


-- Add element to set
create or replace function add_element(x anyelement, A anyarray) 
returns anyarray as
$$
   select bag_to_set(x || A);
$$ language sql;


-- Add element to set
create or replace function remove_element(x anyelement, A anyarray) 
returns anyarray as
$$
   select array_remove(A, x);
$$ language sql;


-- Make singleton  x --->  {x}

create or replace function make_singleton(x anyelement) 
returns anyarray as
$$
   select add_element(x,'{}');
$$ language sql;


-- Choose some element from set A
create or replace function choose_element(A anyarray) 
returns anyelement as
$$
   select x 
   from (select UNNEST(A) as x) q
   order by random();
$$ language sql;


-- Bag operations

-- Bag union 
create or replace function bag_union(A anyarray, B anyarray) 
returns anyarray as
$$
   select A || B;
$$ language sql;

-- bag To set
create or replace function bag_to_set(A anyarray)
returns anyarray as
$$
   select array(select distinct unnest(A) order   by 1);
$$ language sql;


-- Set Predicates: set membership, set non membership, emptyset, subset, superset, overlap, disjoint

-- Set membership $x \in A$:
create or replace function is_in(x anyelement, A anyarray) 
returns boolean as
$$
   select x = SOME(A);
$$ language sql;

-- Set non membership $x \not\in A$:
create or replace function is_not_in(x anyelement, A anyarray) 
returns boolean as
$$
   select not(x = SOME(A));
$$ language sql;

-- emptyset test $A = \emptyset$:
create or replace function is_empty(A anyarray) 
returns boolean as
$$
   select A <@ '{}';
$$ language sql;


-- non emptyset test $A \neq \emptyset$:
create or replace function is_not_empty(A anyarray) 
returns boolean as
$$
   select not(A <@ '{}');
$$ language sql;

-- Subset test $A\subseteq B$:
create or replace function subset(A anyarray, B anyarray) 
returns boolean as
$$
   select A <@ B;
$$ language sql;

-- Superset test $A \supseteq B$:
create or replace function superset(A anyarray, B anyarray) 
returns boolean as
$$
   select A @> B;
$$ language sql;

-- Equality test $A = B$
create or replace function equal(A anyarray, B anyarray) 
returns boolean as
$$
   select A <@ B and A @> B;
$$ language sql;

-- Overlap test $A\cap B \neq \emptyset$:
create or replace function overlap(A anyarray, B anyarray) 
returns boolean as
$$
   select A && B;
$$ language sql;

-- Disjointness test $A\cap B = \emptyset$:
create or replace function disjoint(A anyarray, B anyarray) 
returns boolean as
$$
   select not A && B;
$$ language sql;


-- Set Operations: union, intersection, difference

-- Set union $A \cup B$:
create or replace function setunion(A anyarray, B anyarray) 
returns anyarray as
$$
   select array(select unnest(A) union select unnest(B) order by 1);
$$ language sql;

-- Set intersection $A\cap B$:
create or replace function setintersection(A anyarray, B anyarray) 
returns anyarray as
$$
   select array(select unnest(A) intersect select unnest(B) order by 1);
$$ language sql;

-- Set difference $A-B$:
create or replace function setdifference(A anyarray, B anyarray) 
returns anyarray as
$$
   select array(select unnest(A) except select unnest(B) order by 1);
$$ language sql;


-- Set Predicates: set membership, subset, superset, overlap, disjoint

-- Set membership $x \in A$:
create or replace function isIn(x anyelement, A anyarray) 
returns boolean as
$$
   select x = SOME(A);
$$ language sql;

-- Subset test $A\subseteq B$:
create or replace function subset(A anyarray, B anyarray) 
returns boolean as
$$
   select A <@ B;
$$ language sql;

-- Superset test $A \supseteq B$:
create or replace function superset(A anyarray, B anyarray) 
returns boolean as
$$
   select A @> B;
$$ language sql;

-- Overlap test $A\cap B \neq \emptyset$:
create or replace function overlap(A anyarray, B anyarray) 
returns boolean as
$$
   select A && B;
$$ language sql;

-- Disjointness test $A\cap B = \emptyset$:
create or replace function disjoint(A anyarray, B anyarray) 
returns boolean as
$$
   select not A && B;
$$ language sql;

-- Complex-object views on the Person, Company, companyLocation,
-- worksFor, Skill, personSkill, and Knows database

-- Define the view {\tt companyHasEmployees(cname,employees)} which
-- associates with each company, identified by a cname, the set of
-- pids of persons who work for that company. 

create or replace view companyHasEmployees as
   select cname, array(select pid 
                       from   worksfor w
                       where  w.cname = c.cname order by 1) as employees
   from   company c order by 1;


-- Define a view {\tt cityHasCompanies(city,companies)} which associates
-- with each city the set of cnames of companies who are located in that
-- city. 

create or replace view cityHasCompanies as
   select city, array_agg(cname order by 1) as companies
   from   companyLocation 
   group by city order by 1;




-- Define a view {\tt companyLocations(cname,locations)} which associates
-- with each company, identified by a cname, the set of cities in which
-- that company is located.  

create or replace view companyHasLocations     as
   select cname, array(select city 
                       from   companyLocation cc
                       where  c.cname = cc.cname order by 1) as locations
   from   company c
   order by 1;



-- Define a view {\tt knowsPersons(pid,persons)} which associates with each
-- person, identified by a pid, the set of pids of persons he or she
-- knows.

create or replace view knowsPersons as
   select p.pid, array(select k.pid2 
                       from   knows k
                       where  k.pid1 = p.pid order by pid2) as persons
   from   person p
   order by 1;




-- The view {\tt isKnownByPersons(pid,persons)} which associates with
-- each person, identified by a pid, the set of pids of persons who know
-- that person.  Observe that there may be persons who are not known by
-- any one.

create or replace view isKnownByPersons as
   select distinct p.pid, array(select k.pid1 
                                from   knows k
                                where  k.pid2 = p.pid order by pid1) as persons
   from   person p
   order by 1;


-- Define a view {\tt personHasSkills(pid,skills)} which associates with
-- each person, identified by a pid, his or her set of job skills.
-- Observe that a person may not have any job skills.  (Test your view.)

create or replace view personHasSkills  as
   select distinct p.pid, array(select s.skill
                                from   personSkill s
                                where  s.pid = p.pid order by 1) as skills
   from   person p order by 1;



-- Define a view {\tt skillOfPersons(skills,persons)} which associates
-- with each job skill the set of pids of persons who have that job
-- skill.  Observe that there may be job skills that are not job skills
-- of any person.  (Test your view.)

create or replace view  skillOfPersons as
    select js.skill, array(select ps.pid
                           from   personSkill ps
                           where  ps.skill = js.skill order by 1) as persons
    from   Skill js order by 1;


-- Problem 1

\qecho 'Problem 1' 
-- Find the cname and headquarter of each company that employs at
-- least two persons who have a common job skill.

select C.*
from   company C
where  exists (select 1
               from   skillOfPersons sP
               where  cardinality( set_intersection ((select employees
                                                      from   companyHasEmployees
	                                              where  cname = C.cname),
				                      sP.persons)) >= 2);


\qecho 'Problem 2' 

-- Find the pid and name of each person $p$ along with the set of pids
-- of persons who (1) know $p$ and (2) who have the AI skill but not
-- the Networks skill.

select p.pid,p.pname, (select set_intersection(
                                                (select kbp.persons from isKnownByPersons kbp where kbp.pid =p.pid),
                                                (select set_difference((select sop.persons from skillOfPersons sop where sop.skill='AI'), 
                                                                        (select sop.persons from skillOfPersons sop where sop.skill='Networks')))
                                              )
                     ) as persons
from person p;



\qecho 'Problem 3'  


select p.pid,p.pname from person p,personhasskills phs1
where p.pid=phs1.pid and cardinality(setdifference(
(select phs.skills from personhasskills phs,worksfor w
where w.cname='Google' and w.pid=phs.pid
and w.salary=(select max(w1.salary) from worksfor w1 where w1.cname=w.cname group by w1.cname)),phs1.skills))=0;



\qecho 'Problem 4'  

-- Find the set of companies that employ at least 3 persons who each
-- know at least five persons.  (So this query returns {\bf only one}
-- object, i.e., the set of companies specified in the query.)

select array(select c.cname
             from company c
             where cardinality(set_intersection((select che.employees from companyHasEmployees che
                                                 where che.cname=c.cname), 
                                                 array(select kp.pid from knowsPersons kp
                                                 where cardinality(kp.persons) >= 5)))>=3
            ) as companies;




\qecho 'Problem 5'
--  Find the following set of sets \[\{S \mid S \subseteq \text{Skill}
-- \land |S| \leq 4\}.\] I.e., this is the set consisting of each set of job skills whose size (cardinality) is at most 4.


-- Make singleton  x --->  {x}


create or replace function make_singleton(x anyelement)
returns anyarray as
$$
   select add_element(x,'{}');
$$ language sql;

-- Make pair   x, y  ---> {x,y}


create or replace function make_pair(x anyelement, y anyelement)
returns anyarray as
$$
   select set_union(make_singleton(x),make_singleton(y));
$$ language sql;


-- Make triple   x, y, z  ---> {x,y,z}

create or replace function make_triple(x anyelement, y anyelement, z anyelement)
returns anyarray as
$$
   select set_union(set_union(make_singleton(x),make_singleton(y)),make_singleton(z));
$$ language sql;


-- Make quadruple   u, v, w, x  ---> {u,v,w,x}

create or replace function make_quadruple(u anyelement, v anyelement, w anyelement, x anyelement)
returns anyarray as
$$
   select set_union(set_union(make_singleton(u),make_singleton(v)),
                    set_union(make_singleton(w),make_singleton(x)));
$$ language sql;



-- Find the following set of sets
-- {S | S ⊆ Skill ∧ |S| ≤ 4}.
-- I.e., this is the set consisting of 
-- each set of job skills whose size (cardinality) is at most 4.

select '{}' as skills
union
select make_singleton(skill)
from   skill
union
select make_pair(s1.skill,s2.skill)
from   skill s1, skill s2
union
select make_triple(s1.skill,s2.skill,s3.skill)
from   skill s1, skill s2, skill s3
union
select make_quadruple(s1.skill,s2.skill,s3.skill,s4.skill)
from   skill s1, skill s2, skill s3, skill s4;


\qecho 'Problem 6' 
-- Let  \[\mathcal{S} = \{S \mid S \subseteq \text{Skill} \land |S| \leq 4\}.\]
--  Find the following set of sets
--  \[\{X \mid X \subseteq \mathcal{S} \land |X| \leq 2\}.\]

-- Reconsider Problem 2. Let
-- S = {S | S ⊆ Skill ∧ |S| ≤ 4}.
-- Find the following set of sets
-- {X | X ⊆ S ∧ |X| ≥ 2}.

create type skillType as (skill text);
create type skillsType as (skills skillType[]);

with S as (select '{}' as skills
           union
           select make_singleton(row(s.skill)::skillType) skills
           from   skill s
           union
           select make_pair(row(s1.skill)::skillType,row(s2.skill)::skillType)
           from   skill s1, skill s2
           union
           select make_triple(row(s1.skill)::skillType,row(s2.skill)::skillType,row(s3.skill)::skillType)
           from   skill s1, skill s2, skill s3
	   union
	   select make_quadruple(row(s1.skill)::skillType,row(s2.skill)::skillType,
	                         row(s3.skill)::skillType,row(s4.skill)::skillType)
           from   skill s1, skill s2, skill s3, skill s4)
	   
select '{}'
union
select make_singleton(row(s.skills)::skillsType)
from S s
union
select make_pair(row(s1.skills)::skillsType,row(s2.skills)::skillsType)
from S s1, S s2;


 \qecho 'Problem 7' 
-- Let $A$ and $B$ be sets such that $A\cup B\neq\emptyset$.  The
-- \emph{Jaccard index} $J(A,B)$ is defined as the quantity \[
-- \frac{|A\cap B|}{|A \cup B|}.\] The Jaccard index is a frequently used
-- measure to determine the similarity between two sets.  Note that if
-- $A\cap B=\emptyset$ then $J(A,B) = 0$, and if $A = B$ then $J(A,B) =
-- 1$.

-- Let $t$ be a number called a \emph{threshold}.  We assume that $t$ is
-- a {\tt float} in the range $[0,1]$.

-- Write a function {\tt JaccardSimilar(t float)} that returns the set of
-- unordered pairs $\{s_1,s_2\}$ of different skills such that the set of
-- persons who have skill $s_1$ and the set of persons who have skill
-- $s_2$ have a Jaccard index of at least {\tt t}.

-- Test your function {\tt JaccardSimilar} for the following values for
-- $t$: $0$, $0.25$, $0.5$, $0.75$, and $1$.

create or replace function JaccardSimilar(t float)
returns table(skills text[]) as
$$
select distinct set_union(array(select sp1.skill), array(select sp2.skill))
from skillOfPersons sp1, skillOfPersons sp2
where sp1.skill <> sp2.skill
and (cardinality(set_intersection(sp1.persons, sp2.persons))::float / cardinality(set_union(sp1.persons, sp2.persons))::float) >= t;
$$ language sql;

-- qecho 'JaccardSimilar for t = 0.0'
select * from JaccardSimilar(0.0);

\qecho 'JaccardSimilar for t = 0.25'
select * from JaccardSimilar(0.25);

\qecho 'JaccardSimilar for t = 0.5'
select * from JaccardSimilar(0.5);

\qecho 'JaccardSimilar for t = 0.75'
select * from JaccardSimilar(0.75);

\qecho 'JaccardSimilar for t = 1.0'
select * from JaccardSimilar(1.0);


-- Consider the lecture on Nested and Semi-structured Data models.  In
-- that lecture, we considered the {\tt studentGrades} nested relation
-- and we constructed it using a PostgreSQL query starting from the {\tt
-- Enroll} relation.

CREATE TABLE student (sid TEXT, sname TEXT, major TEXT, byear INT);
INSERT INTO student VALUES
('s100', 'Eric'  , 'CS'     , 1988),
('s101', 'Nick'  , 'Math'   , 1991),
('s102', 'Chris' , 'Biology', 1977),
('s103', 'Dinska', 'CS'     , 1978),
('s104', 'Zanna' , 'Math'   , 2001),
('s105', 'Vince' , 'CS'     , 2001);

CREATE TABLE course (cno TEXT, cname TEXT, dept TEXT);
INSERT INTO course VALUES
('c200', 'PL'      , 'CS'),
('c201', 'Calculus', 'Math'),
('c202', 'Dbs'     , 'CS'),
('c301', 'AI'      , 'CS'),
('c302', 'Logic'   , 'Philosophy');

CREATE TABLE enroll (sid TEXT, cno TEXT, grade TEXT);
insert into enroll values 
     ('s100','c200', 'A'),
     ('s100','c201', 'B'),
     ('s100','c202', 'A'),
     ('s101','c200', 'B'),
     ('s101','c201', 'A'),
     ('s102','c200', 'B'),
     ('s103','c201', 'A'),
     ('s101','c202', 'A'),
     ('s101','c301', 'C'),
     ('s101','c302', 'A'),
     ('s102','c202', 'A'),
     ('s102','c301', 'B'),
     ('s102','c302', 'A'),
     ('s104','c201', 'D');



\qecho 'Problem 8'

CREATE TYPE studentType AS (sid TEXT);
CREATE TYPE gradeInfoType AS (grade TEXT, students studentType[]);

CREATE OR REPLACE VIEW course_grade_students AS
   (SELECT cno, grade, ARRAY_AGG(ROW(sid)::studentType) AS students
    FROM Enroll
    GROUP BY (cno, grade))
    ORDER BY 2;

CREATE OR REPLACE VIEW course_gradeslist AS
   (SELECT cno, ARRAY_AGG(ROW(grade, students)::gradeInfoType) AS gradeInfo
    FROM course_grade_students
    GROUP BY (cno))
    ORDER BY 2;

CREATE OR REPLACE VIEW courseGrades AS
   SELECT cno, gradeInfo
   FROM course_gradeslist
   ORDER BY cno;

SELECT * FROM courseGrades;


\qecho 'Problem 9'

SELECT sid1, set_difference(set_union(ARRAY(SELECT DISTINCT cg2.cno
                                      FROM courseGrades cg2,
                                      UNNEST(cg2.gradeInfo) gi2,
                                      UNNEST(gi2.students) sid2
                                      WHERE sid2 = sid1 AND
                                      gi2.grade = 'A'),
                                      ARRAY(SELECT DISTINCT cg2.cno
                                      FROM courseGrades cg2,
                                      UNNEST(cg2.gradeInfo) gi2,
                                      UNNEST(gi2.students) sid2
                                      WHERE sid2 = sid1 AND
                                      gi2.grade = 'B')),
                            ARRAY(SELECT DISTINCT cg2.cno
                                      FROM courseGrades cg2,
                                      UNNEST(cg2.gradeInfo) gi2,
                                      UNNEST(gi2.students) sid2
                                      WHERE sid2 = sid1 AND
                                      gi2.grade = 'C')) as Courses
FROM courseGrades cg1, UNNEST(cg1.gradeInfo) gi1, UNNEST(gi1.students) sid1
WHERE is_not_empty(Array(SELECT DISTINCT cg1.cno
                            WHERE gi1.grade = 'A'))
      OR
      is_not_empty(Array(SELECT DISTINCT cg1.cno
                            WHERE gi1.grade = 'B'))
GROUP BY sid1 ORDER BY sid1;


\qecho 'Problem 10'

CREATE OR REPLACE VIEW jcourse_grade_students AS
   (SELECT cno, grade, ARRAY_TO_JSON(ARRAY_AGG(JSONB_BUILD_OBJECT('sid', sid))) AS students
    FROM Enroll
    GROUP BY (cno, grade)
    ORDER BY (grade));

CREATE OR REPLACE VIEW jcourseGrades AS
   (SELECT JSONB_BUILD_OBJECT('cno', cno, 'gradeInfo', 
           ARRAY_TO_JSON(ARRAY_AGG(JSONB_BUILD_OBJECT('grade', grade, 
                                                       'students', students)))) AS courseGradeInfo
    FROM jcourse_grade_students
    GROUP BY (cno)
    ORDER BY (cno));

SELECT * FROM jcourseGrades;



\qecho 'Problem 11'

WITH C AS
(SELECT cg1.courseGradeInfo->>'cno' AS cno, s->>'sid' AS sid, gi1->>'grade' AS grade
FROM jcourseGrades cg1, JSONB_ARRAY_ELEMENTS(cg1.courseGradeInfo->'gradeInfo') gi1, JSONB_ARRAY_ELEMENTS(gi1->'students') s)
SELECT DISTINCT set_union(make_singleton(c1.cno), make_singleton(c2.cno)), ARRAY(SELECT ROW(s.sid)
                                                                        FROM Student s
                                                                        WHERE (c1.cno, s.sid) IN (SELECT c3.cno, c3.sid
                                                                                                  FROM C c3
                                                                                                  WHERE c3.grade = 'A')
                                                                              AND (c2.cno, s.sid) IN (SELECT c3.cno, c3.sid
                                                                                                      FROM C c3
                                                                                                      WHERE c3.grade = 'A'))
FROM C c1, C c2
WHERE c1.cno != c2.cno;


\qecho 'Problem 12'

-- Write a PL/pgSQL function that takes an array of integers as input 
-- and returns a new array where each element is the sum of all the 
-- elements in the input array up to and including that element. 
-- For example, if the input array is [1, 2, 3, 4], the output array should be [1, 3, 6, 10].

CREATE OR REPLACE FUNCTION cumulative_sum(arr INTEGER[]) RETURNS INTEGER[] AS $$
DECLARE
    result INTEGER[];
    sum INTEGER := 0;
BEGIN
    FOR i IN array_lower(arr, 1)..array_upper(arr, 1) LOOP
        sum := sum + arr[i];
        result := result || sum;
    END LOOP;
    RETURN result;
END;
$$ LANGUAGE plpgsql;

SELECT cumulative_sum('{1, 2, 3, 4}');

\qecho 'Problem 13'

-- Write a function that takes a positive integer as input and 
-- returns an array of all the prime numbers up to and including that integer.

CREATE OR REPLACE FUNCTION find_primes(n INTEGER)
RETURNS INTEGER[] AS $$
DECLARE
  primes INTEGER[] := '{}';
  is_prime BOOLEAN;
  i INTEGER := 3;
  j INTEGER := 1;
BEGIN
  IF n < 2 THEN
    RETURN '{}';
  END IF;

  primes := '{2}';

  WHILE i <= n LOOP
    is_prime := TRUE;
    j := 1;

    WHILE j <= cardinality(primes) LOOP
      IF primes[j] > sqrt(i) THEN
        EXIT;
      END IF;

      IF i % primes[j] = 0 THEN
        is_prime := FALSE;
        EXIT;
      END IF;

      j := j + 1;
    END LOOP;

    IF is_prime THEN
      primes := primes || ARRAY[i];
    END IF;

    i := i + 2;
  END LOOP;

  RETURN primes;
END;
$$ LANGUAGE plpgsql;


SELECT find_primes(14);

\qecho 'Problem 14'

create table PC(parent int, child int);

insert into PC values 
   (1,2),
   (1,3),
   (1,4),
   (2,5),
   (2,6),
   (3,7),
   (4,8),
   (5,9),
   (7,10),
   (7,11),
   (9,12);

-- Consider the following recursive query that computes the {\tt
-- sameGeneration} relation:

-- WITH RECURSIVE sameGeneration(m, n) AS
--           ((SELECT parent, parent FROM PC) UNION (select child, child from PC)
--           UNION
--           SELECT  t1.child, t2.child
--           FROM    sameGeneration pair, PC t1, PC t2
--           WHERE   pair.m = t1.parent and pair.n = t2.parent)
-- SELECT DISTINCT pair.m, pair.n from sameGeneration pair order by m, n;

-- Write a non-recursive function sameGeneration() in the language
-- plpgsql that computes the sameGeneration relation.

create table if not exists SG(m integer, n integer); 

create or replace function new_SG_pairs()
returns table (source integer, target integer) AS
$$
(select   t1.child as m, t2.child as n
 from     SG, PC t1, PC t2 
 where    SG.m=t1.parent and SG.n = t2.parent)
except
(select   *
 from     SG);
$$ language sql;

create or replace function sameGeneration()
returns table (m int, n int) as 
$$
begin
   drop table if exists SG;
   create table SG(m integer, n integer); 

   insert into SG select distinct t1.parent as m, t1.parent as n 
                  from   PC t1
                  where  not exists (select 1 from PC t2 where t2.child = t1.parent);

   while exists(select new_SG_pairs()) 
   loop
        insert into SG select * from new_SG_pairs();
   end loop;
   return query
          select * from SG order by 1,2;
end;
$$ language plpgsql;

-- table PC;

select * from sameGeneration();

drop table PC;

\c postgres

drop database assignment5;

