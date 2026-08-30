# Bank Loan Portfolio Analytics

An end-to-end bank loan portfolio analytics project using **Snowflake, SQL, Power Query and Power BI**.

## Project Workflow

**CSV → Snowflake → SQL → Power Query → Power BI**

## Objective

Analyze loan applications, funding, repayments, loan quality and borrower/loan characteristics through an interactive Power BI report.

## Technology Stack

- Snowflake — data warehouse and SQL analysis
- SQL — portfolio KPIs and analytical queries
- Power Query — data transformation layer
- Power BI — semantic model, DAX and reporting
- CSV — source dataset

## Snowflake Architecture

```text
BANK_ANALYTICS
├── RAW_DATA
│   └── FINANCIAL_LOAN_DATA
└── ANALYTICS
    └── FINANCIAL_LOAN_CLEANED
```

The source dataset was already cleaned before Snowflake ingestion. Snowflake was used for warehouse setup, data organization, validation, analytics-table creation and SQL analysis.

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

The report contains three pages:

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
└── documentation/
```

## Business Insights

See `insights/business_insights.md` for portfolio findings derived from the dataset and report.
