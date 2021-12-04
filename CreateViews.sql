/*
View1: This view returns the average salary each employee 
has earned from the company monthly after she/he becomes an employee in the company.
*/
CREATE OR REPLACE VIEW VIEW_1 AS
SELECT employee_id, AVG(amount) avg_salary FROM MONTHLY_SALARY
GROUP BY employee_id;

/*
View2: This view returns the number of interviews rounds each interviewee pass for each job position.
*/
CREATE OR REPLACE VIEW VIEW_2 AS 
SELECT japp.candidate_id, i.app_id, COUNT(*) AS Interview_Count FROM INTERVIEW i
    LEFT OUTER JOIN JOB_APPLICATION japp on japp.app_id=i.app_id
    LEFT OUTER JOIN PERSON p ON p.person_id=japp.candidate_id
GROUP BY japp.candidate_id, i.app_id
ORDER BY japp.candidate_id;

/*
View3: This view returns the number of items of each product type sold.
*/
CREATE OR REPLACE VIEW VIEW_3 AS
SELECT P_TYPE.type_id, COUNT(*) AS NUM_SALES FROM SALE_HISTORY SH
    LEFT OUTER JOIN PRODUCT P ON P.prod_id=SH.prod_id
    LEFT OUTER JOIN PRODUCT_TYPE P_TYPE ON P_TYPE.type_id=P.prod_type
GROUP BY P_TYPE.type_id
ORDER BY P_TYPE.type_id;

/*
View4: This view returns the part purchase cost for each product.
*/
CREATE OR REPLACE VIEW VIEW_4 AS
SELECT prod_id, SUM(total_cost) AS part_purchase_cost FROM
    (SELECT PP.prod_id, PP.part_type, PP.amount * PTL.price AS total_cost FROM PRODUCT_PART PP
        LEFT OUTER JOIN PART_TYPE_LISTING PTL ON PTL.vendor_id=PP.current_vendor AND PTL.part_type=PP.part_type
    )product_cost_by_part_type
GROUP BY prod_id
ORDER BY prod_id;   