CREATE TABLE books_staging (
	id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    author VARCHAR(255),
    number_of_pages INT,
    genre VARCHAR(255),
    url VARCHAR(255),
    finishing_date DATE,
	rating FLOAT
);

CREATE TABLE authors (
	author_id SERIAL PRIMARY KEY,
    author_name VARCHAR(255)
);

CREATE TABLE books (
	book_id SERIAL PRIMARY KEY,
    book_name VARCHAR(255),
    number_of_pages INT,
    genre VARCHAR(255),
    url VARCHAR(255),
    finishing_date DATE,
	rating FLOAT,
	author_id INT, FOREIGN KEY (author_id) REFERENCES authors(author_id)
);


