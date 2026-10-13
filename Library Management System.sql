CREATE DATABASE Smart_Library_System;
OUTPUT:
Query OK, 1 row affected (0.615 sec)

USE Smart_Library_System;
OUTPUT:
Database changed

CREATE TABLE Authors (
    ->     author_id INT PRIMARY KEY AUTO_INCREMENT,
    ->     name VARCHAR(100) NOT NULL,
    ->     email VARCHAR(100)
    -> );
Query OK, 0 rows affected (0.859 sec)

CREATE TABLE Books (
    ->     book_id INT PRIMARY KEY AUTO_INCREMENT,
    ->     title VARCHAR(150) NOT NULL,
    ->     author_id INT,
    ->     category VARCHAR(50),
    ->     isbn VARCHAR(20),
    ->     published_date DATE,
    ->     price DECIMAL(10, 2),
    ->     available_copies INT,
    ->     FOREIGN KEY (author_id) REFERENCES Authors(author_id)
    -> );
Query OK, 0 rows affected (1.039 sec)

CREATE TABLE Members (
    ->     member_id INT PRIMARY KEY AUTO_INCREMENT,
    ->     name VARCHAR(100) NOT NULL,
    ->     email VARCHAR(100),
    ->     phone_number VARCHAR(15),
    ->     membership_date DATE
    -> );
Query OK, 0 rows affected (0.581 sec)

CREATE TABLE Transactions (
    ->     transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    ->     member_id INT,
    ->     book_id INT,
    ->     borrow_date DATE,
    ->     return_date DATE,
    ->     fine_amount DECIMAL(10, 2),
    ->     FOREIGN KEY (member_id) REFERENCES Members(member_id),
    ->     FOREIGN KEY (book_id) REFERENCES Books(book_id)
    -> );
Query OK, 0 rows affected (0.569 sec)

INSERT INTO Authors (name, email) VALUES
    -> ('J.K. Rowling', 'jkrowling@gmail.com'),
    -> ('Chetan Bhagat', 'chetan@yahoo.com'),
    -> ('George Orwell', 'george@orwell.org'),
    -> ('  A.P.J. Abdul Kalam  ', NULL);
Query OK, 4 rows affected (0.611 sec)
Records: 4  Duplicates: 0  Warnings: 0

INSERT INTO Books (title, author_id, category, isbn, published_date, price, available_copies) VALUES
    -> ('harry potter and the philosopher stone', 1, 'Fantasy', '9780747532699', '1997-06-26', 450.00, 5),
    -> ('two states', 2, 'Romance', '9788129115300', '2009-10-01', 300.00, 2),
    -> ('1984', 3, 'Science', '9780451524935', '1949-06-08', 250.00, 0),
    -> ('wings of fire', 4, 'Biography', '9788173711466', '1999-01-01', 400.00, 3),
    -> ('future tech 2024', 1, 'Science', '9781234567890', '2022-05-10', 550.00, 4);
Query OK, 5 rows affected (0.601 sec)
Records: 5  Duplicates: 0  Warnings: 0

INSERT INTO Members (name, email, phone_number, membership_date) VALUES
    -> ('Rahul Sharma', 'rahul@gmail.com', '9876543210', '2021-03-15'),
    -> ('Priya Patel', NULL, '9123456789', '2023-01-10'),
    -> ('Amit Kumar', 'amit@yahoo.com', '9988776655', '2019-11-20');
Query OK, 3 rows affected (0.584 sec)
Records: 3  Duplicates: 0  Warnings: 0

INSERT INTO Transactions (member_id, book_id, borrow_date, return_date, fine_amount) VALUES
    -> (1, 1, '2026-05-01', '2026-05-15', 0.00),
    -> (1, 2, '2026-09-10', '2026-09-25', 20.00),
    -> (2, 4, '2026-09-15', '2026-09-30', 0.00);
Query OK, 3 rows affected (0.575 sec)
Records: 3  Duplicates: 0  Warnings: 0

UPDATE Books SET available_copies = available_copies - 1 WHERE book_id = 1;
Query OK, 1 row affected (0.575 sec)
Rows matched: 1  Changed: 1  Warnings: 0

 DELETE FROM Members
    -> WHERE member_id NOT IN (
    ->     SELECT DISTINCT member_id FROM Transactions
    ->     WHERE borrow_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
    -> );SELECT * FROM Books WHERE YEAR(published_date) > 2015;[span_5](start_span)[span_5](end_span)
