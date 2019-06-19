-- Exported from QuickDBD: https://www.quickdatatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/uLIoMK
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "DEPARTMENTS" (
    "dept_no" VARCHAR(8)   NOT NULL,
    "dept_name" VARCHAR(20)   NOT NULL,
    CONSTRAINT "pk_DEPARTMENTS" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "DEPT_EMPLOYEE" (
    "emp_no" INTEGER   NOT NULL,
    "dept_no" VARCHAR(8)   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
    CONSTRAINT "pk_DEPT_EMPLOYEE" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "DEPARTMENT_MANAGERS" (
    "dept_no" VARCHAR(8)   NOT NULL,
    "emp_no" INTEGER   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
    CONSTRAINT "pk_DEPARTMENT_MANAGERS" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "EMPLOYEES" (
    "emp_no" INTEGER   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(10)   NOT NULL,
    "last_name" VARCHAR(20)   NOT NULL,
    "gender" CHAR(2)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_EMPLOYEES" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "SALARIES" (
    "emp_no" INTEGER   NOT NULL,
    "salary" INTEGER   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
    CONSTRAINT "pk_SALARIES" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "TITLES" (
    "emp_no" INTEGER   NOT NULL,
    "title" VARCHAR(20)   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
    CONSTRAINT "pk_TITLES" PRIMARY KEY (
        "emp_no"
     )
);

ALTER TABLE "DEPARTMENTS" ADD CONSTRAINT "fk_DEPARTMENTS_dept_no" FOREIGN KEY("dept_no")
REFERENCES "DEPARTMENT_MANAGERS" ("dept_no");

ALTER TABLE "DEPT_EMPLOYEE" ADD CONSTRAINT "fk_DEPT_EMPLOYEE_dept_no" FOREIGN KEY("dept_no")
REFERENCES "DEPARTMENTS" ("dept_no");

ALTER TABLE "EMPLOYEES" ADD CONSTRAINT "fk_EMPLOYEES_emp_no" FOREIGN KEY("emp_no")
REFERENCES "TITLES" ("emp_no");

ALTER TABLE "SALARIES" ADD CONSTRAINT "fk_SALARIES_emp_no" FOREIGN KEY("emp_no")
REFERENCES "DEPT_EMPLOYEE" ("emp_no");

ALTER TABLE "TITLES" ADD CONSTRAINT "fk_TITLES_emp_no" FOREIGN KEY("emp_no")
REFERENCES "SALARIES" ("emp_no");

