SELECT aname 
FROM aircraft 
WHERE cruising_range >= (SELECT distance FROM flights WHERE from_loc = 'LA');