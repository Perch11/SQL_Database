create table Employee (
                          Employee_ID INT PRIMARY KEY NOT NULL ,
                          Name VARCHAR(50) NOT NULL ,
                          Gender VARCHAR(50) NOT NULL ,
                          Position VARCHAR(50) ,
                          Department VARCHAR(50) ,
                          Office VARCHAR(50) ,
                          Age INT NOT NULL ,
                          Start_Date DATE NOT NULL ,
                          Salary VARCHAR(50) NOT NULL
);


insert into Employee (Employee_ID, Name, Gender, Position, Department, Office, Age, Start_Date, Salary)
values (1, 'Cherri', 'Female', 'Librarian', 'Support', 'Twinder', 23, '7/9/2022', '$1628.60');

create table Project (
                         Project_ID INT PRIMARY KEY NOT NULL ,
                         Project_Name VARCHAR(100) NOT NULL ,
                         Department VARCHAR(100) NOT NULL ,
                         Start_Date DATE NOT NULL ,
                         End_Date DATE NOT NULL
);

insert into Project (Project_ID, Project_Name, Department, Start_Date, End_Date)
values (1, 'Kearny Financial', 'Engineering', '2/22/2023', '10/2/2023');
//1
    company=# select * from employee;

//2
    company=# select distinct department from employee;
//3
    company=# select * from employee where position = 'Sales Manager';
//4
    company=# select * from employee where gender = 'Female'
                                       AND (Department = 'Marketing' OR position = 'HR Director');
//5
    company=# select * from employee where department = 'Sales' order by salary desc;
//6
    company=# select * from employee where position in('Design Engineer', 'Accountant');
//7
    company=# select * from employee where age > 29 and age < 41;
    company=# select * from employee where age between 30 and 40;
//8
    company=# select department, salary as "Highest Salary"
              from employee where salary in (select max(salary) from employee group by department);
//9
    company=# select avg(replace(salary,'$',''):: numeric) as "Average Salary"
              from employee where start_date > '01.01.2023';
//10
    company=# select * from project where start_date > '2023-01-01' and end_date < '2023-12-31';
//11
    company=# select * from project where start_date between '2022-01-01' and '2022-12-31';