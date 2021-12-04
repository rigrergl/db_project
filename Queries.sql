/*
Query 1: 
Return the ID and Name of interviewers who 
participate in interviews where the interviewee’s name 
is “Hellen Cole” arranged for job “11111”.
*/

SELECT  e.employee_id AS interviewer_employee_id, 
        p.f_name || ' '|| p.l_name AS interviewer_name
FROM EMPLOYEE e
    LEFT OUTER JOIN PERSON p ON p.person_id=e.person_id
WHERE e.employee_id IN
    (SELECT i.interviewer_id  AS interviewer_employee_id FROM INTERVIEW i
        LEFT OUTER JOIN JOB_APPLICATION japp ON i.app_id=japp.app_id
        WHERE japp.job_id=11111);