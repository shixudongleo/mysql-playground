USE sakila;

CREATE TABLE emp (
  `EMPNO` INTEGER,
  `ENAME` VARCHAR(6),
  `JOB` VARCHAR(9),
  `MGR` VARCHAR(4),
  `SAL` INTEGER,
  `COMM` VARCHAR(4),
  `DEPTNO` INTEGER,
  `HIREDATE` DATE
);

INSERT INTO emp
  (`EMPNO`, `ENAME`, `JOB`, `MGR`, `SAL`, `COMM`, `DEPTNO`, `HIREDATE`)
VALUES
  ('7369', 'SMITH', 'CLERK', '7902', '800', 'null', '20', '2005-12-17'),
  ('7499', 'ALLEN', 'SALESMAN', '7698', '1600', '300', '30', '2006-02-20'),
  ('7521', 'WARD', 'SALESMAN', '7698', '1250', '500', '30', '2006-02-22'),
  ('7566', 'JONES', 'MANAGER', '7839', '2975', 'null', '20', '2006-04-02'),
  ('7654', 'MARTIN', 'SALESMAN', '7698', '1250', '1400', '30', '2006-09-28'),
  ('7698', 'BLAKE', 'MANAGER', '7839', '2850', 'null', '30', '2006-05-01'),
  ('7782', 'CLARK', 'MANAGER', '7839', '2450', 'null', '10', '2006-06-09'),
  ('7788', 'SCOTT', 'ANALYST', '7566', '3000', 'null', '20', '2007-12-09'),
  ('7839', 'KING', 'PRESIDENT', 'null', '5000', 'null', '10', '2006-11-17'),
  ('7844', 'TURNER', 'SALESMAN', '7698', '1500', '0', '30', '2006-09-08'),
  ('7876', 'ADAMS', 'CLERK', '7788', '1100', 'null', '20', '2008-01-12'),
  ('7900', 'JAMES', 'CLERK', '7698', '950', 'null', '30', '2006-12-03'),
  ('7902', 'FORD', 'ANALYST', '7566', '3000', 'null', '20', '2006-12-03'),
  ('7934', 'MILLER', 'CLERK', '7782', '1300', 'null', '10', '2007-01-23');

  CREATE TABLE dept (
  `DEPTNO` INTEGER,
  `DNAME` VARCHAR(10),
  `LOC` VARCHAR(7)
);

INSERT INTO dept
  (`DEPTNO`, `DNAME`, `LOC`)
VALUES
  ('10', 'ACCOUNTING', 'NEW'),
  ('20', 'RESEARCH', 'DALLAS'),
  ('30', 'SALES', 'CHICAGO'),
  ('40', 'OPERATIONS', 'BOSTON');


CREATE TABLE t1 (
  `ID` INTEGER
);

INSERT INTO t1
  (`ID`)
VALUES
  ('1');

CREATE TABLE t10 (
  `ID` INTEGER
);

INSERT INTO t10
  (`ID`)
VALUES
  ('1'),
  ('2'),
  ('3'),
  ('4'),
  ('5'),
  ('6'),
  ('7'),
  ('8'),
  ('9'),
  ('10');