
CREATE FUNCTION insert_data_trigger()
RETURNS TRIGGER AS $$
BEGIN

INSERT INTO authors (author_name)
SELECT DISTINCT s.author 
FROM books_staging s
WHERE NOT EXISTS (
    SELECT * 
    FROM authors a 
    WHERE a.author_name = s.author
);


INSERT INTO books (book_name, number_of_pages, genre, url, finishing_date, rating, author_id)
SELECT s.title, s.number_of_pages, s.genre, s.url, s.finishing_date, s.rating, a.author_id
FROM books_staging s
JOIN authors a ON s.author = a.author_name
WHERE NOT EXISTS (
    SELECT * 
    FROM books b 
    WHERE b.book_name = s.title AND b.finishing_date = s.finishing_date
);

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;



--trigger
CREATE TRIGGER insert_trigger
AFTER INSERT ON books_staging
FOR EACH ROW
EXECUTE FUNCTION insert_data_trigger();





