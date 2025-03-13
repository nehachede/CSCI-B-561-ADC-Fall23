-- Script for Assignment 5

-- Creating database with full name

CREATE DATABASE nchede;

-- Connecting to database 
\c nchede

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

\qecho '\n\nProblem 1' 
-- Find the cname and headquarter of each company that employs at
-- least two persons who have a common job skill.
select c.cname, c.headquarter
from companyHasEmployees ce, company c, (
   select array( 
      select distinct p1.pid 
      from (
        select pid, unnest(skills) as skill 
        from personHasSkills
    ) p1, 
    (
      select pid, unnest(skills) as skill 
      from personHasSkills
    ) p2
    where p1.pid = p2.pid and p1.skill = p2.skill
   ) as q
) ps
where c.cname = ce.cname and 
  cardinality(setintersection(ps.q, ce.employees)) > 1;


\qecho '\n\nProblem 2' 

-- Find the pid and name of each person $p$ along with the set of pids
-- of persons who (1) know $p$ and (2) who have the AI skill but not
-- the Networks skill.
select p.pid, p.pname, 
  setintersection(k.knownBy, ps.ps) as persons
from Person p, 
    (
        select kb.pid2 as pid, array_agg(kb.pid1) as knownBy
        from (
            select kp.pid as pid1, unnest(kp.persons) as pid2
            from knowsPersons kp
            ) kb
        group by 1
    ) k,
    (
        select array(
            select phs.pid
            from personHasSkills phs
            where is_not_in('Networks', phs.skills) AND is_in('AI', phs.skills)
        ) as ps
    ) ps
WHERE p.pid = k.pid;

\qecho '\n\nProblem 3' 
-- Find the pid and name of each person who has all the skills of the
-- combined set of job skills of the Highest paid persons who work for
-- Google.

-- g_emp has all google employees and maxpay_gemp has all google employees whose salaries equal to the highest salaries of google employees
with g_emp as (
  select unnest(employees) as pid
  from companyHasEmployees
  where cname = 'Google'
), 
maxpay_gemp as (
  select ge.pid, w.salary
  from g_emp ge, worksFor w
  where ge.pid = w.pid and w.salary = (
    select max(salary)
    from worksFor 
    where cname = 'Google'
    group by cname
  )
)
select p.pid, p.pname
from Person p, personHasSkills ps, g_emp ge, maxpay_gemp mge
where p.pid = ps.pid and p.pid = ge.pid and ge.pid = mge.pid
  and not is_not_empty(set_difference(
    ps.skills, 
    (select skills from personHasSkills where pid = mge.pid)
    )
);

\qecho '\n\nProblem 4'  

-- Find the set of companies that employ at least 3 persons who each
-- know at least five persons.  (So this query returns {\bf only one}
-- object, i.e., the set of companies specified in the query.)
select array(
    select c.cname
    from (
        select ce.cname
        from companyHasEmployees ce, (
            select array(
                select kp.pid 
                from knowsPersons kp
                where cardinality(kp.persons) >= 5 
            ) as q
        ) k
  where cardinality(setintersection(ce.employees, k.q)) >= 3
    ) c
) as companies;

\qecho '\n\nProblem 5'
--  Find the following set of sets
--  {S | S ⊆ Skill∧ |S| ≤ 4}.
--I.e., this is the set consisting of each set of job skills whose size (cardinality) is at most 4.
with ss as(
  select distinct set_intersection(q1.a1, q2.a2) as skills
  from (
    select distinct add_element(s.skill, ps.skills) as a1
    from skill s, personHasSkills ps
    where cardinality(add_element(s.skill, ps.skills)) <= 4
  ) q1,
  (
    select distinct remove_element(s.skill, ps.skills) as a2
    from skill s, personHasSkills ps
    where cardinality(remove_element(s.skill, ps.skills)) <= 4
  ) q2
)
select * from ss;

\qecho '\n\nProblem 6' 
-- S = {S | S ⊆ Skill ∧ |S| ≤ 4}.
-- Find the following set of sets
-- {X | X ⊆ S ∧ |X| <= 2}.
create type set_s as (s1 text, s2 text);
create type setofsets as (x set_s[], y set_s[]);