Query OK, 1 row affected (0.563 sec)

+---------+------------------+-----------+----------+---------------+----------------+--------+------------------+
| book_id | title            | author_id | category | isbn          | published_date | price  | available_copies |
+---------+------------------+-----------+----------+---------------+----------------+--------+------------------+
|       5 | future tech 2024 |         1 | Science  | 9781234567890 | 2022-05-10     | 550.00 |                4 |
+---------+------------------+-----------+----------+---------------+----------------+--------+------------------+
1 row in set (0.006 sec)


SELECT * FROM Books ORDER BY price DESC LIMIT 5;[span_7](start_span)[span_7](end_span)
+---------+----------------------------------------+-----------+-----------+---------------+----------------+--------+------------------+
| book_id | title                                  | author_id | category  | isbn          | published_date | price  | available_copies |
+---------+----------------------------------------+-----------+-----------+---------------+----------------+--------+------------------+
|       5 | future tech 2024                       |         1 | Science   | 9781234567890 | 2022-05-10     | 550.00 |                4 |
|       1 | harry potter and the philosopher stone |         1 | Fantasy   | 9780747532699 | 1997-06-26     | 450.00 |                4 |
|       4 | wings of fire                          |         4 | Biography | 9788173711466 | 1999-01-01     | 400.00 |                3 |
|       2 | two states                             |         2 | Romance   | 9788129115300 | 2009-10-01     | 300.00 |                2 |
|       3 | 1984                                   |         3 | Science   | 9780451524935 | 1949-06-08     | 250.00 |                0 |
+---------+----------------------------------------+-----------+-----------+---------------+----------------+--------+------------------+
5 rows in set (0.545 sec)


 SELECT * FROM Books ORDER BY price DESC LIMIT 5;[span_7](start_span)[span_7](end_span)
+---------+----------------------------------------+-----------+-----------+---------------+----------------+--------+------------------+
| book_id | title                                  | author_id | category  | isbn          | published_date | price  | available_copies |
+---------+----------------------------------------+-----------+-----------+---------------+----------------+--------+------------------+
|       5 | future tech 2024                       |         1 | Science   | 9781234567890 | 2022-05-10     | 550.00 |                4 |
|       1 | harry potter and the philosopher stone |         1 | Fantasy   | 9780747532699 | 1997-06-26     | 450.00 |                4 |
|       4 | wings of fire                          |         4 | Biography | 9788173711466 | 1999-01-01     | 400.00 |                3 |
|       2 | two states                             |         2 | Romance   | 9788129115300 | 2009-10-01     | 300.00 |                2 |
|       3 | 1984                                   |         3 | Science   | 9780451524935 | 1949-06-08     | 250.00 |                0 |
+---------+----------------------------------------+-----------+-----------+---------------+----------------+--------+------------------+
5 rows in set (0.019 sec)

SELECT* FROM Members WHERE YEAR(membership_date) < 2022;[span_9](start_span)[span_9](end_span)
+-----------+--------------+-----------------+--------------+-----------------+
| member_id | name         | email           | phone_number | membership_date |
+-----------+--------------+-----------------+--------------+-----------------+
|         1 | Rahul Sharma | rahul@gmail.com | 9876543210   | 2021-03-15      |
+-----------+--------------+-----------------+--------------+-----------------+
1 row in set (0.551 sec)


SELECT * FROM Books WHERE category = 'Science' AND price < 500;[span_11](start_span)[span_11](end_span)
+---------+-------+-----------+----------+---------------+----------------+--------+------------------+
| book_id | title | author_id | category | isbn          | published_date | price  | available_copies |
+---------+-------+-----------+----------+---------------+----------------+--------+------------------+
|       3 | 1984  |         3 | Science  | 9780451524935 | 1949-06-08     | 250.00 |                0 |
+---------+-------+-----------+----------+---------------+----------------+--------+------------------+
1 row in set (0.032 sec)


 SELECT * FROM Books WHERE NOT available_copies > 0;[span_14](start_span)[span_14](end_span)[span_15](start_span)[span_15](end_span)
