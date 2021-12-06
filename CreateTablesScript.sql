CREATE TABLE DEPARTMENT(
    dept_id INTEGER NOT NULL,
    dept_name VARCHAR2(30), 
    PRIMARY KEY (dept_id)
);

CREATE TABLE PERSON(
    person_id INTEGER NOT NULL,
    f_name VARCHAR2(10),
    l_name VARCHAR2(20),
    age INTEGER,
    gender VARCHAR2(1),
    addr_line_1 VARCHAR2(50),
    addr_line_2 VARCHAR(50),
    city VARCHAR(15),
    state_code VARCHAR(2),
    zipcode VARCHAR(16),
    email_address VARCHAR(50),
    PRIMARY KEY (person_id)
);

CREATE TABLE PHONE_NUMBER(
    person_id INTEGER NOT NULL,
    phone_number VARCHAR(12) NOT NULL, --number are saved in the following format: 888-888-8888
    PRIMARY KEY (person_id, phone_number),
    FOREIGN KEY (person_id) REFERENCES PERSON(person_id)
);

CREATE TABLE EMPLOYEE(
    employee_id INTEGER NOT NULL,
    person_id INTEGER NOT NULL,
    emp_rank VARCHAR(15),
    title VARCHAR(30),
    supervisor_id INTEGER,
    current_dept INTEGER,
    PRIMARY KEY (employee_id),
    FOREIGN KEY (person_id) REFERENCES PERSON(person_id),
    FOREIGN KEY (supervisor_id) REFERENCES EMPLOYEE(employee_id),
    FOREIGN KEY (current_dept) REFERENCES DEPARTMENT(dept_id)
);

CREATE TABLE CUSTOMER(
    customer_id INTEGER NOT NULL,
    person_id INTEGER NOT NULL,
    fav_salesman INTEGER NOT NULL,
    PRIMARY KEY (customer_id),
    FOREIGN KEY (person_id) REFERENCES PERSON(person_id),
    FOREIGN KEY (fav_salesman) REFERENCES EMPLOYEE(employee_id)
);

CREATE TABLE POTENTIAL_EMPLOYEE(
    pot_employee_id INTEGER NOT NULL,
    person_id INTEGER NOT NULL,
    PRIMARY KEY (pot_employee_id),
    FOREIGN KEY (person_id) REFERENCES PERSON(person_id)
);

CREATE TABLE SHIFT(
    employee_id INTEGER NOT NULL,
    dept_id INTEGER NOT NULL,
    start_time DATE NOT NULL,
    end_time DATE,
    FOREIGN KEY (employee_id) REFERENCES EMPLOYEE(employee_id),
    FOREIGN KEY (dept_id) REFERENCES DEPARTMENT(dept_id)
);

CREATE TABLE JOB_POSITION(
    job_id INTEGER NOT NULL,
    posted_date DATE,
    description VARCHAR2(100),
    dept_id INTEGER NOT NULL,
    chosen_candidate INTEGER,
    PRIMARY KEY (job_id),
    FOREIGN KEY (dept_id) REFERENCES DEPARTMENT(dept_id),
    FOREIGN KEY (chosen_candidate) REFERENCES PERSON(person_id)
);

CREATE TABLE JOB_APPLICATION(
    app_id INTEGER NOT NULL,
    job_id INTEGER NOT NULL,
    candidate_id INTEGER NOT NULL,
    hired CHAR(1) DEFAULT NULL CHECK (hired IN ('Y', 'N')),
    PRIMARY KEY (app_id),
    FOREIGN KEY (job_id) REFERENCES JOB_POSITION(job_id),
    FOREIGN KEY (candidate_id) REFERENCES PERSON(person_id) 
);

CREATE TABLE INTERVIEW(
    app_id INTEGER NOT NULL,
    interviewer_id INTEGER NOT NULL,
    interview_time TIMESTAMP WITH TIME ZONE,
    grade INTEGER CHECK (grade BETWEEN 0 AND 100),
    FOREIGN KEY (app_id) REFERENCES JOB_APPLICATION(app_id),
    FOREIGN KEY (interviewer_id) REFERENCES EMPLOYEE(employee_id)
);

