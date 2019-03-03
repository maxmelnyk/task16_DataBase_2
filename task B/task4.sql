#1 -----------------------------
SELECT DISTINCT
    maker
FROM
    product
WHERE
    maker IN (SELECT 
            maker
        FROM
            product
        WHERE
            model IN (SELECT 
                    model
                FROM
                    pc))
        AND maker NOT IN (SELECT 
            maker
        FROM
            product
        WHERE
            model IN (SELECT 
                    model
                FROM
                    laptop));

#2 -----------------------------
SELECT DISTINCT
    maker
FROM
    product
WHERE
    maker = ALL (SELECT 
            maker
        FROM
            product
        WHERE
            maker IN (SELECT 
                    maker
                FROM
                    product
                WHERE
                    model IN (SELECT 
                            model
                        FROM
                            pc))
                AND maker NOT IN (SELECT 
                    maker
                FROM
                    product
                WHERE
                    model IN (SELECT 
                            model
                        FROM
                            laptop)));

#3 -----------------------------
SELECT DISTINCT
    maker
FROM
    product
WHERE
    maker = ANY (SELECT 
            maker
        FROM
            product
        WHERE
            model IN (SELECT 
                    model
                FROM
                    pc))
        AND maker NOT IN (SELECT 
            maker
        FROM
            product
        WHERE
            model IN (SELECT 
                    model
                FROM
                    laptop));

#4 -----------------------------
SELECT DISTINCT
    maker
FROM
    product
WHERE
    maker IN (SELECT 
            maker
        FROM
            product
        WHERE
            model IN (SELECT 
                    model
                FROM
                    laptop))
        AND maker IN (SELECT 
            maker
        FROM
            product
        WHERE
            model IN (SELECT 
                    model
                FROM
                    pc));

#5 -----------------------------
SELECT DISTINCT
    maker
FROM
    product
WHERE
    maker = ANY (SELECT 
            maker
        FROM
            product
        WHERE
            model IN (SELECT 
                    model
                FROM
                    laptop))
        AND maker = ANY (SELECT 
            maker
        FROM
            product
        WHERE
            model IN (SELECT 
                    model
                FROM
                    pc));