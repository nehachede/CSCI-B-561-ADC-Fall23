-- Script for Assignment 4

-- Creating database with full name

CREATE DATABASE nchede;

-- Connecting to database 
\c nchede

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

\qecho '\n\nProblem 1'
/*Find each pair (c, pn) where c is the city and pn is the name of the person
that lives in c, and earns the highest salary among all persons living in c.
You must not use set predicates in this query.*/
select p.city as c, p.pname as pn
from Person p, (
  select p.city, max(w.salary) as max_sal
  from Person p, worksFor w
  where p.pid = w.pid
  group by p.city
) q, worksFor w
where p.city = q.city 
  and p.pid = w.pid
  and w.salary = q.max_sal
order by c, pn;

\qecho '\n\nProblem 2'
/*Find the pid and name of each person who has fewer than 2 of the combined
set of job skills of persons who work for Netflix. By combined set
of jobskills we mean the set
{s | s is a jobskill of an employee of Netflix }*/
select distinct p.pid, p.pname
from Person p
where (
  select count(distinct ps.skill)
  from personSkill ps
  where ps.pid = p.pid and exists (
    select 1
    from personSkill ps1, worksFor w
    where w.pid = ps1.pid and w.cname = 'Netflix'
      and ps.skill = ps1.skill
  )
) < 2
order by 1, 2;

\qecho '\n\nProblem 3'
/*Find each pairs (s1; s2) of skills such that the set of persons with skill s1
is the same as the set of persons with skill s2.*/
select distinct ps1.skill as s1, ps2.skill as s2
from personSkill ps1, personSkill ps2
group by 1, 2
having array_agg(distinct ps1.pid order by ps1.pid) = array_agg(distinct ps2.pid order by ps2.pid)
order by 1, 2;

-- alternatively
select distinct ps1.skill as s1, ps2.skill as s2
from personSkill ps1, personSkill ps2
where ps1.pid = ps2.pid
group by 1, 2
having count(distinct ps1.pid) = (
  select count(distinct ps.pid)
  from personSkill ps 
  where ps.skill = ps1.skill)
ORDER BY 1, 2;

\qecho '\n\nProblem 4'
/*Find each pid of a person who knows at least three people who (a) work for
Apple and (b) who make less than 60000. You must not use set predicates
in this query.*/
select p.pid
from Person p, (
  select p.pid, count(distinct k.pid2) as nknows
  from Person p, Knows k, worksFor w
  where p.pid = k.pid1 and k.pid2=w.pid and w.cname='Apple'
  group by 1
  having count(distinct k.pid2)>=3
) q1, worksFor w
where p.pid = q1.pid and p.pid = w.pid and w.salary<60000;

\qecho '\n\nProblem 5'
/*Find the cname of each company, such that some person that works there
knows at-least half of the people that work at Google. You must not use
set predicates in this query.*/
select distinct w.cname
from worksFor w, (
  select distinct w.pid
  from worksFor w, Knows k
  where w.cname = 'Google' and k.pid2 = w.pid
) kg, Knows k
where w.pid =k.pid1 and k.pid2= kg.pid
group by 1
having count(w.pid) >= 0.5*count(kg.pid);

\qecho '\n\nProblem 6'
/*
Find each pair (c, a) where c is the cname of each company that has at
least one manager, and a is the minimum salary of an employee at that
company, provided that the employee is not a manager. You must not use
set predicates in this query.*/
select distinct w.cname, q.salary
from worksFor w
left join (
  select w.cname, min(w.salary) as salary
  from worksFor w
  where w.pid not in (
    select distinct hm.mid
    from hasManager hm
  )
  group by 1
) q
on w.cname = q.cname 
where exists (
  select 1
  from hasManager hm
  where w.pid = hm.mid
);

\qecho '\n\nProblem 7'
\qecho '\n\n7 (a)'
create or replace function numberOfSkills(c text)
returns table (pid integer, salary int, numberOfSkills bigint) as
$$
  select p.pid, w.salary, count(ps.skill) as numberOfSkills
  from Person p, worksFor w, personSkill ps
  where p.pid = w.pid and p.pid = ps.pid and w.cname = c
  group by 1, 2
  union
  select p.pid, w.salary, 0 as numberOfSkills
  from Person p, worksFor w, personSkill ps
  where p.pid = w.pid and w.cname = c and p.pid not in (
    select distinct ps.pid
    from personSkill ps
  )
  group by 1, 2
  order by 3, 1
  ;
