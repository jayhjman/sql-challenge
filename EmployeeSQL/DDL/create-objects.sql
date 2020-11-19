--
-- create department table first no other dependencies
--

CREATE TABLE employee.departments (
    dept_no     VARCHAR(40) NOT NULL,
    dept_name   VARCHAR(40) NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (
        dept_no
     ),
    CONSTRAINT uc_departments_dept_name UNIQUE (
        dept_name
    )
);

--
-- create titles table second no other dependencies
--

CREATE TABLE employee.titles (
    title_id    VARCHAR(40) NOT NULL,
    title       VARCHAR(40) NOT NULL,
    CONSTRAINT pk_titles PRIMARY KEY (
        title_id
     ),
    CONSTRAINT uc_titles_title UNIQUE (
        title
    )
);

--
-- Can create employees table since title tables is not in place
--

CREATE TABLE employee.employees (
    emp_no          INT NOT NULL,
    emp_title_id    VARCHAR(40)   NOT NULL,
    birth_date      DATE NOT NULL,
    first_name      VARCHAR(40) NOT NULL,
    last_name       VARCHAR(40) NOT NULL,
    sex             VARCHAR NOT NULL,
    hire_date       DATE NOT NULL,
    CONSTRAINT pk_employees PRIMARY KEY (
        emp_no
     )
);

--
-- Now that department and employees tables are in place create the connection table
--

CREATE TABLE employee.dept_emp (
    emp_no      INT NOT NULL,
    dept_no     VARCHAR(40) NOT NULL,
    CONSTRAINT pk_dept_emp PRIMARY KEY (
        emp_no,dept_no
    )
);

--
-- Now that department and employees (manager is just an employee) tables are in place create the connection table
--

CREATE TABLE employee.dept_manager (
    dept_no     VARCHAR(40) NOT NULL,
    emp_no      INT NOT NULL,
    CONSTRAINT pk_dept_manager PRIMARY KEY (
        dept_no,emp_no
    )    
);

--
-- Salary table created because employees is present
--

CREATE TABLE employee.salaries (
    emp_no  INT NOT NULL,
    salary  INT NOT NULL,
    CONSTRAINT pk_salaries PRIMARY KEY (
        emp_no
    )    
);

--
-- Connect the dots between employees and titles via a foreign key
--

ALTER TABLE employee.employees ADD CONSTRAINT fk_employees_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES employee.titles (title_id);

--
-- Connect the dots between department and employees via a foreign key
--

ALTER TABLE employee.dept_emp ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY(emp_no)
REFERENCES employee.employees (emp_no);

ALTER TABLE employee.dept_emp ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY(dept_no)
REFERENCES employee.departments (dept_no);

--
-- Connect the dots between department and employee (manager) via a foreign key
--

ALTER TABLE employee.dept_manager ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY(dept_no)
REFERENCES employee.departments (dept_no);

ALTER TABLE employee.dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES employee.employees (emp_no);

--
-- Tie salaries to the employees via the foreign key
--

ALTER TABLE employee.salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES employee.employees (emp_no);

