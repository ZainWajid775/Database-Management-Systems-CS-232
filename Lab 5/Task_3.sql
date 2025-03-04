SELECT ename
FROM employee
WHERE eid = (
    SELECT eid 
    FROM certified 
    WHERE aid = (
        SELECT aid 
        FROM aircraft 
        WHERE cruising_range = (
            SELECT MAX(cruising_range) 
            FROM aircraft
        )
    )
);