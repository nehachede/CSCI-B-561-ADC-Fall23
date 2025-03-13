
CREATE DATABASE nchede;

\c nchede;

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
select distinct w.cname, w.pid, w.salary
from worksFor w
where not exists (
	select 1
  from worksFor w2
  where w.cname = w2.cname and w2.salary < w.salary
  ) and exists (
  	select 1
  	from knows k
  	where w.pid = k.pid1 and exists (
			select 1
			from personSkill ps
			where k.pid2 = ps.pid and ps.skill = 'OperatingSystems'
  	)
);

\qecho 'Problem-1b'
--Formulate this query in Pure SQL by only using the IN, NOT IN, SOME, or ALL set membership predicates.
--You can not use the set operations INTERSECT, UNION, and EXCEPT.
select distinct w.cname, w.pid, w.salary
from worksFor w
where (w.cname, w.salary) in (
  select w2.cname, w2.salary
  from worksFor w2
  where w2.cname = w.cname and w2.salary <= all (
    select distinct w3.salary
    from worksFor w3
    where w3.cname = w2.cname
  )
) and w.pid in (
    select distinct k.pid1
    from Knows k
    where k.pid2 in (
      select distinct ps.pid
      from personSkill ps
      where ps.skill = 'OperatingSystems'
    )
);

\qecho 'Problem-1c'
--Formulate this query in Pure SQL by only using the set operations INTERSECT, UNION, and EXCEPT.
select distinct w.cname, w.pid, w.salary
from (
  select distinct w1.cname, w1.pid, w1.salary
  from worksFor w1
  except
  select distinct w3.cname, w3.pid, w3.salary
  from worksFor w3, worksFor w4
  where w3.cname = w4.cname and not w3.salary <= w4.salary 
  ) w

intersect

select distinct w2.cname, w2.pid, w2.salary
from worksFor w2, Knows k, personSkill ps
where w2.pid = k.pid1 and k.pid2 = ps.pid and ps.skill = 'OperatingSystems';

-- Find the name, salary and city of each person
-- who (a) lives in a city where no one has the Networks skill and
-- (b) earns the highest salary in his/her company.

\qecho 'Problem-2a'
--Formulate this query in Pure SQL by only using the
--EXISTS or NOT EXISTS set predicates. You can not use the set operations INTERSECT, UNION, and EXCEPT.
select distinct p.pname, w.salary, p.city
from Person p, worksFor w
where p.pid = w.pid and not exists (
  select 1
  from Person p1, personSkill ps
  where p.city = p1.city and p1.pid = ps.pid and ps.skill = 'Networks'
) and not exists (
  select 1
  from worksFor w1
  where w.cname = w1.cname and w.salary < w1.salary
);

\qecho 'Problem-2b'
--Formulate this query in Pure SQL by only using the IN, NOT IN, SOME, or ALL set membership predicates.
--You can not use the set operations INTERSECT, UNION, and EXCEPT.
select distinct p.pname, w.salary, p.city
from Person p, worksFor w
where p.pid = w.pid and w.salary >= all (
  select distinct w1.salary
  from worksFor w1
  where w1.cname = w.cname
) and p.city not in (
  select distinct p.city
  from Person p, personSkill ps
  where p.pid = ps.pid and ps.skill = 'Networks'
);

\qecho 'Problem-2c'
--Formulate this query in Pure SQL by only using the set operations INTERSECT, UNION, and EXCEPT.
select distinct tmp.pname, tmp.salary, tmp.city
from (
  select distinct p1.pname, w1.salary, p1.city
  from worksFor w1, Person p1
  where w1.pid = p1.pid
  except
  select distinct p2.pname, w3.salary, p2.city
  from worksFor w3, worksFor w4, Person p2
  where w3.pid = p2.pid and 
    w3.cname = w4.cname and not w3.salary >= w4.salary 
  ) tmp

intersect

