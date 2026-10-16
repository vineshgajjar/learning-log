-- Day 1: SELECT, WHERE, aliases and filters on practice data (5 companies, FY2021–FY2025)


SELECT * FROM companies;
SELECT  name, country, accounting_standard FROM companies;
SELECT company, sector FROM companies;	
PRAGMA table_info(financials_clean);
SELECT 7/2 , 7/2.0;
SELECT -7/2;	
SELECT company, fiscal_year, line_item, value, value/1000000000.0 AS value_bn FROM financials_clean;
SELECT name AS company_name, ticker FROM companies;
SELECT line_item  FROM financials_clean WHERE company ='RBC' AND fiscal_year = 2025;
SELECT company , line_item , value FROM financials_clean WHERE fiscal_year = 2025;
SELECT company , line_item, value, value / 1000000.0 AS value_mn FROM financials_clean WHERE company = 'RBC' AND fiscal_year = 2025 AND line_item = 'total_equity';
SELECT company ,fiscal_year, line_item , value FROM financials_clean WHERE line_item = 'net_income' AND value < 0;
SELECT * FROM companies WHERE country = 'US';
SELECT DISTINCT line_item FROM financials_clean;