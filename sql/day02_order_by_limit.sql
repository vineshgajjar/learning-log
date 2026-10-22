-- Day 2: ORDER BY, LIMIT, DISTINCT, text and number functions on practice data

SELECT DISTINCT company FROM financials_clean;
SELECT DISTINCT company , fiscal_year  FROM financials_clean; 
SELECT company, report_page FROM tieout;

SELECT company ,fiscal_year 
FROM financials_clean 
ORDER BY fiscal_year DESC;

SELECT company ,fiscal_year , value 
FROM financials_clean 
WHERE line_item = 'net_income'
ORDER BY value ;

SELECT company ,report_page  
FROM tieout 
ORDER BY report_page ;

SELECT *
FROM financials_clean 
ORDER BY company ASC , fiscal_year DESC, line_item ASC;

SELECT company ,fiscal_year , value/1e9 AS value_bn 
FROM financials_clean 
WHERE company = 'RBC' 
	AND line_item = 'total_assets'
ORDER BY fiscal_year DESC ;

SELECT company , fiscal_year ,value 
FROM financials_clean 
WHERE line_item = 'net_income'
	AND company = 'INTC'
ORDER BY value ASC 
LIMIT 2;

SELECT company, fiscal_year , value
FROM financials_clean 
WHERE company = 'NVDA'
	AND line_item ='revenue'
ORDER BY value DESC 
LIMIT 1 
OFFSET 1;

SELECT company, fiscal_year , value
FROM financials_clean 
WHERE line_item ='revenue'
	AND company ='RBC'
ORDER BY fiscal_year DESC 
LIMIT 1;


SELECT company, fiscal_year, value
FROM financials_clean
WHERE line_item = 'net_income'
LIMIT 3;

SELECT ROUND(2.345, 2), ROUND(66.605, 1), ABS(-19233), CAST('0001000275' AS INTEGER);

SELECT company , fiscal_year , line_item , ROUND(value/1e9,1) AS revenue_bn
FROM financials_clean 
WHERE line_item  = 'revenue'
	AND fiscal_year = 2025
ORDER BY company ASC;

--EX VERSION A
SELECT company , report_page AS page_number
FROM tieout 
ORDER BY CAST(page_number AS INTEGER) ASC;

--EX VERSION A2
SELECT company , report_page
FROM tieout 
ORDER BY CAST(report_page AS INTEGER) ASC;

--EX VERSION B
SELECT company , CAST(report_page AS INTEGER) AS page_number
FROM tieout 
ORDER BY page_number ASC;


SELECT report_page,
       typeof(report_page) AS stored_type,
       CAST(report_page AS INTEGER) AS page_number,
       typeof(CAST(report_page AS INTEGER)) AS cast_type
FROM tieout;


-- ===== Concept 4: text functions =====

--EX 1
SELECT UPPER('net_income'),
       LENGTH('0001000275'),
       SUBSTR('2025-10-31', 6, 2),
       'RBC' || ' FY' || 2025;



--EX 2
SELECT company , LENGTH(sec_number) AS sec_len
FROM companies ;

-- EX 2b
SELECT company , sec_number, LENGTH(sec_number) AS sec_len
FROM companies
WHERE LENGTH(sec_number) <> 10;

-- EX 3i (WRONG): period_end makes every row unique, so DISTINCT removes nothing. 25 rows.

SELECT DISTINCT company , period_end , SUBSTR(period_end,6,2 ) AS year_end_month
FROM financials_clean;

-- EX 3ii (final)

SELECT DISTINCT company , SUBSTR(period_end,6,2 ) AS year_end_month
FROM financials_clean;

   -- Lesson: typed-in '2025' + DISTINCT hid 25 mislabelled rows. Build labels from columns.


-- EX 4 (final)
SELECT  company , company || ' FY' || fiscal_year || ' ' || REPLACE(line_item,'_',' ') AS label, value
FROM financials_clean 
WHERE company ='RBC'
	AND fiscal_year = 2025;





