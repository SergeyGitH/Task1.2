INSERT INTO public.readers (number_ticket, last_name, telephone)
VALUES (101, "Ivanov", "911-111-111-11"),
    (102, "Petrov", "922-111-111-11"),
    (103, "Sidorov", "933-111-111-11"),
    (104, "Kozlov", "944-111-111-11"),
    (105, "Voronov", "955-111-111-11"),
    (106, "Baranov", "966-111-111-11"),
);

INSERT INTO public.readers (number_ticket, last_name, telephone)
VALUES (101, "Ivanov", "911-111-111-11"),
    (102, "Petrov", "922-111-111-11"),
    (103, "Sidorov", "933-111-111-11"),
    (104, "Kozlov", "944-111-111-11"),
    (105, "Voronov", "955-111-111-11"),
    (106, "Baranov", "966-111-111-11"),
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
    quantity VARCHAR(255) NOT NULL,
    FOREIGN KEY (publisher_id) REFERENCES publisher (publisher_id) ON DELETE SET NULL
);
CREATE TABLE IF NOT EXISTS public.rent (
    rent_id serial PRIMARY KEY,
    data DATE,
    FOREIGN KEY (reader_id) REFERENCES readers (reader_id) ON DELETE SET NULL,
    FOREIGN KEY (book_id) REFERENCES books (book_id) ON DELETE SET NULL
);
CREATE TABLE IF NOT EXISTS public.author (
    author_id serial PRIMARY KEY,
    last_name VARCHAR(255) NOT NULL,
    surname VARCHAR(255) NOT NULL,
    patronymic VARCHAR(255) NOT NULL,
    birth_year VARCHAR(255) NOT NULL
);
CREATE TABLE IF NOT EXISTS public.books_author (
    FOREIGN KEY (book_id) REFERENCES books (books_id) ON DELETE SET NULL,
    FOREIGN KEY (author_id) REFERENCES author (author_id) ON DELETE SET NULL
);