with ss as(
  select distinct set_intersection(q1.a1, q2.a2) as skills
  from (
    select distinct add_element(s.skill, ps.skills) as a1
    from skill s, personHasSkills ps
    where cardinality(add_element(s.skill, ps.skills)) <= 4
  ) q1,
  (
    select distinct remove_element(s.skill, ps.skills) as a2
    from skill s, personHasSkills ps
    where cardinality(remove_element(s.skill, ps.skills)) <= 4
  ) q2
)
select distinct add_element(array[s1.skills, s2.skills]::set_s)::setofsets as t2
from ss s1, ss s2
order by 1;


 \qecho '\n\nProblem 7' 
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
create or replace function JaccardSimilar(t float) 
returns table(pair TEXT[]) as
$$
  select distinct array[q1.skill, q2.skill] as pair
  from 
  (
    select s.skill, array_agg(phs.pid) as p1
    from Skill s, personHasSkills phs 
    where s.skill = any(phs.skills)
    group by 1
  ) q1,
  (
      select s.skill, array_agg(phs.pid) as p2
    from Skill s, personHasSkills phs 
    where s.skill = any(phs.skills)
    group by 1
  ) q2
  where q1.skill < q2.skill and 
    cardinality(setunion(q1.p1, q2.p2)) >= 1
  and (
    cardinality(setintersection(q1.p1, q2.p2))::float /
    cardinality(setunion(q1.p1, q2.p2))::float
  ) >= t;
$$ language sql;

-- Test your function {\tt JaccardSimilar} for the following values for
-- $t$: $0$, $0.25$, $0.5$, $0.75$, and $1$.
select * from JaccardSimilar((0.0)::float);
select * from JaccardSimilar((0.25)::float);
select * from JaccardSimilar((0.50)::float);
select * from JaccardSimilar((0.75)::float);
select * from JaccardSimilar((1.0)::float);

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



\qecho '\n\nProblem 8'

--Write a PostgreSQL view courseGrades that creates the nested relation of type
--(cno,gradeInfo{(grade,students{(sid)})})

--This view should compute for each course, the grade information of the
--students enrolled in this course. In particular, for each course and for
--each grade, this relation stores in a set the students who obtained that
--grade in that course.

drop type if exists stype;
drop type if exists atype;

create type stype as (sid text);
create type atype as (grade text, s stype[]);

create or replace view courseGrades as
  select cno,
    array_agg(row(grade, s)::atype) as gradeInfo
  from (
    select cno, grade, array_agg(row(sid)::stype) as s
    from enroll
    group by 1, 2
    order by 1, 2
  )
  group by 1
  order by 1;
select * from courseGrades;

\qecho '\n\nProblem 9'

--Starting from the courseGrades view in Problem 8 solve the following query
--Find each (s, C) pair where s is the sid of a students and C is
--the set of cnos of courses in which the student received an ‘A’ or
--a ‘B’ but not a ‘C’. The type of your answer relation should be (sid : text, Courses : {(cno : text)}).
select s.sid, array_agg(row(cno))
from courseGrades cg, unnest(cg.gradeInfo) g, unnest(g.s) s
where g.grade in ('A','B') and g.grade <> 'C'
group by 1
order by 1, 2;

\qecho '\n\nProblem 10'

--Write a PostgreSQL view jcourseGrades that creates a semi-structured
--database which stores jsonb objects whose structure conforms with the
--structure of tuples as described for the courseGrades in Problem 8.
create or replace view jcourseGrades as
  select jsonb_build_object(
    'cno', cno, 'gradeInfo', 
    jsonb_agg(jsonb_build_object(
      'grade', grade, 'students', s
      )
    )
  ) as coursegradeinfo
  from 
  (
    select cno, grade, 
      jsonb_agg(jsonb_build_object('sid', sid)) as s
    from enroll
    group by 1, 2
    order by 1, 2
  )
  group by cno
  order by 1;

--Test your view.
select * from jcourseGrades;

\qecho '\n\nProblem 11'

--Starting from the jcourseGrades view in Problem 10 solve the following
--queries. Note that the output of each of these queries is a nested
--relation.
--Find each pair ({c1, c2}, S) where c1 and c2 are the course numbers 
--of two different courses and S is the set of sids of students
--who received a ’A’ in both courses c1 and c2. The type of your
--answer relation should be (coursePair : {(cno : text)}, Students :{(sid : text))}.

