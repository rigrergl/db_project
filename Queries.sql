/*
Query 1: 
Return the ID and Name of interviewers who 
participate in interviews where the interviewee’s name 
is “Hellen Cole” arranged for job “11111”.
*/

SELECT e.employee_id AS interviewer_employee_id, 
       p.f_name || ' '|| p.l_name AS interviewer_name
FROM EMPLOYEE e
    LEFT OUTER JOIN PERSON p ON p.person_id=e.person_id
WHERE e.employee_id IN
    (
        SELECT i.interviewer_id  AS interviewer_employee_id FROM INTERVIEW i
            LEFT OUTER JOIN JOB_APPLICATION japp ON i.app_id=japp.app_id
        WHERE japp.job_id=11111
    );

/*
Query 2: 
Return the ID of all jobs which are posted 
by department “Marketing” in January 2011.
*/ 
SELECT j.job_id FROM JOB_POSITION j
WHERE   EXTRACT(MONTH FROM j.posted_date) = 1 AND
        EXTRACT(YEAR FROM j.posted_date) = 2011 AND
        j.dept_id IN (
            SELECT d.dept_id FROM DEPARTMENT d
            WHERE d.dept_name='Marketing'
        );

/*
Query 3: 
Return the ID and Name of the employees having no supervisees.
*/        
SELECT  e.employee_id, 
        p.f_name || ' ' || p.l_name AS full_name
FROM EMPLOYEE e
    LEFT OUTER JOIN PERSON p ON p.person_id = e.person_id
WHERE e.employee_id NOT IN (
    SELECT e.supervisor_id FROM EMPLOYEE e 
    WHERE e.supervisor_id IS NOT NULL
);

/*
Query 4: 
Return the Id and Location of the marketing sites 
which have no sale records during March, 2011.
*/
SELECT  s.site_id, 
        s.addr_line_1,
        s.addr_line_2,
        s.city,
        s.state_code,
        s.zipcode
FROM COMPANY_SITE s
WHERE s.site_id NOT IN (
        SELECT DISTINCT sh.site_id FROM SALE_HISTORY sh
    );
    
/*
Query 5: 
Return the job’s id and description which does not 
hire a suitable person one month after it is posted.
*/
SELECT DISTINCT jp.job_id, jp.description FROM JOB_POSITION jp
     LEFT OUTER JOIN JOB_APPLICATION ja ON jp.job_id = ja.job_id
WHERE   jp.chosen_candidate IS NULL AND
        CURRENT_DATE - jp.posted_date > 31
ORDER BY jp.job_id;
        
/*
Query 6: 
Return the ID and Name of the salesmen who 
have sold all product type whose price is above $200.
*/
SELECT DISTINCT sh.prod_id, sh.salesman_id FROM SALE_HISTORY sh 
WHERE sh.prod_id IN (
    SELECT p.prod_id FROM PRODUCT p
        JOIN PRODUCT_TYPE pt ON p.prod_type=pt.type_id
    WHERE pt.list_price > 200
)
GROUP BY sh.salesman_id, sh.prod_id
HAVING COUNT(sh.salesman_id) > (
    SELECT COUNT(p.prod_id) FROM PRODUCT p
        JOIN PRODUCT_TYPE pt ON p.prod_type=pt.type_id
    WHERE pt.list_price > 200
);

/*
Query 7: 
Return the department’s id and name which has no job post during 1/1/2011 and 2/1/2011.
*/
SELECT dept_id FROM DEPARTMENT d
WHERE d.dept_id NOT IN (
    SELECT DISTINCT dept_id FROM JOB_POSITION jp
    WHERE jp.posted_date  BETWEEN '1-JAN-2011' AND '1-FEB-2011'
);

/*
Query 8: 
Return the ID, Name, and Department ID of the existing employees who apply job “12345”.
*/
SELECT  e.employee_id, 
        p.f_name || ' ' || p.l_name AS "NAME",
        e.current_dept
FROM JOB_APPLICATION ja
    JOIN EMPLOYEE e ON e.person_id=ja.candidate_id
    JOIN PERSON p ON p.person_id=ja.candidate_id
WHERE ja.job_id=12345;

