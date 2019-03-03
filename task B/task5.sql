#1 -----------------------------
SELECT 
    maker
FROM
    product
WHERE
    EXISTS( SELECT 
            model
        FROM
            pc
        WHERE
            model = product.model);

#2 -----------------------------
SELECT 
    maker
FROM
    product
WHERE
    EXISTS( SELECT 
            model
        FROM
            pc
        WHERE
            model = product.model AND speed >= 750);

#3 -----------------------------
SELECT 
    maker
FROM
    product
WHERE
    EXISTS( SELECT 
            model
        FROM
            pc
        WHERE
            model = product.model AND speed >= 750)
        OR EXISTS( SELECT 
            model
        FROM
            laptop
        WHERE
            model = product.model AND speed >= 750);

#5 -----------------------------
SELECT 
    name, launched, displacement
FROM
    ships AS s
        JOIN
    classes AS c ON s.class = c.class
WHERE
    launched >= 1922
        AND displacement > 35000;

#6 -----------------------------
SELECT 
    class
FROM
    ships
WHERE
    EXISTS( SELECT 
            ship
        FROM
            outcomes
        WHERE
            ship = ships.name AND result = 'sunk');