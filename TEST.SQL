--A business is analyzing data by country. For each country, display the country name, total number of invoices, and their average amount. Format the average as a floating-point number with 6 decimal places. Return only those countries where their average invoice amount is greater than the average invoice amount over all invoices. 

SELECT 
    c.country,
    COUNT(i.invoice_id) AS total_invoices,
    AVG(i.total) AS average_invoice_amount
FROM invoice i
INNER JOIN customer c ON i.customer_id = c.customer_id
GROUP BY c.country
HAVING AVG(i.total) > (SELECT AVG(total) FROM invoice)
ORDER BY c.country;