+---------+-------+-----------+----------+---------------+----------------+--------+------------------+
| book_id | title | author_id | category | isbn          | published_date | price  | available_copies |
+---------+-------+-----------+----------+---------------+----------------+--------+------------------+
|       3 | 1984  |         3 | Science  | 9780451524935 | 1949-06-08     | 250.00 |                0 |
+---------+-------+-----------+----------+---------------+----------------+--------+------------------+
1 row in set (0.015 sec)


 SELECT DISTINCT m.* FROM Members m
    -> LEFT JOIN Transactions t ON m.member_id = t.member_id
    -> WHERE YEAR(m.membership_date) > 2020
    ->    OR (SELECT COUNT(*) FROM Transactions WHERE member_id = m.member_id) > 3;[span_18](start_span)[span_18](end_span)[span_19](start_span)[span_19](end_span)
+-----------+--------------+-----------------+--------------+-----------------+
| member_id | name         | email           | phone_number | membership_date |
+-----------+--------------+-----------------+--------------+-----------------+
|         1 | Rahul Sharma | rahul@gmail.com | 9876543210   | 2021-03-15      |
|         2 | Priya Patel  | NULL            | 9123456789   | 2023-01-10      |
+-----------+--------------+-----------------+--------------+-----------------+
2 rows in set (0.551 sec)


SELECT * FROM Books ORDER BY title ASC;[span_21](start_span)[span_21](end_span)
+---------+----------------------------------------+-----------+-----------+---------------+----------------+--------+------------------+
| book_id | title                                  | author_id | category  | isbn          | published_date | price  | available_copies |
+---------+----------------------------------------+-----------+-----------+---------------+----------------+--------+------------------+
|       3 | 1984                                   |         3 | Science   | 9780451524935 | 1949-06-08     | 250.00 |                0 |
|       5 | future tech 2024                       |         1 | Science   | 9781234567890 | 2022-05-10     | 550.00 |                4 |
|       1 | harry potter and the philosopher stone |         1 | Fantasy   | 9780747532699 | 1997-06-26     | 450.00 |                4 |
|       2 | two states                             |         2 | Romance   | 9788129115300 | 2009-10-01     | 300.00 |                2 |
|       4 | wings of fire                          |         4 | Biography | 9788173711466 | 1999-01-01     | 400.00 |                3 |
+---------+----------------------------------------+-----------+-----------+---------------+----------------+--------+------------------+
5 rows in set (0.546 sec)

 SELECT member_id, COUNT(*) AS total_borrowed
    -> FROM Transactions
    -> GROUP BY member_id;[span_23](start_span)[span_23](end_span)
+-----------+----------------+
| member_id | total_borrowed |
+-----------+----------------+
|         1 |              2 |
|         2 |              1 |
+-----------+----------------+
2 rows in set (0.024 sec)


SELECT category, COUNT(*) AS book_count
    -> FROM Books
    -> GROUP BY category;[span_25](start_span)[span_25](end_span)
+-----------+------------+
| category  | book_count |
+-----------+------------+
| Fantasy   |          1 |
| Romance   |          1 |
| Science   |          2 |
| Biography |          1 |
+-----------+------------+
4 rows in set (0.012 sec)

 SELECT category, COUNT(*) FROM Books GROUP BY category;[span_27](start_span)[span_27](end_span)
+-----------+----------+
| category  | COUNT(*) |
+-----------+----------+
| Fantasy   |        1 |
| Romance   |        1 |
| Science   |        2 |
| Biography |        1 |
+-----------+----------+
4 rows in set (0.019 sec)


 SELECT AVG(price) AS average_price FROM Books;[span_29](start_span)[span_29](end_span)
+---------------+
| average_price |
+---------------+
|    390.000000 |
+---------------+
1 row in set (0.007 sec)

 SELECT book_id, COUNT(*) AS borrow_count
    -> FROM Transactions
    -> GROUP BY book_id
    -> ORDER BY borrow_count DESC
    -> LIMIT 1;[span_31](start_span)[span_31](end_span)
+---------+--------------+
| book_id | borrow_count |
+---------+--------------+
|       1 |            1 |
+---------+--------------+
1 row in set (0.009 sec)

    
SELECT SUM(fine_amount) AS total_fines FROM Transactions;[span_33](start_span)[span_33](end_span)
+-------------+
| total_fines |
+-------------+
|       20.00 |
+-------------+
1 row in set (0.010 sec)

    -> ;
 SELECT b.title, a.name AS author_name
    -> FROM Books b
    -> INNER JOIN Authors a ON b.author_id = a.author_id;[span_35](start_span)[span_35](end_span)
