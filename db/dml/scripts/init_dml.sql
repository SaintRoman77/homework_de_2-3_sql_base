INSERT INTO public.authors (author_fio)
VALUES ('Пушкин Александр Сергеевич'),
       ('Толстой Лев Николаевич'),
       ('Лермонтов Михаил Юрьевич'),
       ('Тургенев Иван Сергеевич'),
       ('Булгаков Михаил Афанасьевич');

INSERT INTO public.books (book_name, count_copies_of_book, year_of_publishing_book, book_size, book_prise)
VALUES ('Евгений Онегин', 1, '2000-01-01', 260, 100.10),
       ('Капитанская дочка', 1, '2001-01-01', 230, 200.20),
       ('Кавказский пленник', 1, '2002-01-01', 260, 300.30),
       ('Война и мир, том 1', 1, '2003-01-01', 516, 400.40),
       ('Герой нашего времени', 1, '2004-01-01', 180, 500.50),
       ('Княгиня Лиговская', 1, '2005-01-01', 320, 600.60),
       ('Отцы и дети', 1, '2006-01-01', 316, 700.70),
       ('Муму', 1, '2007-01-01', 80, 800.80),
       ('Белая гвардия', 1, '2008-01-01', 296, 900.90),
       ('Собачье сердце', 1, '2009-01-01', 380, 1000.10),
       ('Руслан и Людмила', 1, '2010-01-01', 280, 1100.10);

INSERT INTO public.authors_books (book_cipher, author_id)
VALUES (1, 1), (2, 1), (3, 2), (4, 2), (5, 3),
       (6, 3), (7, 4), (8, 4), (9, 5), (10, 5), (11, 1);

INSERT INTO public.cities (city_name)
VALUES ('Moscow'), ('SaintP');

INSERT INTO public.publishing_houses (publishing_house_name, city_code)
VALUES ('Fenix', 1), ('Drofa', 2);

INSERT INTO public.copies_of_books (location_of_copie, publishing_house_id, book_cipher)
VALUES ('stelazh_1_1', 1, 1), ('stelazh_1_2', 2, 2), ('stelazh_1_3', 1, 3),
       ('stelazh_1_4', 2, 4), ('stelazh_1_5', 1, 5), ('stelazh_1_6', 2, 6),
       ('stelazh_1_7', 1, 7), ('stelazh_1_8', 2, 8), ('stelazh_1_9', 1, 9),
       ('stelazh_1_10', 2, 10), ('stelazh_1_11', 2, 11);

INSERT INTO public.readers (reader_fio, reader_address, reader_phone_number)
VALUES ('Ivanov Ivan Ivanovich', 'Moscow, Shodnenskaya street 1, 11', '8(800)111-11-11'),
       ('Sidorov Sidor Sidorovich', 'Moscow, Shodnenskaya street 2, 22', '8(800)222-22-22'),
       ('Petrov Petr Petrovich', 'Moscow, Shodnenskaya street 3, 33', '8(800)333-33-33'),
       ('Aleksandrov Aleksandr Aleksandrovich', 'Moscow, Shodnenskaya street 4, 44', '8(800)444-44-44'),
       ('Evgeniev Evgeni Evgenievich', 'Moscow, Shodnenskaya street 5, 55', '8(800)555-55-55');

INSERT INTO public.lending_of_books (lending_date, deadline_time, return_date, number_of_reader_ticket, copies_of_books_id)
VALUES ('2023-01-01', '2023-01-14', '2023-01-13', 1, 1),
       ('2023-02-02', '2023-02-15', NULL, 2, 2),
       ('2023-03-03', '2023-03-16', '2023-03-15', 2, 3),
       ('2023-04-04', '2023-04-17', NULL, 2, 4),
       ('2023-05-05', '2023-05-18', '2023-05-17', 3, 5),
       ('2023-06-06', '2023-06-19', NULL, 3, 6),
       ('2023-07-07', '2023-07-20', '2023-07-19', 4, 7),
       ('2023-06-06', '2023-06-19', '2023-06-18', 4, 8),
       ('2023-05-05', '2023-05-18', '2023-05-17', 5, 9),
       ('2023-04-04', '2023-04-17', '2023-04-16', 5, 10),
       ('2023-03-03', '2023-03-16', '2023-03-15', 1, 11);
