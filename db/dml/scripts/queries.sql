-- Определить, сколько книг прочитал каждый читатель в текущем году. Вывести рейтинг читателей по убыванию.
SELECT r.reader_fio "READER", COUNT(lb.return_date) "TOTAL"
FROM readers r
LEFT JOIN lending_of_books lb USING(number_of_reader_ticket)
WHERE lb.return_date IS NOT NULL AND EXTRACT(YEAR FROM lb.lending_date) = 2023
GROUP BY r.reader_fio
ORDER BY "TOTAL" DESC;

-- Определить, сколько книг у читателей на руках на текущую дату.
SELECT COUNT(copies_of_books_id) AS "TOTAL"
FROM lending_of_books lb
WHERE lb.return_date IS NULL;

-- Определить читателей, у которых на руках определенная книга.
SELECT r.reader_fio AS "READER"
FROM readers r
LEFT JOIN lending_of_books lb USING(number_of_reader_ticket)
WHERE lb.return_date IS NULL AND lb.copies_of_books_id = (SELECT copies_of_books_id
                                                          FROM copies_of_books
                                                          LEFT JOIN books b USING(book_cipher)
                                                          WHERE b.book_name = 'Капитанская дочка');

-- Определите, какие книги на руках читателей.
SELECT b.book_name "BOOK"
FROM copies_of_books cb
JOIN books b USING(book_cipher)
JOIN lending_of_books lb USING(copies_of_books_id)
WHERE lb.return_date IS NULL;

-- Вывести количество должников на текущую дату.
SELECT COUNT(number_of_reader_ticket) "TOTAL"
FROM lending_of_books lb
WHERE lb.return_date IS NULL;

-- Книги какого издательства были самыми востребованными у читателей? Отсортируйте издательства по убыванию востребованности книг.
SELECT ph.publishing_house_name "PUBLISH", COUNT(cb.publishing_house_id) "TOTAL"
FROM copies_of_books cb
JOIN lending_of_books lb USING(copies_of_books_id)
JOIN publishing_houses ph USING(publishing_house_id)
GROUP BY ph.publishing_house_name
ORDER BY "TOTAL" DESC;

-- Определить самого издаваемого автора.
SELECT a.author_fio "AUTHOR"
FROM authors_books ab
JOIN authors a USING(author_id)
JOIN books b USING(book_cipher)
GROUP BY a.author_fio
ORDER BY SUM(b.count_copies_of_book) DESC
LIMIT 1;

-- Определить среднее количество прочитанных страниц читателем за день.
SELECT r.reader_fio "READER", AVG(mlt.book_size / (mlt.return_date - mlt.lending_date)) "TOTAL"
FROM (SELECT book_size, return_date, lending_date, number_of_reader_ticket
      FROM copies_of_books
      JOIN lending_of_books lb USING(copies_of_books_id)
      JOIN books b USING(book_cipher)
      WHERE return_date IS NOT NULL) mlt
JOIN readers r USING(number_of_reader_ticket)
GROUP BY r.reader_fio
ORDER BY "TOTAL" DESC;