select distinct tmp2.pname, tmp2.salary, tmp2.city
from (
  select distinct p1.pname, w1.salary, p1.city
  from worksFor w1, Person p1
  where w1.pid = p1.pid 
  except
  select distinct p2.pname, w3.salary, p2.city
  from worksFor w3, Person p2, personSkill ps
  where w3.pid = p2.pid and p2.pid = ps.pid and ps.skill = 'Networks'
) tmp2;

--Find each pair (c1, c2) of cnames of different companies such that
--no employee of c1 and no employee of c2 live in Chicago.
\qecho 'Problem-3a'
--Formulate this query in Pure SQL by only using the
--EXISTS or NOT EXISTS set predicates. You can not use the set operations INTERSECT, UNION, and EXCEPT.
select distinct c1.cname as c1, c2.cname as c2
from Company c1, Company c2
where c1.cname <> c2.cname and not exists (
  select 1
  from Person p, worksFor w1
  where p.pid = w1.pid and w1.cname = c1.cname and p.city = 'Chicago'
) and not exists (
  select 1
  from Person p1, worksFor w2 
  where p1.pid = w2.pid and w2.cname = c2.cname and p1.city = 'Chicago'
);

\qecho 'Problem-3b'
--Formulate this query in Pure SQL by only using the IN, NOT IN, SOME, or ALL set membership predicates.
--You can not use the set operations INTERSECT, UNION, and EXCEPT.
select distinct c1.cname as c1, c2.cname as c2
from Company c1, Company c2
where c1.cname <> c2.cname and c1.cname not in (
  select w1.cname
  from Person p, worksFor w1
  where p.pid = w1.pid and w1.cname = c1.cname and p.city = 'Chicago'
) and c2.cname not in (
  select w2.cname
  from Person p1, worksFor w2 
  where p1.pid = w2.pid and w2.cname = c2.cname and p1.city = 'Chicago'
);

\qecho 'Problem-3c'
--Formulate this query in Pure SQL by only using the set operations INTERSECT, UNION, and EXCEPT.
select distinct c1.cname as c1, c2.cname as c2
from Company c1, Company c2
where c1.cname <> c2.cname

except

select c1.cname as c1, c2.cname as c2
from Company c1, Company c2
where c1.cname <> c2.cname
intersect
select distinct c1.cname as c1, c2.cname as c2
from Company c1, Company c2, Person p1, worksFor w1
where c1.cname = w1.cname and p1.pid = w1.pid and p1.city = 'Chicago'

except

select c1.cname as c1, c2.cname as c2
from Company c1, Company c2
where c1.cname <> c2.cname
intersect
select distinct c1.cname as c1, c2.cname as c2
from Company c1, Company c2, Person p2, worksFor w2
where c2.cname = w2.cname and p2.pid = w2.pid and p2.city = 'Chicago';

--Reconsider Problem 1. Formulate this query in RA SQL
\qecho 'Problem-4b'
--Find each triple (c, p, s) where c is the cname of a company, p is the pid of a person who earns the lowest salary at that company and knows at least someone who has Operating Systems skill, and s is the salary of p.
select distinct w1.cname, w1.pid, w1.salary
from (
  select distinct w1.*
  from worksFor w1
  except
  select distinct w3.*
  from worksFor w3
  join worksFor w4
  on w3.cname = w4.cname and not w3.salary <= w4.salary 
  ) w1

intersect

select distinct w2.cname, w2.pid, w2.salary
from worksFor w2 
JOIN Knows k
on w2.pid = k.pid1
JOIN (
  select ps.*
  from personSkill ps
  where ps.skill = 'OperatingSystems'
  ) q
on k.pid2 = q.pid;

--Reconsider Problem 2. Formulate this query in RA SQL
\qecho 'Problem-5b'
select distinct w1.pname, w1.salary, w1.city
from (
  select distinct w1.*, p1.*
  from worksFor w1
  join Person p1
  on w1.pid = p1.pid
  except
  select distinct w3.*, p2.*
  from worksFor w3
  join worksFor w4
  on w3.cname = w4.cname and w3.salary < w4.salary 
  join Person p2
  on w3.pid = p2.pid 
  ) w1

