-- This project is an Exploratory Data Analysis on the Titaic Dataset.
-- create database
create schema titanic_db;
use titanic_db;

-- import our dataset
-- describe my data
describe titanic;

-- Data Query Manipulation with select
SELECT 
    *
FROM
    titanic;

select * from titanic
where Age = 5;

-- how many total passengers are in the dataset?
SELECT 
    COUNT(*)
FROM
    titanic;

-- how many passengers died?
SELECT 
    COUNT(Survived)
FROM
    titanic
WHERE
    Survived = 0;

-- how many passengers survived?
SELECT 
    COUNT(Survived)
FROM
    titanic
WHERE
    Survived = 1;

-- how many men and women survived?
SELECT 
    COUNT(Survived), sex
FROM
    titanic
WHERE
    Survived = 1
GROUP BY sex;


-- how many men and women died?
SELECT 
    COUNT(Survived), sex
FROM
    titanic
WHERE
    Survived = 0
GROUP BY sex;

-- what is the average age of all the passengers?
SELECT 
    AVG(age) AS 'Average age of all passengers'
FROM
    titanic;

-- what is the average age of all the survivors?
SELECT 
    AVG(age)
FROM
    titanic
WHERE
    Survived = 1;

-- what is the average age of men and women survivors ?
SELECT 
    AVG(age), sex
FROM
    titanic
WHERE
    Survived = 1
GROUP BY sex;

-- what is the survival rate by class?
SELECT 
    COUNT(Survived), Pclass
FROM
    titanic
WHERE
    Survived = 1
GROUP BY Pclass;

-- get out unique values the embarked column
SELECT DISTINCT
    Embarked
FROM
    titanic;

-- what is the number of passengers that survived below 18?
SELECT 
    COUNT(Survived) AS 'Children below 18 survived'
FROM
    titanic
WHERE
    Survived = 1 AND age < 18;


-- what is the number of male and female that survived below 18 based?
SELECT 
    COUNT(Survived), sex AS 'Children below 13 survived'
FROM
    titanic
WHERE
    Survived = 1 AND age < 13
GROUP BY sex;

-- what is the number of male and female that died below 14 based?
SELECT 
    COUNT(Survived) AS 'Children below 13 died', sex
FROM
    titanic
WHERE
    Survived = 0 AND age < 13
GROUP BY sex;


-- find the youngest on the ship?
SELECT 
    MIN(age)
FROM
    titanic
WHERE
    age >= 1;

-- find the oldest on the ship?
SELECT 
    MAX(age)
FROM
    titanic;


-- what is the survial rate of passengers above 60?
SELECT 
    COUNT(Survived) AS 'Above 60', sex
FROM
    titanic
WHERE
    Survived = 1 AND age > 60
GROUP BY sex;

-- what is the number of passengers above 60?
SELECT 
    COUNT(Survived) AS 'Above 60', sex
FROM
    titanic
WHERE
    age > 60
GROUP BY sex;


-- calculate the total amount generated from the passengers
SELECT 
    COUNT(PassengerId) AS num_of_passenger,
    SUM(fare) AS total_amount
FROM
    titanic;

-- performing aggregations
SELECT 
    COUNT(DISTINCT ticket), Embarked
FROM
    titanic
GROUP BY Embarked;

SELECT 
    embarked,
    sex,
    AVG(Age) AS avg_tot,
    SUM(age) AS sum_avg,
    COUNT(PassengerId) AS pass_count,
    COUNT(ticket) AS ticket_count
FROM
    titanic
WHERE
    age >= 20 AND age <= 50
GROUP BY Embarked , sex;


SELECT 
    embarked,
    age,
    sex,
    AVG(age) AS avg_age,
    MAX(age) AS max_age,
    COUNT(PassengerId) AS pas_count,
    COUNT(DISTINCT Ticket) AS dist_ticket
FROM
    titanic
WHERE
    age >= 18
GROUP BY Embarked , sex
ORDER BY Embarked DESC , sex DESC;


-- using the having clause
SELECT 
    embarked,
    age,
    sex,
    AVG(age) AS avg_age,
    MAX(age) AS max_age,
    COUNT(PassengerId) AS pas_count,
    COUNT(DISTINCT Ticket) AS dist_ticket
FROM
    titanic
WHERE
    age >= 18
GROUP BY Embarked , sex
HAVING avg_age > 30
ORDER BY Embarked DESC , sex DESC;