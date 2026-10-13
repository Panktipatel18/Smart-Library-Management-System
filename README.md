[README (4).md](https://github.com/user-attachments/files/33392309/README.4.md)
# 🎟️ Smart Event Management System

A MySQL database project for managing events, venues, organizers, attendees, ticket bookings, and payments.

---

## 📌 Project Overview

The **Smart Event Management System** is a database project developed using **MySQL** to manage events, venues, organizers, attendees, ticket bookings, and payments.

The database helps organize event information in one place, track seat availability for each event, and analyze payment and booking records using SQL queries. I built this project while learning SQL to practice database design, table relationships, and data analysis.

---

## 🎯 Project Objectives

- Store and manage event details.
- Maintain venue and organizer information.
- Register attendees and manage ticket bookings.
- Track payment amounts and payment statuses.
- Analyze event revenue and ticket demand.
- Retrieve useful information using SQL queries.

---

## 🛠️ Technologies Used

| Technology | Purpose |
|------------|---------|
| **MySQL** | Relational database management system |
| **SQL** | Creating tables, inserting data, and querying records |
| **MySQL Command Line Client** | Running SQL statements and viewing results |

---

## 🗂️ Database Structure

The database `smart_event_db` contains six tables:

| Table Name | Description |
|------------|-------------|
| **Venues** | Stores venue names, locations, and capacities. |
| **Organizers** | Stores organizer details and contact information. |
| **Events** | Stores event dates, prices, seat availability, and related IDs. |
| **Attendees** | Stores attendee names and contact details. |
| **Tickets** | Stores ticket bookings and booking statuses. |
| **Payments** | Stores payment amounts, statuses, and dates. |

### 🔗 Table Relationships

In simple terms, the tables are connected like this:

- One **venue** can host many **events**.
- One **organizer** can manage many **events**.
- One **event** can have many **tickets**.
- One **attendee** can book many **tickets**.
- Each **ticket** can have a related **payment** record.

| Child Table | Foreign Key | References |
|-------------|-------------|------------|
| Events | `venue_id` | Venues (`venue_id`) |
| Events | `organizer_id` | Organizers (`organizer_id`) |
| Tickets | `event_id` | Events (`event_id`) |
| Tickets | `attendee_id` | Attendees (`attendee_id`) |
| Payments | `ticket_id` | Tickets (`ticket_id`) |

### 🔑 Constraints Used

- **Primary keys:** Each table has its own ID column (for example, `event_id`) that uniquely identifies every record.
- **Auto-increment IDs:** Primary key values are generated automatically by MySQL.
- **Foreign keys:** Link related tables so that data stays consistent.
- **Unique constraints:** Used on email addresses so the same email is not stored twice.
- **CHECK constraints:** Used to keep values valid, such as positive venue capacity, non-negative ticket prices, and allowed status values.

---

## ✨ Key Features

- Database and table creation.
- Sample data insertion.
- Event search and filtering.
- Updating event ticket prices.
- Deleting selected ticket records.
- Date and time calculations.
- Attendee and organizer information retrieval.
- Ticket booking counts.
- Revenue calculations and ranking.
- Payment status analysis.
- Event demand classification.
- Joins, subqueries, aggregate functions, and window functions.

---

## 🧠 SQL Concepts Practiced

- **DDL:** `CREATE`, `ALTER` where applicable, and `DROP`.
- **DML:** `INSERT`, `UPDATE`, and `DELETE`.
- **DQL:** `SELECT`.
- **Filtering:** `WHERE`, `LIKE`, `AND`, `OR`, and `NOT`.
- **Sorting and grouping:** `ORDER BY`, `GROUP BY`, and `HAVING`.
- **Aggregate functions:** `COUNT()`, `SUM()`, and `AVG()`.
- **Joins:** `INNER JOIN`, `LEFT JOIN`, and `RIGHT JOIN`.
- **Subqueries.**
- **Date and time functions:** `MONTH()`, `DATEDIFF()`, `CURDATE()`, and `DATE_FORMAT()`.
- **String functions:** `UPPER()`, `TRIM()`, and `IFNULL()`.
- **Window functions:** `RANK()`, `SUM() OVER()`, and `COUNT() OVER()`.
- **Conditional expressions:** `CASE`.

---

## 🚀 How to Run the Project

1. Install and open **MySQL**.
2. Open **MySQL Command Line Client** or a MySQL editor.
3. Create the database:

   ```sql
   CREATE DATABASE IF NOT EXISTS smart_event_db;
   ```

4. Select the database:

   ```sql
   USE smart_event_db;
   ```

5. Create the six tables in the correct order.
6. Insert the sample data.
7. Execute the analysis queries one by one.
8. Review the results returned by MySQL.

> ⚠️ **Important:** Tables that are referenced by foreign keys must be created first. The recommended order is: `Venues` → `Organizers` → `Events` → `Attendees` → `Tickets` → `Payments`.

---

## 💻 Example SQL Queries

> 📝 The examples below use the table and column names from this project's design. If your SQL file uses slightly different names, adjust them accordingly.

### 1️⃣ Display all events

```sql
SELECT * FROM Events;
```

### 2️⃣ Find events with a particular name using `LIKE`

```sql
SELECT event_id, event_name, event_date
FROM Events
WHERE event_name LIKE '%Music%';
```

### 3️⃣ Display events with venue names using a join

```sql
SELECT e.event_name,
       v.venue_name,
       v.location,
       e.event_date
FROM Events e
INNER JOIN Venues v
        ON e.venue_id = v.venue_id
ORDER BY e.event_date;
```

### 4️⃣ Calculate total payment amounts

```sql
SELECT SUM(amount) AS total_recorded_payments
FROM Payments;
```

### 5️⃣ Rank events by recorded payment revenue

```sql
SELECT e.event_name,
       SUM(p.amount) AS total_revenue,
       RANK() OVER (ORDER BY SUM(p.amount) DESC) AS revenue_rank
FROM Events e
INNER JOIN Tickets t
        ON e.event_id = t.event_id
INNER JOIN Payments p
        ON t.ticket_id = p.ticket_id
GROUP BY e.event_id, e.event_name;
```

### 6️⃣ Categorize events according to available seats

```sql
SELECT event_name,
       available_seats,
       CASE
           WHEN available_seats = 0   THEN 'Sold Out'
           WHEN available_seats <= 50 THEN 'High Demand'
           ELSE 'Seats Available'
       END AS demand_status
FROM Events;
```

---

## 📊 Sample Results

Running the project's queries can produce results such as:

- Total number of venues.
- Number of ticket bookings per event.
- Recorded payment totals.
- Upcoming event dates.
- Attendee booking information.
- Payment status summaries.

The exact output depends on the sample data inserted into the database.

---

## 📁 Project Structure

Recommended folder structure:

```text
Smart-Event-Management-System/
│
├── smart_event_management.sql
└── README.md
```

The `smart_event_management.sql` file should contain the database creation statements, table definitions, sample records, and project queries.

---

## 🔮 Future Improvements

- Add a stored procedure for ticket booking.
- Automatically update available seats after bookings.
- Prevent bookings when no seats remain.
- Improve payment validation.
- Add triggers for ticket and seat management.
- Build a simple web interface for event registration and booking.

---

## 🎓 Learning Outcomes

This project gave me practical experience in:

- Relational database design
- Table relationships using primary and foreign keys
- Data manipulation with `INSERT`, `UPDATE`, and `DELETE`
- SQL querying with joins, subqueries, and window functions
- Revenue analysis
- Reporting from stored data

---

## 👩‍💻 Author

**Pankti Patel**

This project demonstrates my practical SQL and database-management skills, and my interest in building well-structured, data-driven solutions.

---

## ⭐ Support

If you found this project helpful or interesting, please consider giving it a **star** on GitHub. It helps the project reach more learners and motivates me to keep building and improving.

---

## 🙏 Thank You

Thank you for taking the time to explore the **Smart Event Management System**. I hope it is useful for anyone learning SQL and database design. Feedback and suggestions are always welcome!

---

## 📄 License

This project can optionally be shared under the **MIT License**. If you choose to publish it under this license, add a file named `LICENSE` containing the MIT License text to the repository.