select array[row( j3.coursegradeinfo->>'cno' ), 
       row(j4.coursegradeinfo->>'cno')] as set_union, 
       array(
        select row(s1->>'sid')
        from jcourseGrades j1, jcourseGrades j2, 
         jsonb_array_elements( j1.coursegradeinfo->'gradeInfo') g1, 
         jsonb_array_elements( j2.coursegradeinfo->'gradeInfo') g2, 
         jsonb_array_elements(g1->'students') s1, 
         jsonb_array_elements(g2->'students') s2
        where s1->'sid' = s2->'sid' 
         and g1->'grade' = '"A"' and g2->'grade' = '"A"'
        and j1.coursegradeinfo->'cno' < j2.coursegradeinfo->'cno'
        and j1.coursegradeinfo->>'cno' = j3.coursegradeinfo->>'cno'
        and j2.coursegradeinfo->>'cno' = j4.coursegradeinfo->>'cno'
      ) as array
from jcourseGrades j3, jcourseGrades j4
where j3.coursegradeinfo->>'cno' < j4.coursegradeinfo->>'cno'
order by( j3.coursegradeinfo->>'cno' , j4.coursegradeinfo->>'cno');


\qecho '\n\nProblem 12'

-- Write a PL/pgSQL function that takes an array of integers as input 
-- and returns a new array where each element is the sum of all the 
-- elements in the input array up to and including that element. 
-- For example, if the input array is [1, 2, 3, 4], the output array should be [1, 3, 6, 10].

create or replace function csum(inp int[])
returns int[] as
$$
declare 
  res int[];
  temp int := 0;
begin
  for i in 1..array_length(inp, 1) 
  loop
    temp := temp + inp[i];
    res[i] := temp;
  end loop;
  return res;
end;
$$ language plpgsql;

select csum(array[1,2,3,4]);

\qecho '\n\nProblem 13'

-- Write a function that takes a positive integer as input and 
-- returns an array of all the prime numbers up to and including that integer.

create or replace function primes(n int)
returns int[] as
$$
declare
  res int[] := '{}';
  i int := 2;
  j int;
begin
  if n<2 then 
    return res;
  end if;
  
  loop
    j := 2;
    while(i % j <> 0) and (j <> i) loop
      j := j + 1;
    end loop;
    
    if j = i then
      res := res || i;
    end if;
    
    i := i + 1;
    
    exit when i > n;
  end loop;
  
  return res;
end;
$$ language plpgsql;

select primes(50);

\qecho '\n\nProblem 14'
-- same generation

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

-- Consider a parent-child relation PC(parent, child). (You can assume
-- that PC is a rooted tree and the domain of the attributes parent
-- and child is int.) An edge (p,c) in PC indicates that node p is a
-- parent of node c. Now consider a pair of nodes (m,n) in PC (m and n
-- maybe the same nodes.) We say that m and n are in the same
-- generation when the distance from m to the root of PC is the same
-- as the distance from n to the root of PC.

-- Consider the following recursive query that computes the {\tt
-- sameGeneration} relation:

/*
WITH RECURSIVE sameGeneration(m, n) AS
          ((SELECT parent, parent FROM PC) UNION (select child, child from PC)
          UNION
          SELECT  t1.child, t2.child
          FROM    sameGeneration pair, PC t1, PC t2
          WHERE   pair.m = t1.parent and pair.n = t2.parent)
SELECT DISTINCT pair.m, pair.n from sameGeneration pair order by m, n;
*/

-- Write a non-recursive function sameGeneration() in the language
-- plpgsql that computes the sameGeneration relation.

drop table if exists anc;
create table anc(m integer, n integer);

create or replace function new_pairs()
returns table (m integer, n integer) as
$$
  select parent, parent from pc
  union
  select child, child from pc
  union
  select a1.child, a2.child
  from anc a0, pc a1, pc a2
  where a0.m=a1.parent and a0.n=a2.parent
  except
  select m, n from anc;
$$ language sql;

create or replace function sameGeneration()
returns void as
$$
begin
  while exists (select * from new_pairs())
  loop
    insert into anc 
      select * from new_pairs();
  end loop;
end;
$$ language plpgsql;

select sameGeneration();

select * from anc 
order by m, n;

drop table anc;

\c postgres

drop database nchede;

