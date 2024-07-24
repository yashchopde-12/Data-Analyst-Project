SELECT * FROM bank_loan_db.loan_data;
alter table loan_data
modify issue_date date;

alter table loan_data
modify last_credit_pull_date date;

alter table loan_data
modify last_payment_date date;

alter table loan_data
modify next_payment_date date;

select count(id) as Total_Applications from loan_data;

select count(id) as Total_Applications from loan_data
where month(issue_date) = 11;

select sum(loan_amount) as Total_Amount from loan_data;

select sum(loan_amount) as Total_Amount from loan_data
where month(issue_date) = 12;

select sum(loan_amount) as Total_Amount from loan_data
where month(issue_date) = 11;

select sum(total_payment) as Total_Amount_Recived from loan_data;

SELECT SUM(total_payment) AS Total_Amount_Collected FROM loan_data
WHERE MONTH(issue_date) = 12;

SELECT SUM(total_payment) AS Total_Amount_Collected FROM loan_data
WHERE MONTH(issue_date) = 11;

select round(avg(int_rate)*100,2) as Average_intrest_Rate FROM loan_data;

select round(avg(int_rate)*100,2) as MTD_Average_intrest_Rate FROM loan_data
WHERE MONTH(issue_date) = 12;

select round(avg(int_rate)*100,2) as PMTD_Average_intrest_Rate FROM loan_data
WHERE MONTH(issue_date) = 11;

select round(avg(dti)*100,2) as Average_DTI FROM loan_data;

select round(avg(dti)*100,2) as MTD_Average_DTI FROM loan_data
WHERE MONTH(issue_date) = 12;

select round(avg(dti)*100,2) as PMTD_Average_DTI FROM loan_data
WHERE MONTH(issue_date) = 11;


select 
	round((count(case when loan_status = "Fully Paid" or  loan_status = "Current" then id  end) * 100.0) / 
        count(id),2) as Good_Loan_Precentage
from loan_data;

select count(id) as Good_Loan_Applications from loan_data
where loan_status = "Fully Paid" or  loan_status = "Current";

select sum(loan_amount) as Good_Loan_Funded_Amount from loan_data
where loan_status = "Fully Paid" or  loan_status = "Current";

select sum(total_payment) as Good_Loan_Collected_Amount from loan_data
where loan_status = "Fully Paid" or  loan_status = "Current";

select 
	round((count(case when loan_status = "Charged Off" then id  end) * 100.0) / 
        count(id),2) as Bad_Loan_Precentage
from loan_data;

select count(id) as Bad_Loan_Applications from loan_data
where loan_status = "Charged Off";

select sum(loan_amount) as Bad_Loan_Funded_Amount from loan_data
where loan_status = "Charged Off";

select sum(total_payment) as Bad_Loan_Amount_Received from loan_data
where loan_status = "Charged Off";


select 
	loan_status,
    count(id) as Total_Loan_Applications,
    sum(loan_amount) as Total_Funded_Amount,
    sum(total_payment) as Total_Amount_Received,
    round(avg(int_rate)*100,2) as Intrest_Rate,
    round(avg(dti)*100,2) as DTI
from loan_data
group by 1;


select 
	loan_status,
    sum(loan_amount) as MTD_Total_Funded_Amount,
    sum(total_payment) as MTD_Total_Amount_Received
from loan_data
where month(issue_date) = 12
group by 1;


select 
	month(issue_date) as Month_Number,
	monthname(issue_date) as Month_Name,
    count(id) as Total_Applications,
    sum(loan_amount) as Total_Funded_Amount,
    sum(total_payment) as Total_Amount_Received
from loan_data
group by 1,2
order by 1;
    

select 
	address_state,
    count(id) as Total_Applications,
    sum(loan_amount) as Total_Funded_Amount,
    sum(total_payment) as Total_Amount_Received
from loan_data
group by 1
order by 1;
    

select 
	term,
    count(id) as Total_Applications,
    sum(loan_amount) as Total_Funded_Amount,
    sum(total_payment) as Total_Amount_Received
from loan_data
group by 1
order by 1;


select 
	emp_length,
    count(id) as Total_Applications,
    sum(loan_amount) as Total_Funded_Amount,
    sum(total_payment) as Total_Amount_Received
from loan_data
group by 1
order by 1;

select 
	purpose,
    count(id) as Total_Applications,
    sum(loan_amount) as Total_Funded_Amount,
    sum(total_payment) as Total_Amount_Received
from loan_data
group by 1
order by 2 DESC;

select 
	home_ownership,
    count(id) as Total_Applications,
    sum(loan_amount) as Total_Funded_Amount,
    sum(total_payment) as Total_Amount_Received
from loan_data
group by 1
order by 2 DESC;