$$ language sql;

\qecho '\n\n7 (b)'
select * from numberOfSkills('Apple');
\qecho '\n\n7 (b)'
select * from numberOfSkills('Amazon');
\qecho '\n\n7 (b)'
select * from numberOfSkills('ACM');

\qecho '\n\n7 (c)'
create or replace function numberOfSkills(c text)
returns table (pid integer, salary int, numberOfSkills bigint) as
$$
  select p.pid, w.salary,
    count(ps.skill) over (partition by p.pid) as numberOfSkills
    from Person p, worksFor w, personSkill ps
  where p.pid = w.pid and p.pid = ps.pid and w.cname = c
  union
  select p.pid, w.salary, 0 as numberOfSkills
    from Person p, worksFor w, personSkill ps
    where p.pid = w.pid and w.cname = c and p.pid not in (
      select distinct ps.pid
      from personSkill ps
    )
  order by 3, 1;
$$ language sql;

\qecho '\n\n7 (d)'
select * from numberOfSkills('Apple');
\qecho '\n\n7 (d)'
select * from numberOfSkills('Amazon');
\qecho '\n\n7 (d)'
select * from numberOfSkills('ACM');

\qecho '\n\n7 (e)'
select w.cname as c, n.pid as p
from worksFor w, numberofSkills(w.cname) n
where w.pid = n.pid and n.salary >50000 and n.numberOfSkills = (
  select max(q.numberOfSkills)
  from numberOfSkills(w.cname) q
) order by 1;

/* quantifiers */
\qecho '\n\nProblem 8'
/*Find the pid and name of each person who knows all the persons who (a)
live in Seattle, (b) make at least 45000, and (c) have at least one skill.*/

-- Condition used (ONLY): A − 𝐵 ≠ ∅ -> ¬ ∃ 𝑥 (𝑥 ∈ 𝐴 − 𝐵)
select distinct p.pid, p.pname
from Person p
where not exists( 
  -- set A: SSS: Person who lives in 'S'eattle, make at least 45000 ('S'alay) and have at least one 'S'kill
  select distinct p.pid
  from Person p, worksFor w, personSkill ps
  where p.pid = w.pid and w.salary >= 45000 
    and p.pid = ps.pid and p.city = 'Seattle' and ps.pid = p.pid
  except
  -- set B: K: Person who knows all persons
  select distinct k.pid2
  from knows k
  where k.pid1 = p.pid
);


\qecho '\n\nProblem 9'
/*Find the cname of each company who only employs managers who make
more than 50000.*/

-- Condition used (ONLY): A − 𝐵 ≠ ∅ -> ¬ ∃ 𝑥 (𝑥 ∈ 𝐴 − 𝐵)
\qecho 'THIS WILL ALSO CONTAIN THE COMPANIES WHICH DO NOT HAVE ANY MANAGERS EMPLOYED.'
-- set A: MC: All managers at the company
-- set B: MS: All employees that make more than 50000
select distinct c.cname
from Company c
where not exists (
  select distinct hm.mid
  from worksFor w, hasManager hm
  where w.pid = hm.mid and w.cname = c.cname and hm.mid not in (
    select distinct w.pid
    from worksFor w
    where w.salary > 50000 and w.cname = c.cname
  )
);

\qecho '\n\nProblem 10'
/*Find the pid and name of each person who knows at least 4 people who
each have at most 2 skills.*/

-- Condition used (SOME): |A - B| ≥ 1
-- set A: people who have at most 2 skills
-- set B: people who know at least 4 people
with skills_2 as (
  select ps.pid 
  from personSkill ps
  group by 1
  having count(ps.skill) <= 2
)
select distinct p.pid, p.pname
from Person p
where (
  select count(1)
  from (
      select k.pid2
      from Knows K
      where p.pid = k.pid1
      intersect
      select q.pid
      from skills_2 q
    )
  ) >= 4;

\qecho '\n\nProblem 11'
/*Find the cname of each company that employs an odd number of persons
where at least two persons have the salary greater than or equal to 55000*/

