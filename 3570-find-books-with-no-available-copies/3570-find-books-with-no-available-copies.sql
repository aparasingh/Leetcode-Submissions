# Write your MySQL query statement below
WITH unreturned_books AS(
    select book_id, COUNT(book_id) as quantity from borrowing_records where return_date is null group by book_id)
    SELECT l.book_id, l.title, l.author, l.genre, l.publication_year, u.quantity as current_borrowers FROM library_books l JOIN unreturned_books u ON (l.book_id = u.book_id and l.total_copies = u.quantity) ORDER BY u.quantity DESC, l.title ASC;