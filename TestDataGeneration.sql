--TRUNCATE ALL TABLES
TRUNCATE TABLE MONTHLY_SALARY;
TRUNCATE TABLE SALE_HISTORY;
TRUNCATE TABLE EMPLOYEE_SITE;
TRUNCATE TABLE COMPANY_SITE;
TRUNCATE TABLE PART_TYPE_LISTING;
TRUNCATE TABLE PRODUCT_PART;
TRUNCATE TABLE PART_TYPE;
TRUNCATE TABLE VENDOR;
TRUNCATE TABLE PRODUCT;
TRUNCATE TABLE PRODUCT_TYPE;
TRUNCATE TABLE INTERVIEW;
TRUNCATE TABLE JOB_APPLICATION;
TRUNCATE TABLE JOB_POSITION;
TRUNCATE TABLE SHIFT;
TRUNCATE TABLE POTENTIAL_EMPLOYEE;
TRUNCATE TABLE CUSTOMER;
TRUNCATE TABLE EMPLOYEE;
TRUNCATE TABLE PHONE_NUMBER;
TRUNCATE TABLE PERSON;
TRUNCATE TABLE DEPARTMENT;

--DEPARTMENT
INSERT INTO DEPARTMENT 
VALUES (
    1,
    'First Department'
);

INSERT INTO DEPARTMENT 
VALUES (
    2,
    'Marketing'
);

--PERSON
INSERT INTO PERSON 
VALUES(
    1,
    'Rigre', 
    'Garciandia',
    19,
    'M',
    '100 Independence Dr',
    'Menlo Park, CA 94025',
    'Menlo Park',
    'CA',
    '94025'
);

INSERT INTO PERSON 
VALUES(
    2,
    'Mike', 
    'Robinson',
    20,
    'M',
    '100 Independence Dr',
    'Menlo Park, CA 94025',
    'Menlo Park',
    'CA',
    '94025'
);

INSERT INTO PERSON 
VALUES(
    3,
    'Gabriella', 
    'Spencer',
    21,
    'F',
    '100 Independence Dr',
    'Menlo Park, CA 94025',
    'Menlo Park',
    'CA',
    '94025'
);

INSERT INTO PERSON 
VALUES(
    4,
    'Ethan', 
    'Miller',
    21,
    'M',
    '100 Independence Dr',
    'Menlo Park, CA 94025',
    'Menlo Park',
    'CA',
    '94025'
);

INSERT INTO PERSON 
VALUES(
    5,
    'Potential', 
    'Employee',
    44,
    'M',
    '100 Independence Dr',
    'Menlo Park, CA 94025',
    'Menlo Park',
    'CA',
    '94025'
);

INSERT INTO PERSON 
VALUES(
    6,
    'Customer_F', 
    'Customer_L',
    44,
    'M',
    '100 Independence Dr',
    'Menlo Park, CA 94025',
    'Menlo Park',
    'CA',
    '94025'
);

INSERT INTO PERSON 
VALUES(
    7,
    'Hellen', 
    'Cole',
    44,
    'F',
    '100 Independence Dr',
    'Menlo Park, CA 94025',
    'Menlo Park',
    'CA',
    '94025'
);

--EMLPOYEE

INSERT INTO EMPLOYEE
VALUES (
    1,
    1,
    'Senior',
    'Software Developer',
    NULL
);

INSERT INTO EMPLOYEE
VALUES (
    2,
    2,
    'Junior',
    'Software Developer',
    1
);

INSERT INTO EMPLOYEE
VALUES (
    3,
    3,
    'Senior',
    'Graphic Designer',
    1
);

INSERT INTO EMPLOYEE
VALUES (
    4,
    4,
    'Senior',
    'Salesman',
    NULL
);

--POTENTIAL_EMPLOYEE
INSERT INTO POTENTIAL_EMPLOYEE
VALUES (
    1,
    5
);

INSERT INTO POTENTIAL_EMPLOYEE
VALUES (
    2,
    7
);

--JOB_POSITION
INSERT INTO JOB_POSITION
VALUES (
    1,
    '30-NOV-2020',
    'First job position', 
    1,
    1
);

INSERT INTO JOB_POSITION
VALUES (
    2,
    '25-NOV-2020',
    'Second job position', 
    1,
    2
);

INSERT INTO JOB_POSITION
VALUES (
    11111,
    '25-NOV-2021',
    'Job position 11111', 
    1,
    NULL
);

INSERT INTO JOB_POSITION
VALUES (
    3,
    '25-JAN-2011',
    'Job by Marketing', 
    2,
    NULL
);