-- Condition used: 
-- set A: all companies 
-- set B: companies with at least two employees that make >= 55000
with sal_ge55k_2 as (
  select w1.pid, w1.cname
  from worksFor w1
  where w1.cname in (
    select w.cname
    from worksFor w 
    where w.salary >= 55000
    group by 1
    having count(distinct w.pid) >= 2
  )
)
select c.cname 
from Company c
where mod((
  select count(1)
  from (
    select w.pid
    from worksFor w
    where w.cname = c.cname
    intersect
    select q.pid
    from sal_ge55k_2 q
    where q.cname = c.cname
  )
), 2) = 1;


\qecho '\n\nProblem 12'
/*Find the pairs (p1, p2) of different person pids such that the person with
pid p1 and the person with pid p2 have the same number of skills.*/

-- Condition used (ONLY): A − 𝐵 ≠ ∅ -> ¬ ∃ 𝑥 (𝑥 ∈ 𝐴 − 𝐵)
-- set A: skill count of p1
-- set B: skill count of p2
  
create or replace function s_cnt(pid int)
returns int as
$$
  select count(ps.skill)
  from personSkill ps
  where ps.pid = s_cnt.pid
  group by ps.pid
$$ language sql;

select distinct ps1.pid as p1, ps2.pid as p2
from personSkill ps1, personSkill ps2
where ps1.pid <> ps2.pid and not exists(
  select * 
  from s_cnt(ps1.pid)
  except
  select *
  from s_cnt(ps2.pid)
);


/* Triggers */

\qecho '\n\nProblem 13'
/*Write a trigger to check for primary key constraint. Trigger should include
definition and function.*/
-- primary key constraint trigger on cname from Company table
create or replace function comp_pkey_const() 
returns trigger as
$$
begin
  if new.cname in (select cname from Company) 
    then raise exception 'Company name, %, ALREADY EXISTS IN COMPANY TABLE', new.cname;
  end if;
  return new;
end;
$$ language plpgsql;

create or replace trigger comp_pkey
  before insert
  on Company
  for each row
  execute procedure comp_pkey_const();
  
insert into Company values ('Apple', 'Bloomington');
-- This will raise an exception because Apple already exists in table Company

\qecho '\n\nProblem 14'
/*Write a trigger to check for referential integrity constraint. Trigger should
include definition and function.*/
-- referential integrity constraint for worksFor table when deleting rows
create or replace function worksFor_fkey_const() 
returns trigger as
$$
begin
  if new.pid not in (select pid from Person) 
    then raise exception 'REFERENTIAL INTEGRITY CONSTRAINT: PID % DOES NOT EXIST IN PERSON TABLE', new.pid;
  end if;
  
  if new.cname not in (select cname from Company)
    then raise exception 'REFERENTIAL INTEGRITY CONSTRAINT: CNAME % DOES NOT EXIST IN COMPANY TABLE', new.cname;
  end if;
  
  return new;
end;
$$ language plpgsql;

create or replace trigger worksFor_fkey
  before insert
  on worksFor
  for each row
  execute procedure worksFor_fkey_const();
  
insert into worksFor values (1030, 'IUB', 50000);
-- This raises an exception as neither 1030 is present in the Person table nor is IUB in the Company table that. 
-- Both, pid and cname are referenced from table Person and Company respectively.

-- for question 17
drop trigger worksFor_fkey on worksFor;
drop trigger comp_pkey on Company;

\qecho '\n\nProblem 15'
/*Consider two relations R(A:integer,B:integer) and S(B:integer)
and a view with the following definition:*/
/*
select distinct r.A
from R r, S s
where r.A > 10 and r.B = s.B;
*/
/*Suppose we want to maintain this view as a materialized
view called V(A:integer) upon the insertion of tuples in R
and in S. (You do not have to consider deletions in this question.)

Define SQL insert triggers and their associated trigger functions
on the relations R and S that implement this materialized view.
Write your trigger functions in the language 'plpgsql.'

Make sure that your trigger functions act in an incremental way
and that no duplicates appear in the materialized view. */

-- TEST YOUR TRIGGERS ACROSS THE BELOW RECORDS.

/* -----------*/
CREATE TABLE IF NOT EXISTS R(A INT, B INT);
CREATE TABLE IF NOT EXISTS S(B INT);
CREATE TABLE IF NOT EXISTS V(A INT);
/* -----------*/
--Create TRIGGERS Insert_R and Insert_S
/* -----------*/
create or replace function In_VR() returns trigger as $$
begin
  if new.A > 10 and new.B in (select B from S) 
    and new.A not in (select A from V) then
    insert into V(A) values (new.A);
  end if;
    return new;
