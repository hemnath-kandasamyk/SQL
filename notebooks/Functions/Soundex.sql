-- SOUNDEX() Functions in SQL 

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50)
);

INSERT INTO Employees (employee_id, employee_name)
VALUES
(1, 'Smith'),
(2, 'Smyth'),
(3, 'Smythe'),
(4, 'Steven'),
(5, 'Stephen'),
(6, 'Stefan'),
(7, 'John'),
(8, 'Jon'),
(9, 'Sean'),
(10, 'Shawn'),
(11, 'Brian'),
(12, 'Bryan'),
(13, 'Eric'),
(14, 'Erik'),
(15, 'Catherine'),
(16, 'Katherine'),
(17, 'Sara'),
(18, 'Sarah'),
(19, 'Michael'),
(20, 'Micheal');

select * from Employees;

SELECT
    employee_name,
    SOUNDEX(employee_name) AS sound_code
FROM Employees;

SELECT *
FROM Employees
WHERE SOUNDEX(employee_name) = SOUNDEX('Stevan');

