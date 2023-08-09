CREATE TABLE IF NOT EXISTS public.authors (
    author_id serial PRIMARY KEY,
    author_fio VARCHAR(255) NOT NULL
);
CREATE TABLE IF NOT EXISTS public.books (
    book_cipher serial PRIMARY KEY,
    book_name VARCHAR(255) NOT NULL,
    count_copies_of_book INTEGER NOT NULL,
    year_of_publishing_book DATE NOT NULL,
    book_size INTEGER NOT NULL,
    book_prise REAL NOT NULL
);
CREATE TABLE IF NOT EXISTS public.authors_books (
    book_author_id serial PRIMARY KEY,
    book_cipher INTEGER,
    author_id INTEGER,
    FOREIGN KEY (book_cipher) REFERENCES books (book_cipher) ON DELETE SET NULL,
    FOREIGN KEY (author_id) REFERENCES authors (author_id) ON DELETE SET NULL
);
CREATE TABLE IF NOT EXISTS public.cities (
    city_code serial PRIMARY KEY,
    city_name VARCHAR(255) NOT NULL
);
CREATE TABLE IF NOT EXISTS public.publishing_houses (
    publishing_house_id serial PRIMARY KEY,
    publishing_house_name VARCHAR(255) NOT NULL,
    city_code INTEGER,
    FOREIGN KEY (city_code) REFERENCES cities (city_code) ON DELETE SET NULL
);
CREATE TABLE IF NOT EXISTS public.copies_of_books (
    copies_of_books_id serial PRIMARY KEY,
    location_of_copie VARCHAR(255) NOT NULL,
    publishing_house_id INTEGER,
    book_cipher INTEGER,
    FOREIGN KEY (book_cipher) REFERENCES books (book_cipher) ON DELETE CASCADE,
    FOREIGN KEY (publishing_house_id) REFERENCES publishing_houses (publishing_house_id) ON DELETE SET NULL
);
CREATE TABLE IF NOT EXISTS public.readers (
    number_of_reader_ticket serial PRIMARY KEY,
    reader_fio VARCHAR(255) NOT NULL,
    reader_address VARCHAR(255) NOT NULL,
    reader_phone_number VARCHAR(255) NOT NULL
);
CREATE TABLE IF NOT EXISTS public.lending_of_books (
    lending_of_book_id serial PRIMARY KEY,
    lending_date DATE NOT NULL,
    deadline_time DATE NOT NULL,
    return_date DATE,
    number_of_reader_ticket INTEGER,
    copies_of_books_id INTEGER,
    FOREIGN KEY (number_of_reader_ticket) REFERENCES readers (number_of_reader_ticket) ON DELETE CASCADE,
    FOREIGN KEY (copies_of_books_id) REFERENCES copies_of_books (copies_of_books_id) ON DELETE SET NULL
);
