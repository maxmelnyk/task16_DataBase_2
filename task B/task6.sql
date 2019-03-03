#1 -----------------------------
SELECT 
    AVG(price) AS 'average price = '
FROM
    laptop;
    
#2 -----------------------------
SELECT 
    CONCAT('code: ', code) AS 'code',
    CONCAT('model: ', model) AS 'model',
    CONCAT('speed: ', speed) AS 'speed',
    CONCAT('ram: ', ram) AS 'ram',
    CONCAT('hd: ', hd) AS 'hd',
    CONCAT('cd: ', cd) AS 'cd',
    CONCAT('price: ', price) AS 'price'
FROM
    pc;
    
#3 -----------------------------
SELECT 
    CONCAT(YEAR(date),
            '.',
            MONTH(date),
            '.',
            DAY(date)) AS 'date'
FROM
    income;

#4 -----------------------------
SELECT 
    ship,
    battle,
    CASE result
        WHEN 'sunk' THEN 'потонув'
        WHEN 'damaged' THEN 'пошкоджений'
        ELSE 'OK'
    END AS result
FROM
    outcomes;
    
#5 -----------------------------
SELECT 
    CONCAT('row: ', LEFT(place, 1)) AS 'row',
    CONCAT('place: ', RIGHT(place, 1)) AS 'place'
FROM
    pass_in_trip;
    
#6 -----------------------------
SELECT 
    trip_no,
    ID_comp,
    plane,
    CONCAT('from ', town_from, ' to ', town_to) AS 'from/to',
    time_out,
    time_in
FROM
    trip;