intersect

select distinct tmp2.pname, tmp2.salary, tmp2.city
from (
  select distinct w1.*, p1.*
  from worksFor w1
  join Person p1
  on w1.pid = p1.pid 
  except
  select distinct w3.*, p2.*
  from worksFor w3
  join Person p2
  on w3.pid = p2.pid
  join (
      select distinct ps.pid
      from personSkill ps
      where ps.skill = 'Networks'
    ) ps
  on p2.pid = ps.pid
) tmp2;

--Reconsider Problem 3. Formulate this query in RA SQL
\qecho 'Problem-6b'
select distinct c1.cname as c1, c2.cname as c2
from Company c1
join Company c2
on c1.cname <> c2.cname
join worksFor w1
on c1.cname = w1.cname
join worksFor w2
on c1.cname = w2.cname
join Person p1 
on w1.pid = p1.pid
join Person p2
on w2.pid = p2.pid
where p1.city <> 'Chicago' and p2.city <> 'Chicago';

\qecho 'Problem 10'

/*Create a materialized view CompanyKnownPerson such that, for each company,
the view returns the pid of Persons who are known by at least two different people (other than pid)
from the same company and the pid earns more salary than them. Then test your view.*/
drop view if exists CompanyKnownPerson;

create view CompanyKnownPerson as
  select distinct p.pid
  from Person p, worksFor w1
  where p.pid = w1.pid and exists (
    select 1
    from knows k1, worksFor w2
    where (k1.pid2 = p.pid and k1.pid1 = w2.pid and 
        w1.salary > w2.salary and w1.cname = w2.cname)
    and exists (
      select 1
      from knows k2, worksFor w3
      where (k1.pid1<>k2.pid1 and k2.pid2 = p.pid and k2.pid1 = w3.pid and 
        w1.salary > w3.salary and w1.cname = w3.cname)
    )
  );

select * from CompanyKnownPerson;

\qecho 'Problem 11'

/*Create a parameterized view SkillOnlyOnePerson (skill1 text) that returns pair of different persons pid1, pid2 such that
pid1 should have the skill identified by skill1 and pid2 should not have the skill identified by skill1.
Note that pid2 should have at least one skill.
Test your view for skill1 = WebDevelopment.*/

create or replace function SkillOnlyOnePerson(inputskill text)
  returns table(pid1 integer, pid2 integer) as
  $$
    select distinct ps1.pid, ps2.pid
    from personSkill ps1, personSkill ps2
    where ps1.pid <> ps2.pid and 
      ps1.skill = inputskill and 
      ps2.skill <> inputskill and
      ps2.pid in (
        select distinct ps3.pid
        from personSkill ps3
        where ps3.pid <> ps1.pid
      );
  $$ language SQL;

select op.pid1, op.pid2
from SkillOnlyOnePerson('WebDevelopment') op;

\qecho 'Problem 12'
/*Let PC(parent: integer, child: integer) be a rooted parent-child tree. So a pair (n,m) in PC indicates that node n is a parent of node m.
The sameGeneration(n1, n2) binary relation is inductively defined using the following two rules:
If n is a node in PC, then the pair (n,n) is in the sameGeneration relation. (Base rule)
If n_1 is the parent of m1 in PC and n2 is the parent of m2 in Tree and (n1,n2) is a pair in the sameGeneration relation then (m1,m2) is a pair in the sameGeneration relation. (Inductive Rule)
Write a recursive view for the sameGeneration relation.
Test your view. */
with recursive sameGeneration(n1, n2) as (
  select p.parent as n1, p.parent as n2
  from pc p
  union
  select p1.child as n1, p2.child as n2
  from sameGeneration s, pc p1, pc p2
  where s.n1 = p1.parent and s.n2 = p2.parent
) 
select * from sameGeneration
order by n1, n2;

-- Connect to default database
\c postgres

-- Drop database created for this assignment
DROP DATABASE nchede;

