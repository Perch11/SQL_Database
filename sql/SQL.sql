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
values (2, 'Cherri', 'Female', 'Librarian', 'Support', 'Twinder', 23, '7/9/2022', '$1628.60');