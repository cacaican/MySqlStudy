# 1.准备数据
create database db1;
    use db1;
    create table employees
    (
    employee_id int(11) primary key not null auto_increment,
    employee_name varchar(50) not null,
    employee_sex varchar(10) default '男',
    hire_date datetime not null default current_timestamp,
    employee_mgr int(11),
    employee_salary float default 3000,
    department_id int(11)
    );
    insert into employees(employee_name,employee_sex,employee_mgr,employee_salary,department_id) values ('David Tian','男',10,7500,1);
    insert into employees(employee_name,employee_sex,employee_mgr,employee_salary,department_id) values ('Black Xie','男',10,6600,1);
    insert into employees(employee_name,employee_sex,employee_mgr,employee_salary,department_id) values ('Moses Wang','男',10,4300,1);
    insert into employees(employee_name,employee_sex,employee_mgr,employee_salary,department_id) values ('Rena Ruan','女',10,5300,1);
    insert into employees(employee_name,employee_sex,employee_mgr,employee_salary,department_id) values ('Sunshine Ma','女',10,6500,2);
    insert into employees(employee_name,employee_sex,employee_mgr,employee_salary,department_id) values ('Scott Gao','男',10,9500,2);
    insert into employees(employee_name,employee_sex,employee_mgr,employee_salary,department_id) values ('Warren Si','男',10,7800,2);
    insert into employees(employee_name,employee_sex,employee_mgr,employee_salary,department_id) values ('Kaishen Yang','男',10,9500,3);
    insert into employees(employee_name,employee_sex,employee_mgr,employee_salary,department_id) values ('Simon Song','男',10,5500,3);
    insert into employees(employee_name,employee_sex,employee_mgr,employee_salary,department_id) values ('Brown Guan','男',10,5000,3);
    insert into employees(employee_name,employee_sex,employee_mgr,employee_salary,department_id) values ('Eleven Chen','女',10,3500,2);
    insert into employees(employee_name,employee_sex,employee_mgr,employee_salary,department_id) values ('Cherry Zhou','女',10,5500,4);
    insert into employees(employee_name,employee_sex,employee_mgr,employee_salary,department_id) values ('Klause He','男',10,4500,5);
    insert into employees(employee_name,employee_sex,employee_mgr,employee_salary,department_id) values ('Maven Ma','男',10,4500,6);
    insert into employees(employee_name,employee_sex,employee_mgr,employee_salary,department_id) values ('Stephani Wang','女',10,5500,7);
    insert into employees(employee_name,employee_sex,employee_mgr,employee_salary,department_id) values ('Jerry Guo','男',10,8500,1);
    insert into employees(employee_name,employee_sex,employee_mgr,employee_salary,department_id) values ('Gerardo Garza','男',10,25000,8);
    insert into employees(employee_name,employee_sex,employee_mgr,employee_salary,department_id) values ('Derek Wu','男',10,5500,5);

select * from employees;
# 2.写函数
DELIMITER //

CREATE FUNCTION GetEmployeeInformationByID(id INT)

RETURNS VARCHAR(300)

BEGIN

RETURN(SELECT CONCAT('employee name:',employee_name,'---','salary: ',employee_salary) FROM employees WHERE employee_id=id);

END//

DELIMITER ;