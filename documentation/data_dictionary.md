# Data Dictionary

The project uses a 24-column financial loan dataset.

| Column | Description |
|---|---|
| `id` | Unique loan/application identifier |
| `address_state` | Borrower state |
| `application_type` | Type of loan application |
| `emp_length` | Borrower employment length |
| `emp_title` | Borrower employment title |
| `grade` | Loan risk grade |
| `home_ownership` | Home ownership status |
| `issue_date` | Loan issue/origination date |
| `last_credit_pull_date` | Most recent credit report pull date |
| `last_payment_date` | Most recent payment date |
| `loan_status` | Current loan status |
| `next_payment_date` | Next scheduled payment date |
| `member_id` | Borrower/member identifier |
| `purpose` | Loan purpose |
| `sub_grade` | Detailed loan risk sub-grade |
| `term` | Loan repayment term |
| `verification_status` | Information verification status |
| `annual_income` | Borrower annual income |
| `dti` | Debt-to-income ratio |
| `installment` | Scheduled monthly installment |
| `int_rate` | Loan interest rate |
| `loan_amount` | Original funded loan amount |
| `total_acc` | Total credit accounts |
| `total_payment` | Total payment received |

## Dataset Profile

- 38,576 rows
- 24 columns
- Loan statuses: Fully Paid, Charged Off, Current
- Missing values occur in `emp_title`.

The dataset was already cleaned before Snowflake ingestion.
