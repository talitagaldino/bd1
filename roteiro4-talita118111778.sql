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
--SELECT dname, dlocation FROM department, dept_locations AS d, dept_locations AS x WHERE d.dnumber = x.dnumber;


--Q12

--Q13

--Q14
