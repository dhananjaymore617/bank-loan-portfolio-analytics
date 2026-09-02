# Loan Risk & Profitability Analytics

An end-to-end bank loan portfolio analytics project using **Snowflake, SQL, Power Query and Power BI**.

## Project Workflow

**CSV → Snowflake → SQL → Power Query → Power BI**

## Objective

Evaluate loan portfolio risk and profitability by analyzing loan quality, funding, repayments, borrower characteristics and key loan segments through an interactive Power BI report.

## Technology Stack

- Snowflake — Data warehouse, raw/analytics layers and automated incremental processing.
    → Snowflake Streams - Change tracking for newly inserted/changed records.
    → Snowflake Tasks - Scheduled automated processing.
    → MERGE - Incremental synchronization of cleaned records.
- SQL — Data validation, cleaning, KPI calculations and analytical queries.
- Power Query — data transformation layer.
- Power BI — Data modeling, DAX and interactive visualizations/reporting.
- CSV — source dataset.

## Snowflake Architecture

```text
BANK_ANALYTICS
├── RAW_DATA
│   └── FINANCIAL_LOAN_DATA
└── ANALYTICS
    └── FINANCIAL_LOAN_CLEANED
```

## Analysis Areas

- Executive KPIs
- MTD / PMTD metrics
- Good vs. Bad Loan analysis
- Loan Status analysis
- Monthly trends
- State analysis
- Loan term
- Employment length
- Loan purpose
- Home ownership
- Filtered business analysis

## Power BI Report

The report containing pages:

- **Summary** — executive KPIs and portfolio quality
- **Overview** — portfolio trends and categorical analysis
- **Details** — detailed loan-level analysis

## Key Portfolio Metrics

- 38,576 loan applications
- Approximately $435.8M funded
- Approximately $473.1M received
- 86.2% Good Loans
- 13.8% Charged Off Loans

## Repository Structure

```text
bank-loan-portfolio-analytics/
├── README.md
├── data/
├── snowflake/
│   └── bank_loan_analytics.sql
├── power-query/
├── power-bi/
│   ├── Bank_Loan_Summary_Dashboard.pbix
│   ├── dax_measures.md
│   ├── data_model.png
│   └── screenshots/
├── insights/
├── documentation/
│   ├──PRE_LOAD_DATA_QUALITY_CHECKLIST.md
│   ├── Pre_Load_Data_Quality_Checklist.pdf
│   ├── Project_Workflow.md
│   ├── data_dictionary.md
```

## Business Insights

See `insights/business_insights.md` for portfolio findings derived from the dataset and report.

SUMMARY PAGE
<img width="1322" height="740" alt="image" src="https://github.com/user-attachments/assets/4f130f66-734b-417a-9157-6f2bb91092af" />

OVERVIEW PAGE
<img width="1322" height="742" alt="image" src="https://github.com/user-attachments/assets/c3a55002-93e2-4c0d-a529-14aab81ac146" />

RISK ANALYSIS
<img width="1307" height="735" alt="image" src="https://github.com/user-attachments/assets/b3cc2148-9949-42ed-bff4-d5a2f9766567" />

DETAILS PAGE
<img width="1322" height="742" alt="image" src="https://github.com/user-attachments/assets/ee4bc20d-1301-4ae5-92b8-d3d6d64dfe2f" />




