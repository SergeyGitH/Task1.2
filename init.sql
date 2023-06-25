CREATE TABLE IF NOT EXISTS public.readers (
    reader_id serial PRIMARY KEY,
    number_ticket BIGINT NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    surname VARCHAR(255) NOT NULL,
    patronymic VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS public.rent (
    rent_id serial PRIMARY KEY,
    data DATE
    FOREIGN KEY (reader_id) REFERENCES readers (reader_id) ON DELETE SET NULL,
    FOREIGN KEY (book_id) REFERENCES books (book_id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS public.publisher (
    publisher_id serial PRIMARY KEY,
    name_publisher VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS public.books (
    book_id serial PRIMARY KEY,
    code BIGINT NOT NULL,
    year VARCHAR(255) NOT NULL,
    volume VARCHAR(255) NOT NULL,
    quantity VARCHAR(255) NOT NULL
    FOREIGN KEY (publisher_id) REFERENCES publisher (publisher_id) ON DELETE SET NULL
);
CREATE TABLE IF NOT EXISTS public.author (
    author_id serial PRIMARY KEY,
    last_name VARCHAR(255) NOT NULL,
    surname VARCHAR(255) NOT NULL,
    patronymic VARCHAR(255) NOT NULL,
    birth_year VARCHAR(255) NOT NULL
);
