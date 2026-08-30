# Project Workflow

## End-to-End Pipeline

CSV → Snowflake → SQL → Power Query → Power BI

## Snowflake

The source loan dataset was loaded into Snowflake and organized into two schemas:

- `RAW_DATA` — source data layer
- `ANALYTICS` — downstream analytical layer

The analytics table is `BANK_ANALYTICS.ANALYTICS.FINANCIAL_LOAN_CLEANED`.

## SQL Analysis

The Snowflake SQL layer covers executive KPIs, MTD/PMTD metrics, good vs bad loans, loan status, monthly trends, state, loan term, employment length, purpose, home ownership and filtered business analysis.

## Power Query

Power Query acts as the transformation layer between the Snowflake analytics table and the Power BI semantic model.

## Power BI

The Power BI report contains Summary, Overview and Details pages, supported by DAX measures and the semantic model.
