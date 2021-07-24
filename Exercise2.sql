/* 1. (Built-in functions) Find the maximum, 
minimum and average driver’s salary. */
SELECT MAX(bdsalary) AS max_driver_salary, 
MIN(bdsalary) AS min_driver_salary, 
AVG(bdsalary) AS average_driver_salary 
FROM BusDriver;

/* 2. (Built-in functions) Count the number of drivers 
who are working for Middlesex Transport at the moment. 
Change the column heading in the result to make it ‘friendly’. */


/* 3. (Use a subquery to answer this question) 
Find route information (route number and description) 
for all routes which connect to the Holloway Depot. */
SELECT Route.rno AS route_number,  
Route.rdescript AS route_description 
FROM Route  WHERE Route.dno = 
  (SELECT Depot.dno FROM Depot WHERE Depot.dname = 'Holloway');

/* 4. Now try question 3 with a JOIN. */
SELECT Route.rno AS route_number, 
Route.rdescript AS route_description 
FROM Route JOIN Depot ON Route.dno = Depot.dno 
WHERE Depot.dname = 'Holloway';

/* 5. (NULL) List bus details for any bus 
which has not been assigned to a depot. */
SELECT  * FROM Bus WHERE Bus.dno IS NULL;

/* 6.(NOT IN) List all drivers (name and number) 
who are on the system but are not yet responsible for a route. */
SELECT BusDriver.bdno AS driver_number,  
BusDriver.bdname AS driver_name 
FROM BusDriver WHERE BusDriver.dno 
NOT IN (SELECT Route.dno FROM Route);

/* 7. (GROUP BY) List each depot name and the average salary 
for drivers working at the depot. */
SELECT Depot.dname AS depot_name, 
AVG(bdsalary) AS average_salary_per_depot 
FROM Depot JOIN BusDriver ON Depot.dno = BusDriver.dno 
GROUP BY Depot.dno;
/* With Where */
SELECT Depot.dname AS depot_name, 
AVG(bdsalary) AS average_salary_per_depot 
FROM Depot, BusDriver WHERE Depot.dno = BusDriver.dno 
GROUP BY Depot.dno;

/* 8. (GROUP BY HAVING) List each depot by name 
and count the number of bus drivers who are assigned to each, 
for depots with more than one driver. */
SELECT Depot.dname AS depot_name, 
COUNT(BusDriver.bdno) AS drivers_assigned 
FROM Depot JOIN BusDriver ON Depot.dno = BusDriver.dno 
GROUP BY Depot.dno HAVING drivers_assigned > 1;

/* 9. (GROUP BY plus JOIN) For each cleaner responsible 
for buses of bus type doubledecker or minibus, 
list his/her name and number and find the total number 
for which each cleaner is responsible. */
SELECT Cleaner.cname AS cleaner_name, 
  Cleaner.cno AS cleaner_number, 
  COUNT(Bus.regno) AS total_count 
FROM Cleaner JOIN Depot ON Cleaner.dno = Depot.dno 
JOIN Bus ON Depot.dno = Bus.dno 
JOIN BusType ON BusType.tno = Bus.tno 
WHERE BusType.tdescript IN ('double-decker','midibus') 
GROUP BY cname;