+----------------------------------------+------------------------+
| title                                  | author_name            |
+----------------------------------------+------------------------+
| harry potter and the philosopher stone | J.K. Rowling           |
| future tech 2024                       | J.K. Rowling           |
| two states                             | Chetan Bhagat          |
| 1984                                   | George Orwell          |
| wings of fire                          |   A.P.J. Abdul Kalam   |
+----------------------------------------+------------------------+
5 rows in set (0.009 sec)


 SELECT DISTINCT m.*
    -> FROM Members m
    -> LEFT JOIN Transactions t ON m.member_id = t.member_id;[span_37](start_span)[span_37](end_span)
+-----------+--------------+-----------------+--------------+-----------------+
| member_id | name         | email           | phone_number | membership_date |
+-----------+--------------+-----------------+--------------+-----------------+
|         1 | Rahul Sharma | rahul@gmail.com | 9876543210   | 2021-03-15      |
|         2 | Priya Patel  | NULL            | 9123456789   | 2023-01-10      |
+-----------+--------------+-----------------+--------------+-----------------+
2 rows in set (0.011 sec)


 SELECT b.*
    -> FROM Transactions t
    -> RIGHT JOIN Books b ON t.book_id = b.book_id
    -> WHERE t.transaction_id IS NULL;[span_39](start_span)[span_39](end_span)
+---------+------------------+-----------+----------+---------------+----------------+--------+------------------+
| book_id | title            | author_id | category | isbn          | published_date | price  | available_copies |
+---------+------------------+-----------+----------+---------------+----------------+--------+------------------+
|       3 | 1984             |         3 | Science  | 9780451524935 | 1949-06-08     | 250.00 |                0 |
|       5 | future tech 2024 |         1 | Science  | 9781234567890 | 2022-05-10     | 550.00 |                4 |
+---------+------------------+-----------+----------+---------------+----------------+--------+------------------+
2 rows in set (0.028 sec)

    
 SELECT m.name, t.transaction_id
    -> FROM Members m
    -> LEFT JOIN Transactions t ON m.member_id = t.member_id
    -> WHERE t.transaction_id IS NULL
    -> UNION
    -> SELECT m.name, t.transaction_id
    -> FROM Members m
    -> RIGHT JOIN Transactions t ON m.member_id = t.member_id
    -> WHERE m.member_id IS NULL;[span_41](start_span)[span_41](end_span)
Empty set (0.017 sec)

    

 SELECT * FROM Books
    -> WHERE book_id IN (
    ->     SELECT book_id FROM Transactions
    ->     WHERE member_id IN (SELECT member_id FROM Members WHERE YEAR(membership_date) > 2022)
    -> );[span_43](start_span)[span_43](end_span)
+---------+---------------+-----------+-----------+---------------+----------------+--------+------------------+
| book_id | title         | author_id | category  | isbn          | published_date | price  | available_copies |
+---------+---------------+-----------+-----------+---------------+----------------+--------+------------------+
|       4 | wings of fire |         4 | Biography | 9788173711466 | 1999-01-01     | 400.00 |                3 |
+---------+---------------+-----------+-----------+---------------+----------------+--------+------------------+
1 row in set (0.569 sec) 
 SELECT * FROM Books WHERE book_id = (
    ->     SELECT book_id FROM Transactions
    ->     GROUP BY book_id
    ->     ORDER BY COUNT(*) DESC
    ->     LIMIT 1
    -> );[span_45](start_span)[span_45](end_span)
+---------+----------------------------------------+-----------+----------+---------------+----------------+--------+------------------+
| book_id | title                                  | author_id | category | isbn          | published_date | price  | available_copies |
+---------+----------------------------------------+-----------+----------+---------------+----------------+--------+------------------+
|       1 | harry potter and the philosopher stone |         1 | Fantasy  | 9780747532699 | 1997-06-26     | 450.00 |                4 |
+---------+----------------------------------------+-----------+----------+---------------+----------------+--------+------------------+
1 row in set (0.021 sec)

 SELECT * FROM Members
    -> WHERE member_id NOT IN (SELECT DISTINCT member_id FROM Transactions);[span_47](start_span)[span_47](end_span)
Empty set (0.025 sec)


 SELECT YEAR(published_date) AS pub_year, COUNT(*)
    -> FROM Books
    -> GROUP BY YEAR(published_date);[span_49](start_span)[span_49](end_span)
