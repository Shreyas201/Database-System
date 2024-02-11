-- D1
SELECT Location AS 'Country Name (CN) ', 
     Date AS 'Administered Vaccine on OD (VOD)',
     Total_vaccinations AS 'Total Administered Vaccines'
     FROM Vaccinations
-- D2
SELECT Location AS 'Country',
     SUM(Total_vaccinations) AS 'Cumulative Doses'
     FROM Vaccinations
     GROUP BY Location
-- D3
SELECT Country_name AS 'Country',
     Vaccine_name AS 'Vaccine Type'
     FROM Locations
-- D4
SELECT Source_url AS 'Source Name (URL)',
     SUM(Total_vaccinations) AS 'Total Administered Vaccines'
     FROM AUS_GER_IT_US
     GROUP BY Source_url
-- D5
    
WITH AUS AS(
SELECT Date,
     People_fully_vaccinated AS 'Australia'
     FROM AUS_GER_IT_US
     WHERE Country_name = 'Australia' AND SUBSTR(Date, 6) = '2022'
)
,US AS(
SELECT Date,
     People_fully_vaccinated AS 'United_States'
     FROM AUS_GER_IT_US
     WHERE Country_name = 'United States' AND SUBSTR(Date, 6) = '2022'
)
,GER AS(
SELECT Date,
     People_fully_vaccinated AS 'Germany'
     FROM AUS_GER_IT_US
     WHERE Country_name = 'Germany' AND SUBSTR(Date, 6) = '2022'
)
,ITA AS(
SELECT Date,
     People_fully_vaccinated AS 'Italy'
     FROM AUS_GER_IT_US
     WHERE Country_name = 'Italy' AND SUBSTR(Date, 6) = '2022'
)
, COMB AS(
SELECT * FROM AUS
LEFT JOIN US
ON AUS.Date = US.Date
LEFT JOIN GER
ON US.Date = GER.Date
LEFT JOIN ITA
ON GER.Date = ITA.Date
)
SELECT Date, Australia,
     United_States AS 'United States',
     Germany,
     Italy
     FROM COMB