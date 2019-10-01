--Q1
SELECT COUNT(*)
FROM employee 
WHERE sex = 'F';

--Q2
SELECT AVG(salary)
FROM employee
WHERE sex = 'M' AND address LIKE '%TX';

--Q3
SELECT superssn AS supervisor, COUNT(ssn) AS qtd_supervisionados
FROM employee
GROUP BY supervisor
ORDER BY qtd_supervisionados;

--Q4
SELECT s.fname AS supervisor_nome, COUNT(e.ssn) AS qtd_supervisionados
FROM employee AS e JOIN employee AS s ON e.superssn = s.ssn
GROUP BY supervisor_nome
ORDER BY qtd_supervisionados;

--Q5
SELECT s.fname AS supervisor_nome, COUNT(e.ssn) AS qtd_supervisionados
FROM employee AS e LEFT OUTER JOIN employee AS s ON e.superssn = s.ssn
GROUP BY supervisor_nome
ORDER BY qtd_supervisionados;

--Q6
SELECT COUNT 