CREATE TABLE PRODUCT_TYPE(
    type_id INTEGER NOT NULL,
    list_price NUMBER NOT NULL,
    PRIMARY KEY (type_id)
);

CREATE TABLE PRODUCT(
    prod_id INTEGER NOT NULL,
    weight INTEGER,
    prod_type INTEGER NOT NULL,
    prod_size NUMBER,
    prod_style VARCHAR2(30),
    PRIMARY KEY (prod_id),
    FOREIGN KEY (prod_type) REFERENCES PRODUCT_TYPE(type_id)
);

CREATE TABLE VENDOR(
    vendor_id INTEGER NOT NULL,
    credit_rating NUMBER,
    purchasing_web_service_url VARCHAR(2000),
    vendor_name VARCHAR2(50),
    account_num VARCHAR2(30),
    addr_line_1 VARCHAR2(50),
    addr_line_2 VARCHAR(50),
    city VARCHAR(15),
    state_code VARCHAR(2),
    zipcode VARCHAR(16),
    PRIMARY KEY (vendor_id)
);

CREATE TABLE PART_TYPE (
    type_id INTEGER NOT NULL,
    part_name VARCHAR(50)
    PRIMARY KEY (type_id)
);

CREATE TABLE PRODUCT_PART (
    prod_id INTEGER NOT NULL,
    part_type INTEGER NOT NULL,
    current_vendor INTEGER NOT NULL,
    amount INTEGER, 
    PRIMARY KEY (prod_id, part_type),
    FOREIGN KEY (prod_id) REFERENCES PRODUCT(prod_id),
    FOREIGN KEY (part_type) REFERENCES PART_TYPE(type_id),
    FOREIGN KEY (current_vendor) REFERENCES VENDOR(vendor_id) 
);

CREATE TABLE PART_TYPE_LISTING(
    vendor_id INTEGER NOT NULL,
    part_type INTEGER NOT NULL,
    price NUMBER,
    weight NUMBER,
    PRIMARY KEY (vendor_id, part_type),
    FOREIGN KEY (vendor_id) REFERENCES VENDOR(vendor_id),
    FOREIGN KEY (part_tYpe) REFERENCES PART_TYPE(type_id) 
);

CREATE TABLE COMPANY_SITE(
    site_id INTEGER NOT NULL,
    site_name VARCHAR2(30),
    addr_line_1 VARCHAR2(50),
    addr_line_2 VARCHAR(50),
    city VARCHAR(15),
    state_code VARCHAR(2),
    zipcode VARCHAR(16),
    PRIMARY KEY (site_id)
);

CREATE TABLE EMPLOYEE_SITE(
    employee_id INTEGER NOT NULL,
    site_id INTEGER NOT NULL,
    PRIMARY KEY (employee_id, site_id),
    FOREIGN KEY (employee_id) REFERENCES EMPLOYEE(employee_id),
    FOREIGN KEY (site_id) REFERENCES COMPANY_SITE(site_id)
);

CREATE TABLE SALE_HISTORY(
    salesman_id INTEGER NOT NULL,
    customer_id INTEGER NOT NULL,
    prod_id INTEGER NOT NULL,
    sale_time TIMESTAMP WITH TIME ZONE,
    site_id INTEGER NOT NULL,
    FOREIGN KEY (salesman_id) REFERENCES EMPLOYEE(employee_id),
    FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id),
    FOREIGN KEY (prod_id) REFERENCES PRODUCT(prod_id),
    FOREIGN KEY (site_id) REFERENCES COMPANY_SITE(site_id)
);

CREATE TABLE MONTHLY_SALARY(
    transaction_num INTEGER NOT NULL,
    employee_id INTEGER NOT NULL,
    pay_date DATE NOT NULL,
    amount NUMBER NOT NULL,
    PRIMARY KEY (transaction_num, employee_id),
    FOREIGN KEY (employee_id) REFERENCES EMPLOYEE(employee_id)
);