end;
$$ language plpgsql;

create or replace trigger Insert_R
after insert on R
for each row
execute function In_VR();

create or replace function In_VS() returns trigger as $$
begin
  if new.B in (select B from R where B = new.B and A>10) then
      insert into V(A)
        select distinct r.A
        from R r, S s
        where r.B = s.B and new.B = s.B and r.A > 10
          and r.A not in (select A from V);
  end if;
  return new;
end;
$$ language plpgsql;

create or replace trigger Insert_S
after insert on S
for each row
execute function In_VS();

/* testing the triggers */
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

\qecho '\n\nProblem 16'
/*Consider applying the following constraint over the relation personSkill.
"Each skill of a person who works for Apple should also be the skill of
the person who works for Google". Write a trigger that maintains the
constraint when inserting new pairs of (pid,skill) into the personSkill relation.(
You can ignore the constraint restriction to hold upon the already
existing previous records).*/

/* SECTION 16 BEGIN */
/* Trigger */
create or replace function add_skills()
returns trigger as 
$$
declare 
  new_s record;
begin
  if new.cname = 'Google' then 
    for new_s in
      select distinct ps.skill
      from personSkill ps, worksFor w
      where w.pid = ps.pid and w.cname = 'Apple'
    loop
      insert into personSkill values(new.pid, new_s.skill);
    end loop;
  end if;
  return new;
end;
$$ language plpgsql;

create or replace trigger skill_const
before insert on worksFor
for each row
execute procedure add_skills();

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

/* TEST YOUR RESULTS */
SELECT * FROM PERSONSKILL WHERE PID = 2001;
SELECT * FROM PERSONSKILL WHERE PID = 2002;
SELECT * FROM PERSONSKILL WHERE PID = 2003;
SELECT * FROM PERSONSKILL WHERE PID = 2004;
SELECT * FROM PERSONSKILL WHERE PID = 2005;

/* RETAINING THE ORIGINAL DATA */
DELETE FROM PERSONSKILL PS WHERE PS.PID IN (2002,2003,2004);
DELETE FROM SKILL S WHERE S.SKILL IN ('Devops','Cloud','Design');
DELETE FROM WORKSFOR W WHERE W.PID IN (2001,2002,2003,2004,2005);
DELETE FROM PERSON P WHERE P.PID IN (2001,2002,2003,2004,2005);

drop trigger if exists skill_const on worksFor;
/* SECTION 16 END */

\qecho '\n\nProblem 17'
/*Consider applying the following constraint over the relation knows. "Whenever
a person moves from a company A to a company B, he/she should
know all the managers working at the new company B." Refer to section
Q5 from the data file to retain the data to the original state.*/

-- restoring Knows table due to the edits made for a different question
drop table if exists Knows;

CREATE TABLE Knows(pid1 integer,
                   pid2 integer,
                   primary key(pid1, pid2),
                   foreign key (pid1) references Person (pid),
                   foreign key (pid2) references Person (pid));

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

/* SECTION Q17 BEGIN */
create or replace function knows_func() 
returns trigger as
$$
begin
  insert into KNOWS(pid1, pid2)
    select distinct new.pid, hm.mid
    from worksFor w, hasManager hm
    where w.pid = hm.mid and w.cname = new.cname 
    on conflict (pid1, pid2) do nothing;
  return new;
end;
$$ language plpgsql;

create or replace trigger knows_mngr
before update on worksFor
for each row
execute procedure knows_func();

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

/* Check your trigger and return the results*/

UPDATE WORKSFOR SET CNAME='Apple' WHERE WORKSFOR.PID = 1005;

select * from KNOWS k
where k.pid1 = 1005;

/* retaining the data */
SELECT * FROM RETAIN_DATA(1005,'Google');

UPDATE WORKSFOR SET CNAME='Google' WHERE WORKSFOR.PID = 1012;

/* Check your trigger and return the results*/
select * from KNOWS k
where k.pid1 = 1012;

/* retaining the data */
SELECT * FROM RETAIN_DATA(1012,'Apple');

DROP TABLE KNOWS_COPY;

/* SECTION Q17 END */

-- Connect to default database
\c postgres

-- Drop database created for this assignment
DROP DATABASE nchede;