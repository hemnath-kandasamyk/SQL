SELECT
    SUM(city.Population)
FROM 
    City
LEFT JOIN
    country 
ON City.countrycode = country.code
where country.continent = 'Asia'
