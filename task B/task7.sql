#1 -----------------------------
SELECT 
    model, price
FROM
    printer
HAVING price = ANY (SELECT 
        MAX(price)
    FROM
        printer);

#2 -----------------------------
SELECT 
    type, l.model, speed
FROM
    laptop AS l
        JOIN
    product AS p ON l.model = p.model
HAVING speed < ALL (SELECT 
        speed
    FROM
        pc);

#3 -----------------------------
SELECT 
    maker, price
FROM
    product AS p
        JOIN
    printer AS p1 ON p.model = p1.model
HAVING price = ANY (SELECT 
        MIN(price)
    FROM
        printer);

#4 -----------------------------
SELECT 
    PC.maker, PC.model_count
FROM
    (SELECT 
        maker, COUNT(model) AS 'model_count'
    FROM
        product
    WHERE
        type = 'PC'
    GROUP BY maker
    HAVING COUNT(model) >= 2) PC;

#5 -----------------------------
SELECT 
    AVG(PC.hd) AS 'hd_average'
FROM
    (SELECT 
        hd
    FROM
        pc
    JOIN product AS p ON pc.model = p.model
    WHERE
        p.type = 'PC' OR p.type = 'Printer'
    GROUP BY maker) PC;