# Learning log

Daily notes while learning SQL, Python and Power BI on Canadian and US financial statement data.

## 2026-10-19 · Task 2 · Sorting and shaping results
- **Learned:** ORDER BY (multiple levels, ASC/DESC), LIMIT/OFFSET, DISTINCT on several columns, ROUND, ABS, CAST, typeof, UPPER, LENGTH, SUBSTR, REPLACE, ||.
- **Built:** day02_order_by_limit.sql
- **Broke / fixed:**
  - LENGTH(sec_len) measured the length of a length (LENGTH(10) = 2), so all 5 SEC numbers were flagged. **Fix:** use the real column in WHERE (LENGTH(sec_number) <> 10), and test a check with a condition that should fail (<> 9).
  - DISTINCT with a typed-in '2025' turned 25 mislabelled rows into 5 that looked right. **Fix:** build labels from columns (company, fiscal_year), filter the year in WHERE, and use DISTINCT only when I mean to remove duplicates.
  - period_end in the SELECT stopped DISTINCT from collapsing anything (25 rows, not 5). **Fix:** DISTINCT compares every selected column, so select only the columns that define a unique row.
  - CAST in SELECT didn't change the sort (pages still 144, 167, 56…). **Fix:** alias the CAST in SELECT (AS page_number) and ORDER BY the alias.
  - 'Intel' instead of 'INTC' returned zero rows. **Fix:** filter on company codes; full names live in companies.name.
  - A comma before AS gave a syntax error. **Fix:** AS goes straight after the thing it names; commas only separate columns.


- **Still confused about:** nothing yet
- **LinkedIn post idea:** "LIMIT 1 gave me the right answer for the wrong reason", or "DISTINCT hid my mistake"

## 2026-10-15 · Task 1 · Create your first database
- **Learned:** SELECT, FROM, WHERE; AND conditions; aliases with AS; DISTINCT; checking a table's columns with PRAGMA table_info; integer vs decimal division (7/2 vs 7/2.0)
- **Built:** practice.db in DBeaver with three tables (companies, financials_clean, tieout) imported from CSV; tieout values typed by hand from five annual reports

- **Broke / fixed:**
  -  NVIDIA: used the fiscal 2026 10-K and recorded revenue (215,938) instead of cash from operations. **Fix:** took FY2025 "Net cash provided by operating activities" (64,089) from the Cash Flow Statement in the fiscal 2025 10-K, page 56.
  - JPMorgan: total assets came from the unaudited "Three-year summary" (page 46). **Fix:** same 4,424,900, but from the audited Consolidated balance sheets on page 167; corrected the report name to "JPMorgan Chase 2025 Form 10-K". **Lesson:** tie out to audited statements only.
  - Excel saved numbers as `139,151.00` (would import as text) and headers had leading spaces. **Fix:** retyped the CSV in Notepad with plain numbers (139151) and clean headers, saved as UTF-8.
  - My laptop shut down mid-import. **Fix:** checked that Tables was empty (nothing half-imported, because I never clicked Proceed), redid the import and re-ticked "empty strings to NULL" and "trim whitespaces".
  - 'Net Income' returned zero rows with no error, because the stored value is net_income. **Fix:** run SELECT DISTINCT on a column before filtering on its text.
- **Still confused about:** nothing yet
- **LinkedIn post idea:** When SQL returns zero rows with no error, it can be hiding a mistake.