+----------+----------+
| pub_year | COUNT(*) |
+----------+----------+
|     1997 |        1 |
|     2009 |        1 |
|     1949 |        1 |
|     1999 |        1 |
|     2022 |        1 |
+----------+----------+
5 rows in set (0.036 sec)

    -> ;

 SELECT transaction_id, DATEDIFF(return_date, borrow_date) AS days_kept
    -> FROM Transactions;[span_51](start_span)[span_51](end_span)
+----------------+-----------+
| transaction_id | days_kept |
+----------------+-----------+
|              1 |        14 |
|              2 |        15 |
|              3 |        15 |
+----------------+-----------+
3 rows in set (0.525 sec)

 SELECT transaction_id, DATE_FORMAT(borrow_date, '%d-%m-%Y') AS formatted_borrow_date
    -> FROM Transactions;[span_53](start_span)[span_53](end_span)
+----------------+-----------------------+
| transaction_id | formatted_borrow_date |
+----------------+-----------------------+
|              1 | 01-05-2026            |
|              2 | 10-09-2026            |
|              3 | 15-09-2026            |
+----------------+-----------------------+
3 rows in set (0.548 sec)

 SELECT UPPER(title) AS uppercase_title FROM Books;[span_55](start_span)[span_55](end_span)
+----------------------------------------+
| uppercase_title                        |
+----------------------------------------+
| HARRY POTTER AND THE PHILOSOPHER STONE |
| TWO STATES                             |
| 1984                                   |
| WINGS OF FIRE                          |
| FUTURE TECH 2024                       |
+----------------------------------------+
5 rows in set (0.543 sec)

    
 SELECT TRIM(name) AS clean_author_name FROM Authors;[span_57](start_span)[span_57](end_span)
+--------------------+
| clean_author_name  |
+--------------------+
| J.K. Rowling       |
| Chetan Bhagat      |
| George Orwell      |
| A.P.J. Abdul Kalam |
+--------------------+
4 rows in set (0.533 sec)

 SELECT COALESCE(email, 'Not Provided') AS member_email FROM Members;[span_59](start_span)[span_59](end_span)
+-----------------+
| member_email    |
+-----------------+
| rahul@gmail.com |
| Not Provided    |
+-----------------+
2 rows in set (0.541 sec)

 SELECT book_id, COUNT(*) AS borrow_count,
    ->        RANK() OVER (ORDER BY COUNT(*) DESC) as book_rank
    -> FROM Transactions
    -> GROUP BY book_id;[span_61](start_span)[span_61](end_span)
+---------+--------------+-----------+
| book_id | borrow_count | book_rank |
+---------+--------------+-----------+
|       1 |            1 |         1 |
|       2 |            1 |         1 |
|       4 |            1 |         1 |
+---------+--------------+-----------+
3 rows in set (0.552 sec)

    

 SELECT member_id, borrow_date,
    ->        ROW_NUMBER() OVER (PARTITION BY member_id ORDER BY borrow_date) AS cumulative_books
    -> FROM Transactions;[span_63](start_span)[span_63](end_span)
+-----------+-------------+------------------+
| member_id | borrow_date | cumulative_books |
+-----------+-------------+------------------+
|         1 | 2026-05-01  |                1 |
|         1 | 2026-09-10  |                2 |
|         2 | 2026-09-15  |                1 |
+-----------+-------------+------------------+
3 rows in set (0.021 sec)

    
 
 SELECT borrow_date,
    ->        AVG(transaction_id) OVER (ORDER BY borrow_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg
    -> FROM Transactions;[span_65](start_span)[span_65](end_span)
+-------------+------------+
| borrow_date | moving_avg |
+-------------+------------+
| 2026-05-01  |     1.0000 |
| 2026-09-10  |     1.5000 |
| 2026-09-15  |     2.0000 |
+-------------+------------+
3 rows in set (0.563 sec)

    
SELECT member_id, name,
    ->        CASE
    ->            WHEN membership_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH) THEN 'Active'
    ->            ELSE 'Inactive'
    ->        END AS Membership_Status
    -> FROM Members;[span_67](start_span)[span_67](end_span)
+-----------+--------------+-------------------+
| member_id | name         | Membership_Status |
+-----------+--------------+-------------------+
|         1 | Rahul Sharma | Inactive          |
|         2 | Priya Patel  | Inactive          |
+-----------+--------------+-------------------+
2 rows in set (0.006 sec)

    