INSERT INTO JOB_POSITION
VALUES (
    4,
    '25-DEC-2010',
    'Job by Marketing', 
    2,
    NULL
);

INSERT INTO JOB_POSITION
VALUES (
    5,
    '25-FEB-2011',
    'Job by Marketing', 
    2,
    NULL
);

INSERT INTO JOB_POSITION
VALUES (
    6,
    '25-FEB-2009',
    'Very old job position', 
    2,
    2
);

INSERT INTO JOB_POSITION
VALUES (
    7,
    '4-DEC-2021',
    'New job position', 
    2,
    NULL
);

--JOB_APPLICATION
INSERT INTO JOB_APPLICATION
VALUES (
    1,
    1,
    1,
    'Y'
);

INSERT INTO JOB_APPLICATION
VALUES (
    2,
    2,
    1,
    NULL
);

INSERT INTO JOB_APPLICATION
VALUES (
    3,
    1,
    2,
    'N'
);

INSERT INTO JOB_APPLICATION
VALUES (
    4,
    2,
    2,
    'Y'
);

INSERT INTO JOB_APPLICATION
VALUES (
    5,
    11111,
    7,
    NULL
);

INSERT INTO JOB_APPLICATION
VALUES (
    6,
    2,
    6,
    NULL
);

INSERT INTO JOB_APPLICATION
VALUES (
    7,
    6,
    2,
    'Y'
);

--INTERVIEW
INSERT INTO INTERVIEW
VALUES (
    1,
    2,
    TIMESTAMP '2021-11-15 8:00:00 -8:00',
    90
);

INSERT INTO INTERVIEW
VALUES (
    1,
    2,
    TIMESTAMP '2021-11-20 8:00:00 -8:00',
    95
);

INSERT INTO INTERVIEW
VALUES (
    1,
    2,
    TIMESTAMP '2021-11-21 8:00:00 -8:00',
    95
);

INSERT INTO INTERVIEW
VALUES (
    1,
    2,
    TIMESTAMP '2021-11-22 8:00:00 -8:00',
    95
);

INSERT INTO INTERVIEW
VALUES (
    1,
    2,
    TIMESTAMP '2021-11-23 8:00:00 -8:00',
    60
);

INSERT INTO INTERVIEW
VALUES (
    1,
    2,
    TIMESTAMP '2021-11-24 8:00:00 -8:00',
    95
);

INSERT INTO INTERVIEW
VALUES (
    2,
    1,
    TIMESTAMP '2022-1-15 8:00:00 -8:00',
    NULL
);

INSERT INTO INTERVIEW
VALUES (
    2,
    1,
    TIMESTAMP '2022-2-15 8:00:00 -8:00',
    NULL
);

INSERT INTO INTERVIEW
VALUES (
    3,
    1,
    TIMESTAMP '2022-1-15 8:00:00 -8:00',
    60
);

INSERT INTO INTERVIEW
VALUES (
    4,
    1,
    TIMESTAMP '2022-1-15 8:00:00 -8:00',
    70
);

INSERT INTO INTERVIEW
VALUES (
    5,
    1,
    TIMESTAMP '2022-1-15 8:00:00 -8:00',
    70
);

INSERT INTO INTERVIEW
VALUES (
    5,
    2,
    TIMESTAMP '2022-1-15 8:00:00 -8:00',
    70
);

INSERT INTO INTERVIEW
VALUES (
    5,
    2,
    TIMESTAMP '2022-1-15 8:00:00 -8:00',
    70
);

--MONTHLY_SALARY
INSERT INTO MONTHLY_SALARY
VALUES (
    1,
    1,
    '31-OCT-2021',
    5000.0
);

INSERT INTO MONTHLY_SALARY
VALUES (
    2,
    1,
    '29-NOV-2021',
    5100.0
);

INSERT INTO MONTHLY_SALARY
VALUES (
    3,
    1,
    '31-DEC-2021',
    5500.0
);

INSERT INTO MONTHLY_SALARY
VALUES (
    1,
    2,
    '31-OCT-2021',
    1000.0
);

INSERT INTO MONTHLY_SALARY
VALUES (
    2,
    2,
    '29-NOV-2021',
    2000.0
);

INSERT INTO MONTHLY_SALARY
VALUES (
    3,
    2,
    '31-DEC-2021',
    3000.0
);

--PRODUCT_TYPE
INSERT INTO PRODUCT_TYPE 
VALUES (
    1,
    4250.0
);
INSERT INTO PRODUCT_TYPE 
VALUES (
    2,
    50.0
);

