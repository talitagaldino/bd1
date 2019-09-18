--Q1
SELECT * FROM department;

--Q2
SELECT * FROM dept_locations;

--Q3
SELECT * FROM employee;

--Q4
SELECT * FROM dependent;

--Q5
SELECT * FROM project;

--Q6
SELECT * FROM works_on;

--Q7
SELECT Fname, Lname FROM employee WHERE Sex = 'M';

--Q8
SELECT Fname FROM employee WHERE Sex = 'M' AND superssn IS NULL;

--Q9
SELECT e.Fname, s.Fname FROM employee AS e, employee AS s WHERE e.superssn = s.ssn;

--Q10
SELECT Fname FROM employee WHERE superssn ='333445555';

--Q11
SELECT d.dname, dl.dlocation 
FROM department AS d, dept_locations AS dl
WHERE d.dnumber = dl.dnumber;


--Q12
SELECT d.dname
FROM department AS d, dept_locations AS dl
WHERE dl.dlocation LIKE 'S%' AND d.dnumber = dl.dnumber;

--Q13
SELECT e.fname, e.Lname, d.dependent_name
FROM employee AS e, dependent AS d
WHERE e.ssn = d.essn;

--Q14
SELECT e.fname || '' || e.minit ||''|| e.lname AS full_name, e.salary
FROM employee AS e
WHERE e.salary > 50000;

--Q15
SELECT p.pname, d.dname
FROM project AS p, department AS d
WHERE p.dnum = d.dnumber;

--Q16
SELECT p.pname, e.fname
FROM project AS p, department AS d, employee AS e
WHERE d.mgrssn = e.ssn AND p.pnumber > 30 AND p.dnum = d.dnumber;

--Q17
SELECT p.pname, e.fname
FROM project AS p, employee AS e, works_on AS w
WHERE p.pnumber = w.pno  AND w.essn = e.ssn;

--Q18
SELECT e.fname, d.dependent_name, d.relationship
FROM dependent AS d, project AS p, employee AS e, works_on AS w
WHERE w.pno = 91 AND w.essn = d.essn AND d.essn = e.ssn AND w.essn = e.ssn AND w.pno = p.pnumber;
