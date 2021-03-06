/*Create Database*/
CREATE DATABASE EmpInfo
USE EmpInfo;

/*Create Table employee*/
CREATE TABLE employee (
    EMPLOYEE_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    FIRST_NAME VARCHAR(50) NOT NULL,
    LAST_NAME VARCHAR(50) NOT NULL,
    SALARY INT NOT NULL,
    JOINING_DATE DATETIME NOT NULL,
    MANAGER INT,
    DEPARTMENT VARCHAR(70) NOT NULL
);

/*Insert data into employee table*/
INSERT INTO employee 
(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, MANAGER, DEPARTMENT)
VALUES
(1, 'John', 'Abraham', 1000000, '2013-01-01 12:00:00', 3, 'Banking'),
(2, 'Michael', 'Clarke', 800000, '2013-01-01 12:00:00', 4, 'Insurance'),
(3, 'Roy', 'Thomas', 700000, '2013-02-01 12:00:00', null, 'Banking'),
(4, 'Tom', 'Jose', 600000, '2013-02-01 12:00:00', null, 'Insurance'),
(5, 'Jerry', 'Pinto', 650000, '2013-02-01 12:00:00', 4, 'Insurance'),
(6, 'Philip', 'Mathew', 750000, '2013-01-01 12:00:00', 7, 'Services'),
(7, 'TestName1', '123', 650000, '2013-01-01 12:00:00', null, 'Services'),
(8, 'TestName2', 'Lname%', 600000, '2013-02-01 12:00:00', 4, 'Insurance');




/*1. Write a query to print the number of employees per department in the organization*/
SELECT COUNT(EMPLOYEE_ID), DEPARTMENT FROM EMPLOYEE GROUP BY DEPARTMENT;

/*2. Write a SQL query to find the name of the top-level manager of each department*/
SELECT NAMAGER_NAME AS TOP FROM employee GROUP BY DEPARTMENT HAVING EXPERIENCE = 
(SELECT MAX(EXPERIENCE) FROM employee GROUP BY DEPARTMENT);



/*Create table Incentives*/
CREATE TABLE INCENTIVES (
    EMPLOYEE_REF_ID INT NOT NULL ,
    INCENTIVE_DATE DATE NOT NULL,
    INCENTIVE_AMOUNT INT NOT NULL,
    FOREIGN KEY (EMPLOYEE_REF_ID) REFERENCES EMPLOYEE(EMPLOYEE_ID)
);

/*Insert data into incentive table*/
INSERT INTO INCENTIVES 
(EMPLOYEE_REF_ID, INCENTIVE_DATE, INCENTIVE_AMOUNT)
VALUES
(1, '2013-02-06', 5000),
(2, '2013-02-01', 3000),
(3, '2013-02-07', 4000),
(1, '2013-01-01', 4500),
(2, '2013-01-04', 3500),
(1, '2013-02-08', 6000);

/*3. Write a query to find the total incentive received by a given employee in a given month.*/
/*Let the given monthe be january*/
SELECT SUM(INCENTIVE_AMOUNT) FROM Incentives GROUP BY EMPLOYEE_REF_ID HAVING MONTH(INCENTIVE_DATE) = '01';


/*4. Write a query to find the month where employees got maximum incentive*/
SELECT EXTRACT(MONTH FROM INCENTIVE_DATE) MONTH
FROM  Incentives
WHERE INCENTIVE_AMOUNT=
(SELECT MAX(INCENTIVE_AMOUNT) FROM Incentives);
