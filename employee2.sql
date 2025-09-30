use microsoft;
CREATE TABLE employee2 (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(10),
    department_name VARCHAR(50)
);


INSERT INTO employee2 (employee_id, first_name, last_name, gender, department_name) VALUES
(101, 'mayank', 'Doe', 'Male', 'Engineering'),
(102, 'atul', 'Smith', 'Female', 'Human Resources'),
(103, 'Robert', 'Johnson', 'Male', 'Finance'),
(104, 'riya', 'Davis', 'Female', 'Marketing'),
(105, 'Michael', 'Brown', 'Male', 'IT'),
(106, 'Sophia', 'Wilson', 'Female', 'Engineering'),
(107, 'kalu', 'Martinez', 'Male', 'Sales'),
(108, 'Olivia', 'Garcia', 'Female', 'Finance'),
(109, 'monu', 'Anderson', 'Male', 'Operations'),
(110, 'Isabella', 'Taylor', 'Female', 'Research');

select*from employee2;