# Project Workflow

## Basic Pipeline
CSV/Excel → Snowflake → SQL → Power Query → Power BI

## End-to-End Detail Pipeline
CSV / Excel → Snowflake RAW_DATA → Snowflake Stream → Snowflake Task →
Analytics / Cleaned Data → Power Query → Power BI Data Model → DAX
Measures → Dashboard & Business Analysis

------------------------------------------------------------------------

## 1. Source Files

The loan dataset is provided as CSV/Excel data.

Before loading, the source file is checked using the **Pre-Load Data
Quality Checklist** for important issues such as:

-   Missing or duplicate IDs
-   Unexplained negative numeric values
-   Invalid or inconsistent business values
-   Date issues
-   Text and category inconsistencies

Questionable business data is investigated rather than silently changed.

## 2. Snowflake --- Raw Data Layer

The source data is loaded into Snowflake and organized into two main
schemas:

-   `RAW_DATA` --- source/landing data layer
-   `ANALYTICS` --- cleaned and analytical data layer

Raw table:

`BANK_ANALYTICS.RAW_DATA.FINANCIAL_LOAN_DATA`

The raw layer preserves the incoming source data and acts as the
starting point for incremental processing.

## 3. Snowflake Stream --- Change Tracking

A Snowflake Stream is created on `RAW_DATA.FINANCIAL_LOAN_DATA`.

The Stream tracks changes made to the raw table, allowing the downstream
process to work with newly changed data instead of repeatedly processing
the complete table.

Stream metadata is used to identify inserted records for the incremental
pipeline.

## 4. Snowflake Task --- Automated Processing

A scheduled Snowflake Task processes changes captured by the Stream.

The Task:

-   Runs automatically on a schedule
-   Checks whether the Stream contains new data
-   Performs controlled data cleaning
-   Removes accidental leading/trailing spaces
-   Converts blank text values to `NULL`
-   Replaces missing/blank `EMP_TITLE` with `Unknown`
-   Protects the incremental load from duplicate incoming IDs
-   Uses `MERGE` to synchronize the Analytics table

The Task uses `SYSTEM$STREAM_HAS_DATA()` so it does not process when
there is no new Stream data.

## 5. MERGE --- Incremental Load

The Task uses `MERGE` to load processed records into:

`BANK_ANALYTICS.ANALYTICS.FINANCIAL_LOAN_CLEANED`

Logic:

-   **Matching ID** → update the existing record
-   **New ID** → insert the new record

`ROW_NUMBER()` with `QUALIFY` is used to keep one incoming record per ID
when duplicate IDs appear within the Stream data.

This creates the incremental:

**RAW → Stream → Task → MERGE → Analytics**

workflow.

## 6. Analytics / Cleaned Data

The cleaned analytical table is:

`BANK_ANALYTICS.ANALYTICS.FINANCIAL_LOAN_CLEANED`

This table is the downstream source for reporting.

The existing column structure is retained so the Power BI model and
dashboard can continue using the same business fields.

## 7. Snowflake SQL Analysis

The Snowflake SQL layer supports:

-   Executive KPIs
-   MTD / PMTD metrics
-   Good vs. bad loan analysis
-   Loan status analysis
-   Monthly trends
-   State analysis
-   Loan term analysis
-   Employment length analysis
-   Loan purpose analysis
-   Home ownership analysis
-   Filtered business analysis
-   Data-quality profiling and validation checks

## 8. Power Query

Power Query connects to the Snowflake Analytics layer and acts as the
preparation layer before the Power BI semantic model.

It is used for further data preparation and transformation required for
reporting.

The Snowflake Analytics table remains the main reporting source.

## 9. Power BI Data Model

The prepared data is loaded into the Power BI semantic model.

The model supports relationships, analytical dimensions and measures,
filtering, interactive analysis, and time-based analysis.

## 10. DAX Measures

DAX is used for business calculations and reporting metrics such as:

-   Total loan applications
-   Total funded amount
-   Total received amount
-   Average interest rate
-   Average DTI
-   MTD / PMTD metrics
-   Month-over-month analysis
-   Good vs. bad loan metrics
-   Risk-related calculations
-   Dynamic KPIs used by the report

## 11. Power BI Dashboard

The final Power BI report contains:

### Summary

Executive-level KPIs and good vs. bad loan overview.

### Overview

Interactive analysis of loan applications across monthly trends, state,
loan term, employment length, loan purpose, home ownership, and selected
business measures.

### Details

Record-level loan information with interactive filtering. This page can
also support deeper investigation of individual loan records.

## 12. Business Analysis

The project is being extended with dedicated analysis for:

### Risk Analysis

Identifying where loan risk is concentrated, including bad-loan patterns
across:

-   Employment length
-   State
-   Loan grade / sub-grade
-   Home ownership
-   Loan purpose
-   Other relevant segments

### Profitability Analysis

A separate profitability-focused page is planned to analyze financial
returns across relevant loan segments using the available financial
fields.

Profitability metrics will be defined carefully so that **amount
received is not incorrectly presented as profit**.

## Overall Architecture

``` text
CSV / Excel
     |
     v
Snowflake RAW_DATA
     |
     v
Snowflake Stream
(Change Tracking)
     |
     v
Snowflake Task
(Scheduled Processing)
     |
     v
Cleaning + Duplicate Handling
     |
     v
MERGE
     |
     v
Snowflake ANALYTICS
(FINANCIAL_LOAN_CLEANED)
     |
     v
Power Query
(Further Preparation)
     |
     v
Power BI Semantic Model
     |
     v
DAX Measures
     |
     v
Power BI Dashboard
     |
     +--> Risk Analysis
     |
     +--> Profitability Analysis
     |
     +--> Business Insights
```

## Key Design Principles

-   Keep the RAW layer as the source/landing layer.
-   Process new changes incrementally using Streams and Tasks.
-   Use automated cleaning for clear formatting/data-quality issues.
-   Do not silently alter questionable business values.
-   Use `MERGE` to synchronize new and existing records.
-   Keep the Analytics layer as the reporting source.
-   Use Power Query for report-specific preparation.
-   Use DAX for business calculations.
-   Use Power BI for interactive analysis and decision support.
