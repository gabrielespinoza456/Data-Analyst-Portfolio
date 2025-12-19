CREATE OR REPLACE VIEW housing_analysis_view AS
SELECT
z.RegionName AS ZipCode,
z.City,
z.State,
z.Date_Str,
z.Home_Value,
r.interest_rate,
ROUND(
	z.Home_Value * ( (r.interest_rate / 12) * POWER(1 + (r.interest_rate / 12), 360) )
	/ ( POWER(1 + (r.interest_rate / 12), 360) - 1)
) AS monthly_payment
FROM zillow_data z
JOIN us_mortgage_rates r
ON z.Date_Str = r.month_id
WHERE z.Home_Value IS NOT NULL
AND z.Home_Value > 0
AND z.City IS NOT NULL
AND z.City != '';

# This was to debug why my view had bad rows, which are now filtered out
SELECT COUNT(*) FROM housing_analysis_view
WHERE (City IS NULL OR City = '') OR (Home_Value = 0);

# Making sure the date range came out right
SELECT min(Date_Str), max(Date_Str)
FROM housing_analysis_view;
