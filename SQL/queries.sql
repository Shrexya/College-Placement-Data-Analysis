SELECT Branch, AVG(Package)
FROM placements
GROUP BY Branch;

SELECT Company, COUNT(*)
FROM placements
GROUP BY Company;