INSERT INTO PRODUCT_TYPE 
VALUES (
    3,
    300.0
);

--PRODUCT
INSERT INTO PRODUCT
VALUES (
    1,
    20.0,
    1,
    20.0,
    'blue'
);

INSERT INTO PRODUCT
VALUES (
    2,
    20.0,
    1,
    20.0,
    'red'
);

INSERT INTO PRODUCT
VALUES (
    3,
    20.0,
    2,
    20.0,
    'green'
);

INSERT INTO PRODUCT
VALUES (
    4,
    20.0,
    2,
    20.0,
    'yellow'
);

--CUSTOMER
INSERT INTO CUSTOMER
VALUES (
    1,
    6,
    4
);

--COMPANY_SITE
INSERT INTO COMPANY_SITE
VALUES (
    1,
    'Test Site 1',
    '100 Independence Dr',
    'Menlo Park, CA 94025',
    'Menlo Park',
    'CA',
    '94025'
);

INSERT INTO COMPANY_SITE
VALUES (
    2,
    'Site With No Sales',
    '100 Independence Dr',
    'Menlo Park, CA 94025',
    'Menlo Park',
    'CA',
    '94025'
);

--SALE_HISTORY
INSERT INTO SALE_HISTORY
VALUES (
    4,
    1,
    1,
    TIMESTAMP '2022-1-15 8:00:00 -8:00',
    1
);

INSERT INTO SALE_HISTORY
VALUES (
    4,
    1,
    1,
    TIMESTAMP '2022-1-16 8:00:00 -8:00',
    1
);

INSERT INTO SALE_HISTORY
VALUES (
    4,
    1,
    1,
    TIMESTAMP '2022-1-15 8:00:00 -8:00',
    1
);

INSERT INTO SALE_HISTORY
VALUES (
    4,
    1,
    2,
    TIMESTAMP '2022-1-15 8:00:00 -8:00',
    1
);

INSERT INTO SALE_HISTORY
VALUES (
    4,
    1,
    3,
    TIMESTAMP '2022-1-15 8:00:00 -8:00',
    1
);

INSERT INTO SALE_HISTORY
VALUES (
    4,
    1,
    4,
    TIMESTAMP '2022-1-15 8:00:00 -8:00',
    1
);

INSERT INTO SALE_HISTORY
VALUES (
    2,
    1,
    1,
    TIMESTAMP '2022-1-15 8:00:00 -8:00',
    1
);

INSERT INTO SALE_HISTORY
VALUES (
    3,
    1,
    2,
    TIMESTAMP '2022-1-15 8:00:00 -8:00',
    1
);

--PART_TYPE
INSERT INTO PART_TYPE
VALUES (
    1
);

INSERT INTO PART_TYPE
VALUES (
    2
);

--VENDOR
INSERT INTO VENDOR
VALUES (
    1,
    799,
    'abc.com',
    'ABC Microchips',
    'C55R9',
    '100 Independence Dr',
    'Menlo Park, CA 94025',
    'Menlo Park',
    'CA',
    '94025'
);

INSERT INTO VENDOR
VALUES (
    2,
    800,
    'cde.com',
    'CDE Microchips',
    'CDF5',
    '100 Independence Dr',
    'Menlo Park, CA 94025',
    'Menlo Park',
    'CA',
    '94025'
);

--PART_TYPE_LISTING
INSERT INTO PART_TYPE_LISTING
VALUES (
    1,
    1,
    50.0
);

INSERT INTO PART_TYPE_LISTING
VALUES (
    2,
    1,
    75.0
);

INSERT INTO PART_TYPE_LISTING
VALUES (
    1,
    2,
    50.0
);

INSERT INTO PART_TYPE_LISTING
VALUES (
    2,
    2,
    25.0
);

--PRODUCT_PART
INSERT INTO PRODUCT_PART
VALUES (
    1,
    1,
    1,
    4
);

INSERT INTO PRODUCT_PART
VALUES (
    1,
    2,
    2,
    2
);

INSERT INTO PRODUCT_PART
VALUES (
    2,
    1,
    1,
    1
);

INSERT INTO PRODUCT_PART
VALUES (
    2,
    2,
    1,
    1
);

INSERT INTO PRODUCT_PART
VALUES (
    3,
    1,
    2,
    2
);

INSERT INTO PRODUCT_PART
VALUES (
    3,
    2,
    1,
    5
);

INSERT INTO PRODUCT_PART
VALUES (
    4,
    1,
    1,
    1
);

INSERT INTO PRODUCT_PART
VALUES (
    4,
    2,
    2,
    1
);


