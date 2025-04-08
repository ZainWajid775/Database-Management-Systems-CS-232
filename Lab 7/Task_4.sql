DO $$
BEGIN
    IF EXISTS 
    (
        SELECT title 
		FROM book 
		WHERE isbn = '978-1983126694'
    ) 
    THEN
        RAISE NOTICE 'Book Found: %',(SELECT title FROM book WHERE isbn = '978-1983126694');
    ELSE
        RAISE NOTICE 'Book with ISBN 978-1983126694 not found.';
    END IF;
END $$;