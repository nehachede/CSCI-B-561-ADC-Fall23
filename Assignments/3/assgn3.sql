
CREATE DATABASE nchede;

\c nchede;


DROP SCHEMA PUBLIC CASCADE;


CREATE SCHEMA PUBLIC;

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
 (1018,1001);

\qecho 'Problem 5' 
/*
Find the cname and headquarter of each company that employs
persons residing in Cupertino and earning more than 40000.

select c.cname, c.headquarter
from company c
where c.cname in (select w.cname
from worksfor w
where w.salary > 40000 and
w.pid = SOME (select p.pid
from person p
where p.city = 'Cupertino'));

Translate the Pure SQL query to RA SQL using the translation algorithm step-by-step. */

-- 5(a).1. Translating SOME
select c.cname, c.headquarter
from Company c
where c.cname in (
  select w.cname
  from worksfor w, Person p
  where w.salary > 40000 and
    w.pid = p.pid and p.city = 'Cupertino'
);

-- 5(a).2. Translating IN
select distinct c.cname, c.headquarter
from Company c, worksfor w, Person p
where w.salary > 40000 and
  w.pid = p.pid and p.city = 'Cupertino' and 
  w.cname = c.cname;

-- 5(a).3. Projection over selection
select distinct c.cname, c.headquarter
from Company c, (
  select w.* 
  from worksFor w
  where w.salary > 40000
) w, 
(
  select p.* 
  from Person p 
  where p.city = 'Cupertino'
) p
where w.cname = c.cname and w.pid = p.pid;

-- 5(a).4. RA Query
select distinct c.cname, c.headquarter
from Company c
join (
  select w.* 
  from worksFor w
  where w.salary > 40000
) w
on w.cname = c.cname
join (
  select p.* 
  from Person p 
  where p.city = 'Cupertino'
) p
on w.pid = p.pid;

\qecho 'Problem 6';
/*
Find the cname and headquarter of each company (1) that has
at least one employee, and (2) doesn’t have any employees who
earn $50,000 or more but are missing either the ’Programming’
or ’Networks’ skills.

A possible way to write this query in Pure SQL is
select c.cname, c.headquarter
from company c
where exists (select 1
               from worksfor w
               where w.cname = c.cname)
and not exists (select 1
               from worksfor w
               where w.cname = c.cname
               and w.salary >= 50000
               and (w.pid not in (select ps.pid
                                   from personskill ps
                                   where skill = 'Programming')
               or w.pid not in (select ps.pid
                                   from personskill ps
                                   where skill = 'Networks')));
Translate the Pure SQL query to RA SQL using the trans-
lation algorithm step-by-step.
*/

-- Translating EXISTS
select distinct c.cname, c.headquarter
from Company c, worksFor w
where w.cname = c.cname 
  and not exists (select 1
  from worksfor w
  where w.cname = c.cname
    and w.salary >= 50000
    and (w.pid not in (select ps.pid
                      from personskill ps
                      where skill = 'Programming')
    or w.pid not in (select ps.pid
                      from personskill ps
                      where skill = 'Networks')));

-- Translating NOT EXISTS
select distinct q1.cname, q1.headquarter
from (
  select c.*
  from Company c, worksFor w
  where w.cname = c.cname
  except
  select c.*
  from Company c, worksFor w
  where w.cname = c.cname and w.salary >= 50000
    and (w.pid not in (select ps.pid
                    from personskill ps
                    where skill = 'Programming')
    or w.pid not in (select ps.pid
                    from personskill ps
                    where skill = 'Networks'))
) q1;

-- Removing OR
select distinct q1.cname, q1.headquarter
from (
  select c.*
  from Company c, worksFor w
  where w.cname = c.cname
  except (
    select c.*
    from Company c, worksFor w
    where w.cname = c.cname and w.salary >= 50000
        and w.pid not in (select ps.pid
                        from personskill ps
                        where skill = 'Programming')
    union
    select c.*
    from Company c, worksFor w
    where w.cname = c.cname and w.salary >= 50000
        and w.pid not in (select ps.pid
                        from personskill ps
                        where skill = 'Networks')
  )
) q1;

-- Translating NOT IN
select distinct q1.cname, q1.headquarter
from (
  select distinct c.cname, c.headquarter
  from Company c, worksFor w
  where w.cname = c.cname
  except
    select distinct q2.cname, q2.headquarter
    from (
      (
        select c.cname, c.headquarter, w.pid
        from Company c, worksFor w
        where w.cname = c.cname and w.salary >=50000
        except
        select c.cname, c.headquarter, w.pid
        from Company c, worksFor w, personSkill ps
        where w.pid = ps.pid and ps.skill = 'Programming'
      )
      union
      (
        select c.cname, c.headquarter, w.pid
        from Company c, worksFor w
        where w.cname = c.cname and w.salary >=50000
        except
        select c.cname, c.headquarter, w.pid
        from Company c, worksFor w, personSkill ps
        where w.pid = ps.pid and ps.skill = 'Networks'
      )
    ) q2
) q1;

-- RA SQL
select distinct q1.cname, q1.headquarter
from (
  select distinct c.cname, c.headquarter
  from Company c
  join worksFor w
  on w.cname = c.cname
  except
    select distinct q2.cname, q2.headquarter
    from (
      (
        select c.cname, c.headquarter, w.pid
        from Company c
        join worksFor w
        on w.cname = c.cname 
        where w.salary >=50000
        except
        select c.cname, c.headquarter, w.pid
        from Company c
        natural join worksFor w
        join personSkill ps
        on w.pid = ps.pid
        where ps.skill = 'Programming'
      )
      union
      (
        select c.cname, c.headquarter, w.pid
        from Company c
        join worksFor w
        on w.cname = c.cname 
        where w.salary >=50000
        except
        select c.cname, c.headquarter, w.pid
        from Company c
        natural join worksFor w
        join personSkill ps
        on w.pid = ps.pid 
        where ps.skill = 'Networks'
      )
    ) q2
) q1;

