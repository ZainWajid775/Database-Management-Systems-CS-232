SELECT eid,(SELECT aname FROM aircraft WHERE aid = c.aid) aircraft 
FROM certified c;