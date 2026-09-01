# Pre-Load Data Quality Checklist

## Loan Risk & Profitability Analytics

**Prepared by Dhananjay More**

------------------------------------------------------------------------

### Purpose

This checklist is used before loading a new Excel/CSV file into
Snowflake.

The goal is to catch important data-quality problems before the file
reaches the RAW layer. Snowflake also performs controlled cleaning after
the data is loaded.

**Important:** Never silently change questionable business data.
Investigate it first. Correct it only when there is an authoritative
source, otherwise flag or reject it.

------------------------------------------------------------------------

## 1. Record & ID Checks

-   **ID must be present.**
-   **ID must be unique.**
-   Check that IDs are not accidentally changed, truncated, or
    duplicated during Excel/CSV preparation.

If an ID problem is found, investigate it before upload.

------------------------------------------------------------------------

## 2. Missing Values

Check important columns for unexpected blanks or NULLs.

-   Do not invent missing business values.
-   Do not replace a missing value with a guess.
-   If the correct value can be confirmed from an authoritative source,
    correct it.
-   Otherwise, leave it missing or flag the record according to the
    business process.

------------------------------------------------------------------------

## 3. Numeric & Financial Checks --- MUST PASS

Check numeric fields for:

-   Negative values where negative values are not valid for the business
    meaning.
-   Clearly impossible or invalid values.
-   Numbers stored as text.
-   Excel errors, symbols, or unexpected characters.

**Never change `-50,000` to `50,000` without evidence.**

Investigate; correct only from an authoritative source or flag/reject
it.

------------------------------------------------------------------------

## 4. Text & Category Checks

Check for:

-   Extra spaces.
-   Inconsistent spelling or capitalization.
-   Unexpected category values.
-   Abbreviations that do not follow the agreed format.

Do not change a business value just because it looks unusual.

For example:

> Do not change `Mgr` → `Manager` unless an approved mapping confirms
> it.

------------------------------------------------------------------------

## 5. Status & Business Values

For fields such as loan status:

-   `Charged Off`
-   `Fully Paid`
-   `Current`

**Never guess or fill a status without investigation.**

Unexpected status values should be investigated before upload.

------------------------------------------------------------------------

## 6. Date Checks

-   Make sure dates are real dates.
-   Use the agreed date format consistently.
-   Check for missing dates where the field is required.
-   Check for obvious date conflicts, such as a payment date occurring
    before the issue date when the business rule does not allow it.

Do not invent dates.

------------------------------------------------------------------------

## 7. Final Check Before Upload

-   ID is present and unique.
-   Important numeric fields contain valid values.
-   No unexplained negative numeric values remain.
-   Important text/category values have been reviewed.
-   Status values have been checked.
-   Dates are valid and consistent.
-   Any questionable business data has been investigated, flagged, or
    supported by an authoritative source.

------------------------------------------------------------------------

### What Snowflake Handles After Upload

The Snowflake pipeline performs controlled downstream cleaning for data
already loaded into the RAW table.

Examples include:

-   Removing accidental leading/trailing spaces.
-   Converting blank text values to NULL.
-   Replacing missing/blank `EMP_TITLE` with `Unknown`.
-   Handling duplicate incoming IDs during the incremental MERGE
    process.

The pre-load checklist therefore focuses on **business-data problems
that should not be silently changed by the automated pipeline**.

------------------------------------------------------------------------

## Rule to Remember

> **Clean what is clearly a formatting/data-quality issue. Investigate
> what could change the meaning of the business data.**
