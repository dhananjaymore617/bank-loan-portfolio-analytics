-- Loan Risk & Profitability Analytics
-- Snowflake Stream for incremental change tracking

CREATE OR REPLACE STREAM RAW_DATA.FINANCIAL_LOAN_STREAM
ON TABLE RAW_DATA.FINANCIAL_LOAN_DATA;

-- Verify the Stream
SHOW STREAMS;

-- Optional check for pending Stream data
SELECT SYSTEM$STREAM_HAS_DATA(
    'RAW_DATA.FINANCIAL_LOAN_STREAM'
) AS STREAM_DATA;
