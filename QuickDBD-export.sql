-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/eBxAi9
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "data_titles" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_data_titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "data_employees" (
    -- done
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR   NOT NULL,
    "birth_date" Date   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_data_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "data_departments" (
    -- done
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_data_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "data_dept_emp" (
    -- done
    -- dept_no appears more than once in this table; so many here to 1 in the data_departments table but is an FK
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR   NOT NULL
);

CREATE TABLE "data_dept_manager" (
    "dept_no" VARCHAR   NOT NULL,
    "emp_no" INT   NOT NULL,
    CONSTRAINT "pk_data_dept_manager" PRIMARY KEY (
        "dept_no","emp_no"
     )
);

CREATE TABLE "data_salaries" (
    -- one unique salary in the table but it depends on full list of data_employees table
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL
);

ALTER TABLE "data_employees" ADD CONSTRAINT "fk_data_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "data_titles" ("title_id");

ALTER TABLE "data_dept_emp" ADD CONSTRAINT "fk_data_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "data_employees" ("emp_no");

ALTER TABLE "data_dept_emp" ADD CONSTRAINT "fk_data_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "data_departments" ("dept_no");

ALTER TABLE "data_dept_manager" ADD CONSTRAINT "fk_data_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "data_departments" ("dept_no");

ALTER TABLE "data_dept_manager" ADD CONSTRAINT "fk_data_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "data_employees" ("emp_no");

ALTER TABLE "data_salaries" ADD CONSTRAINT "fk_data_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "data_employees" ("emp_no");