/*
Query 9: 
Return the best seller’s type in the company (sold the most items).
*/
SELECT p.prod_type FROM (
    SELECT sh.prod_id, COUNT(sh.prod_id) as items_sold FROM SALE_HISTORY sh
    GROUP BY sh.prod_id
    ORDER BY items_sold DESC
    FETCH NEXT 1 ROW ONLY
    ) best_seller
INNER JOIN PRODUCT p ON p.prod_id=best_seller.prod_id;

/*
Query 10: 
Return the product type whose net profit is 
highest in the company (money earned minus the part cost).
*/
SELECT type_id FROM (
    SELECT  p.prod_id, 
            pt.type_id, 
            pt.list_price * sale_count AS money_earned,
            product_part_cost.part_cost * sale_count AS total_part_cost,
            (pt.list_price * sale_count) - (product_part_cost.part_cost * sale_count) AS net_profit
    FROM (
                SELECT sh.prod_id, COUNT(*) as sale_count FROM SALE_HISTORY sh
                GROUP BY sh.prod_id
        ) sales_count
    LEFT OUTER JOIN PRODUCT p ON p.prod_id=sales_count.prod_id
    LEFT OUTER JOIN PRODUCT_TYPE pt ON pt.type_id = p.prod_type
    LEFT OUTER JOIN (
        SELECT pp.prod_id, SUM(price * amount) as part_cost FROM PRODUCT_PART pp
        INNER JOIN PART_TYPE_LISTING ptl ON ptl.vendor_id=pp.current_vendor AND ptl.part_type=pp.part_type
        GROUP BY pp.prod_id
    ) product_part_cost ON product_part_cost.prod_id=p.prod_id
)
ORDER BY net_profit DESC
FETCH NEXT 1 ROW ONLY;

/*
Query 11: 
Return the name and id of the employees who has 
worked in all departments after hired by the company
*/
SELECT s.employee_id FROM SHIFT s
GROUP BY s.employee_id
HAVING COUNT(s.employee_id) >= (
    SELECT COUNT(*) FROM DEPARTMENT
);

/*
Query 12: 
Return the name and email address of the interviewee who is selected.
*/
SELECT  jp.job_id,
        p.f_name || ' ' || p.l_name AS "NAME",
        p.email_address
FROM JOB_POSITION jp
    INNER JOIN PERSON p ON p.person_id=jp.chosen_candidate;

/*
Query 13: 
Retrieve the name, phone number, email address of the 
interviewees selected for all the jobs they apply.
*/
SELECT ja.candidate_id FROM JOB_APPLICATION ja
    INNER JOIN (
                SELECT ja.candidate_id, COUNT(*) as applied_count FROM JOB_APPLICATION ja
                GROUP BY ja.candidate_id
    ) applied_counts ON ja.candidate_id=applied_counts.candidate_id
    INNER JOIN (
                SELECT ja.candidate_id, COUNT(*) as hired_count FROM JOB_APPLICATION ja
                WHERE hired='Y'
                GROUP BY ja.candidate_id
    ) hired_counts ON ja.candidate_id=hired_counts.candidate_id
WHERE applied_count = hired_count;

/*
Query 14: 
Return the employee’s name and id whose 
average monthly salary is highest in the company.
*/
SELECT  e.employee_id, 
        p.f_name || ' ' || p.l_name AS "NAME" 
FROM VIEW_1
    INNER JOIN EMPLOYEE e ON e.employee_id=VIEW_1.employee_id
    INNER JOIN PERSON p on p.person_id=e.person_id
ORDER BY AVG_SALARY DESC
FETCH NEXT 1 ROW ONLY;

/*
Query 15: 
Return the ID and Name of the vendor who supply 
part whose name is “Cup” and weight is smaller 
than 4 pound and the price is lowest among all vendors.
*/
SELECT v.vendor_id, v.vendor_name FROM PART_TYPE_LISTING ptl
    INNER JOIN PART_TYPE pt ON pt.type_id = ptl.part_type
    INNER JOIN VENDOR v ON v.vendor_id = ptl.vendor_id
WHERE   upper(pt.part_name)='CUP' AND
        ptl.weight < 4
ORDER BY ptl.price
FETCH NEXT 1 ROW ONLY;