\qecho 'Problem 7';
/*
Find the pid and city of each person who does not know anyone
working for 'Amazon'.
• Formulate this query in Pure SQL.
• Translate the Pure SQL query to RA SQL using the translation algorithm step-by-step.
*/ -- Pure SQL

-- query from the question
select p.pid, p.city
from   Person p
where  false = all (select exists (select 1
                                  from   worksFor w
                                  where  p1.pid = w.pid 
                                    and w.cname = 'Amazon') and
                                    (p.pid,p1.pid) = some (
                                      select k.pid1, k.pid2
                                      from Knows k)
                   from Person p1);

-- Translating SOME
select p.pid, p.city
from Person p
where false = all (
  select exists (
    select 1
    from worksFor w, Knows k
    where p1.pid = w.pid 
      and w.cname = 'Amazon' and p.pid = k.pid1 and p1.pid = k.pid2
    )
  from Person p1
  );

-- Converting false = all to not exits
select distinct p.pid, p.city
from person p
where not exists (
  select 1
  from worksFor w, Knows k, Person p1
  where p1.pid = w.pid 
      and w.cname = 'Amazon' and p.pid = k.pid1 and p1.pid = k.pid2
);

-- translating not exists
select distinct q.pid, q.city
from (
  select p.*
  from Person p
  except
  select p.*
  from Person p, worksFor w, Knows k, Person p1
  where p1.pid = w.pid 
      and w.cname = 'Amazon' and p.pid = k.pid1 and p1.pid = k.pid2
) q;

-- joins: RA SQL
select distinct q.pid, q.city
from (
  select p.*
  from Person p
  except
  select p.*
  from Person p
  join Knows k
  on p.pid = k.pid1
  join Person p1
  on p1.pid = k.pid2
  join worksFor w
  on p1.pid = w.pid
  where w.cname = 'Amazon'
) q;


\qecho 'Problem 8'; 
/*
Find the cname of each company that (1) is not located in Sunnyvale, (2) employs at least one person and (3) whose workers
who make strictly less 70000 neither have the programming skill
nor the AI skill.
• Formulate this query in Pure SQL.
• Translate the Pure SQL query to RA SQL using the translation algorithm step-by-step.
*/ -- Pure SQL

-- translating outermost and innermost in
select distinct c.cname
from Company c, worksFor w
where c.cname = w.cname and not exists (
  select 1
  from companyLocation cl
  where w.cname = cl.cname and cl.city = 'Sunnyvale'
) and true = all (
  select p.pid not in (
      select ps.pid
      from personSkill ps
      where ps.skill = 'Programming' or ps.skill = 'AI'
    )
  from Person p, worksFor w
  where p.pid = w.pid and w.cname = c.cname and w.salary < 70000
  );

-- translating NOT EXISTS in where clause
select distinct c.cname
from Company c
join worksFor w 
on c.cname = w.cname
where true = ALL (
    select p.pid not in (
      select ps.pid
      from personSkill ps
      where ps.skill = 'Programming' or ps.skill = 'AI'
    )
  from Person p, worksFor w
  where p.pid = w.pid and w.cname = c.cname and w.salary < 70000
)
except
select distinct w.cname
from worksFor w
join companyLocation cl 
on w.cname = cl.cname
where cl.city = 'Sunnyvale';

-- translating ALL and NOT IN
select distinct q2.cname
from (
  select distinct c.cname
  from Company c
  join worksFor w 
  on c.cname = w.cname
  except
  select distinct c.cname
  from Company c
  join worksFor w 
  on c.cname = w.cname
  join personSkill ps
  on w.pid = ps.pid
  where ps.skill = 'Programming' or ps.skill = 'AI'
) q2
except
select distinct w.cname
from worksFor w
join companyLocation cl 
on w.cname = cl.cname
where cl.city = 'Sunnyvale';

-- translating OR
select distinct q2.cname
from (
  select distinct c.cname
  from Company c
  join worksFor w 
  on c.cname = w.cname
  except
  select distinct c.cname
  from Company c
  join worksFor w 
  on c.cname = w.cname
  join personSkill ps
  on w.pid = ps.pid
  where ps.skill = 'Programming' 
  intersect 
  select distinct c.cname
  from Company c
  join worksFor w 
  on c.cname = w.cname
  except
  select distinct c.cname
  from Company c
  join worksFor w 
  on c.cname = w.cname
  join personSkill ps
  on w.pid = ps.pid
  where ps.skill = 'AI'
) q2
except
select distinct w.cname
from worksFor w
join companyLocation cl 
on w.cname = cl.cname
where cl.city = 'Sunnyvale';

\qecho 'Problem 9'; 
/*
Find the ID of managers with AI skill who are managing atleast
2 people

• Formulate this query in Pure SQL.
• Translate the Pure SQL query to RA SQL using the trans-
lation algorithm step-by-step.
*/ -- Pure SQL

select distinct ps.pid
from personSkill ps
join hasManager hm
on ps.pid = hm.mid
join hasManager hm1
on hm1.mid = hm.mid
where hm.eid <> hm1.eid and ps.skill = 'AI';

select distinct ps.pid
from (select ps.pid from personSkill ps where ps.skill = 'AI') ps
join hasManager hm
on ps.pid = hm.mid
join hasManager hm1
on hm1.mid = hm.mid
where hm.eid <> hm1.eid;

\c postgres;


DROP DATABASE nchede;