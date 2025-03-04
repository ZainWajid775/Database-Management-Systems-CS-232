SELECT eid,(SELECT aname FROM aircraft WHERE aid = c.aid) aircraft , (SELECT ename FROM employee WHERE eid = c.eid)
FROM certified c;