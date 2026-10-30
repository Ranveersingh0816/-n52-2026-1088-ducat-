CREATE DATABASE company_training;
USE company_training;
CREATE TABLE departments (
department_id INT NOT NULL,
dept_name VARCHAR(80) NOT NULL,
city VARCHAR(60)
);
CREATE TABLE employees (
employee_id INT NOT NULL,
employee_name VARCHAR(100) NOT NULL,
email VARCHAR(120),
department_id INT NOT NULL,
salary DECIMAL(10,2),
status VARCHAR(20)
);

alter table departments add primary key (department_id) ;
desc departments;
alter table employees add primary key(employee_id);
desc employees;

alter table staff add column location varchar(100);
select * from staff;

alter table departments change column dept_name  department_name varchar(80) not null;
desc departments;

alter table employees modify salary decimal(12,2) not null;
alter table employees modify status varchar(20) default('active');
 alter table employees add constraint email unique(email);
desc employees;

alter table employees rename to staff;
select * from staff;

alter table staff 
add constraint fk_staff_department_id 
foreign key (department_id)
references departments(department_id);
desc staff;

alter table staff
drop index email;

alter table staff
drop foreign key fk_staff_department_id;

alter table staff
drop primary key ;
desc staff;

alter table staff
add  primary key (employee_id);
desc staff;

alter table staff
drop column location;

create database company_managmnet ;
alter table company_departemnt
rename table company_table