USE chinook;

-- Query 1
SELECT 
    c.CustomerId,
    c.FirstName,
    c.LastName,
    SUM(i.Total) AS TotalPurchaseAmount
FROM
    Customer c
        JOIN
    Invoice i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId , c.FirstName , c.LastName
ORDER BY TotalPurchaseAmount DESC
LIMIT 5;


-- Query 2
SELECT 
    g.Name AS Genre, COUNT(il.InvoiceLineId) AS TotalTracksSold
FROM
    InvoiceLine il
        JOIN
    Track t ON il.TrackId = t.TrackId
        JOIN
    Genre g ON t.GenreId = g.GenreId
GROUP BY g.GenreId , g.Name
ORDER BY TotalTracksSold DESC
LIMIT 1;


-- Query 3
SELECT 
    m.EmployeeId AS ManagerID,
    CONCAT(m.FirstName, ' ', m.LastName) AS ManagerName,
    e.EmployeeId AS SubordinateID,
    CONCAT(e.FirstName, ' ', e.LastName) AS SubordinateName
FROM
    Employee e
        JOIN
    Employee m ON e.ReportsTo = m.EmployeeId
ORDER BY ManagerName;


-- Query 4
SELECT
    ArtistName,
    AlbumTitle,
    TotalSold
FROM (
    SELECT
        ar.Name AS ArtistName,
        al.Title AS AlbumTitle,
        COUNT(il.InvoiceLineId) AS TotalSold,
        ROW_NUMBER() OVER (
            PARTITION BY ar.ArtistId
            ORDER BY COUNT(il.InvoiceLineId) DESC
        ) AS rn
    FROM
        InvoiceLine il
        JOIN Track t ON il.TrackId = t.TrackId
        JOIN Album al ON t.AlbumId = al.AlbumId
        JOIN Artist ar ON al.ArtistId = ar.ArtistId
    GROUP BY
        ar.ArtistId,
        ar.Name,
        al.AlbumId,
        al.Title
) AS ranked_albums
WHERE rn = 1
ORDER BY ArtistName;


-- Query 5
SELECT 
    DATE_FORMAT(InvoiceDate, '%Y-%m') AS YearMonth,
    SUM(Total) AS MonthlySales
FROM
    Invoice
WHERE
    YEAR(InvoiceDate) = 2013
GROUP BY YearMonth
ORDER BY YearMonth;

