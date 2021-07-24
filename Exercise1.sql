/* 1. (Project, RESTRICT) List all drivers 
(number and name) who have a salary of 
less than 1800.*/
SELECT bdno AS number, bdname AS name 
FROM BusDriver 
WHERE bdsalary < 1800;

/* 2. (Conditional operator LIKE) 
List all bus drivers (number and name) 
whose name begins with J. */
SELECT bdno AS number, bdname AS name 
FROM BusDriver 
WHERE bdname LIKE 'J%';

/* 3. (Conditional operator BETWEEN) 
List all bus drivers details for those
drivers who have a salary between 2000 and 4000 */
SELECT *
FROM BusDriver 
WHERE bdsalary BETWEEN 2000 AND 4000;


/* 4. (AND) List all buses 
(registration number and model) of type 2 
which are not based at depot 101. */
SELECT regno AS registration_number, model
FROM Bus
WHERE tno = 2 AND dno <> 101;

/* 5. (OR) List buses (all details )
which are either Volvo model s or Mercedes models. */
SELECT *
FROM Bus
WHERE model LIKE '%Mercedes%' OR model LIKE '%Volvo%';

/* What is the output when you change OR to AND? */
SELECT *
FROM Bus
WHERE model LIKE '%Mercedes%' AND model LIKE '%Volvo%';

/* 6. (Controlling duplicates using DISTINCT) 
List all depot numbers in the bus table. */
SELECT dno AS depot_number FROM Bus;
/* Now eliminate all duplicates. */
SELECT DISTINCT(dno) AS depot_number FROM Bus;

/* 7. (Two table Join – INNER JOIN) 
List all cleaners (number and name) 
with the name and address of their depot, 
but only for those cleaners located at a depot. */
SELECT Cleaner.cno AS cleaner_number, Cleaner.cname 
AS cleaner_name
FROM Cleaner INNER JOIN Depot ON Cleaner.dno = Depot.dno;

/* 8. (Three table JOIN) List bus drivers 
(number and name) and the bus types (description) 
for which each bus driver has had training */
SELECT BusDriver.bdno AS driver_number,
BusDriver.bdname AS driver_name, 
BusType.tdescript AS bus_type_description
FROM BusDriver JOIN BusType JOIN Training
ON BusDriver.bdno = Training.bdno
AND Training.tno = BusType.tno
ORDER BY BusDriver.bdno;

SELECT BusDriver.bdno AS driver_number,
BusDriver.bdname AS driver_name, 
BusType.tdescript AS bus_type_description
FROM BusDriver 
JOIN Training ON BusDriver.bdno = Training.bdno
JOIN BusType ON Training.tno = BusType.tno
ORDER BY BusDriver.bdno;

/* 9. (Four table JOIN) List all cleaners 
(number and name), the name of their depot 
and the bus registration numbers 
with the type of bus that they are responsible for. */
SELECT Cleaner.cno AS cleaner_number, 
Cleaner.cname AS cleaner_name,
Depot.dname AS depot_name,
Bus.regno AS bus_reg_number,
BusType.tdescript AS bus_type
FROM Cleaner 
JOIN Depot ON Cleaner.dno = Depot.dno
JOIN Bus ON Cleaner.dno = Bus.dno
JOIN BusType ON Bus.tno = BusType.tno
ORDER BY Cleaner.cname;

/* 10. (OUTER JOIN) Rewrite question 7 as an OUTER JOIN. 
Describe the query in English. Now list all cleaners 
(number and name), the name of their depot and the bus 
registration numbers with the type of bus that they are
responsible for, including those cleaners who are not 
assigned to a bus or a depot. */
SELECT Cleaner.cno AS cleaner_number, Cleaner.cname 
AS cleaner_name, Depot.dname AS depot_name, 
Depot.daddress AS depot_address 
FROM Cleaner INNER JOIN Depot ON Cleaner.dno = Depot.dno;