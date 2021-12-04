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
WHERE e.supervisor_id IS NULL;

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