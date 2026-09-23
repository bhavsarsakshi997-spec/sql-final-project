# 🎓 University Course Management System

> A professional SQL database project with a **live browser-based project preview**, relational database design, sample data, CRUD operations, joins, subqueries, aggregation, date functions, CASE expressions and window functions.

---

## 🚀 Live Project Preview

This project includes a standalone `index.html` file.

Open `index.html` in any browser to see an interactive database-style interface:

- 📁 Departments
- 👨‍🎓 Students
- 📚 Courses
- 👨‍🏫 Instructors
- 📝 Enrollments

Click a table from the **left sidebar** and its data appears on the **right side**.

The **Table Data / SQL Code** tabs let you switch between the displayed records and the related SQL.

🚀 Open Live Project

👉 Open University Course Management System Live Project

> Important: GitHub README files do not execute arbitrary HTML/JavaScript. The live UI is therefore provided as `index.html`. It can be opened locally or published with GitHub Pages.

---

## 📂 Project Structure

```text
University_Course_Management_Live_Project/
│
├── README.md
├── index.html
└── university_course_management.sql
```

### File Purpose

| File | Purpose |
|---|---|
| `README.md` | Complete project documentation |
| `index.html` | Interactive live project preview |
| `university_course_management.sql` | Complete database schema, data and 16 SQL questions |

---

## 🎯 Project Objective

The University Course Management System is designed to manage academic information in a structured relational database.

The system stores:

- Departments
- Students
- Courses
- Instructors
- Enrollments

It demonstrates how multiple related tables can work together using **Primary Keys, Foreign Keys, JOINs, GROUP BY, HAVING, Subqueries, Aggregate Functions, Date Functions, CASE Expressions and Window Functions**.

---

## 🗄️ Database Architecture

```text
Departments
    │
    ├───────────────┐
    │               │
    ▼               ▼
 Courses       Instructors
    │
    ▼
Enrollments
    ▲
    │
 Students
```

### Relationships

- One department can have many courses.
- One department can have many instructors.
- One course can have many enrollment records.
- One student can have many enrollment records.
- `Enrollments` connects students and courses.

---

## 🧱 Database Tables

### 1. Departments

Stores department information.

| Column | Description |
|---|---|
| DepartmentID | Primary key |
| DepartmentName | Department name |

### 2. Students

Stores student personal and enrollment information.

| Column | Description |
|---|---|
| StudentID | Primary key |
| FirstName | Student first name |
| LastName | Student last name |
| Email | Unique email |
| DateOfBirth | Date of birth |
| EnrollmentDate | University enrollment date |

### 3. Courses

Stores course information.

| Column | Description |
|---|---|
| CourseID | Primary key |
| CourseName | Course name |
| DepartmentID | Foreign key |
| Credits | Course credits |

### 4. Instructors

Stores instructor information.

| Column | Description |
|---|---|
| InstructorID | Primary key |
| FirstName | Instructor first name |
| LastName | Instructor last name |
| Email | Unique email |
| DepartmentID | Foreign key |
| Salary | Instructor salary |

### 5. Enrollments

Stores student-course enrollment relationships.

| Column | Description |
|---|---|
| EnrollmentID | Primary key |
| StudentID | Foreign key |
| CourseID | Foreign key |
| EnrollmentDate | Enrollment date |

---

# 🛠️ Technologies Used

- SQL
- PostgreSQL-compatible SQL syntax
- HTML5
- CSS3
- JavaScript
- Relational Database Concepts

---

# ⚙️ How to Run the SQL Project

## Step 1 — Open PostgreSQL

Open PostgreSQL / pgAdmin.

## Step 2 — Create or select a database

Create a database such as:

```sql
CREATE DATABASE university_db;
```

Connect to `university_db`.

## Step 3 — Run the SQL file

Open:

```text
university_course_management.sql
```

Run the complete script.

The script creates all five tables, inserts sample data and contains all 16 questions.

---

# 🌐 How to Run the Live Project

No installation is required for the frontend preview.

### Method 1 — Direct Browser

Double-click:

```text
index.html
```

It will open in your browser.

### Method 2 — VS Code

1. Open the project folder in VS Code.
2. Open `index.html`.
3. Use a browser / Live Server to preview it.
4. Click the table names on the left.
5. View the table data on the right.

---

# 📊 Interactive Features

### Left Sidebar

The sidebar contains all database tables:

```text
Departments
Students
Courses
Instructors
Enrollments
```

### Table Data

Selecting a table displays its sample records.

### SQL Code

The SQL Code tab shows the query associated with the selected table.

### Responsive Design

The interface is designed to work on desktop and smaller screens.

---

# 📝 SQL Questions Covered

## Q1 — CRUD Operations

Demonstrates:

- INSERT
- SELECT
- UPDATE
- DELETE

## Q2 — Students enrolled after 2022

Uses:

- WHERE
- Date filtering

## Q3 — Mathematics courses, limit 5

Uses:

- INNER JOIN
- WHERE
- LIMIT

## Q4 — Courses with more than 5 students

Uses:

- JOIN
- COUNT
- GROUP BY
- HAVING

## Q5 — Students in both courses

Uses:

- INNER JOIN
- GROUP BY
- HAVING
- COUNT(DISTINCT)

## Q6 — Students in either course

Uses:

- INNER JOIN
- IN
- DISTINCT

## Q7 — Average course credits

Uses:

- AVG()

## Q8 — Maximum instructor salary

Uses:

- MAX()
- INNER JOIN
- WHERE

## Q9 — Students in each department

Uses:

- LEFT JOIN
- COUNT
- GROUP BY
- ORDER BY

## Q10 — INNER JOIN students and courses

Demonstrates relational matching between students, enrollments and courses.

## Q11 — LEFT JOIN students and courses

Demonstrates how all students can be displayed even when matching course information is unavailable.

## Q12 — Students in courses with more than 10 students

Uses nested subqueries.

## Q13 — Extract enrollment year

Uses:

```sql
EXTRACT(YEAR FROM EnrollmentDate)
```

## Q14 — Concatenate instructor name

Uses:

```sql
CONCAT(FirstName, ' ', LastName)
```

## Q15 — Running total

Uses a window function:

```sql
COUNT(*) OVER (...)
```

## Q16 — Senior or Junior students

Uses:

```sql
CASE
    WHEN ...
    THEN 'Senior'
    ELSE 'Junior'
END
```

---

# 🔐 Database Constraints

The project demonstrates important relational constraints.

### PRIMARY KEY

Uniquely identifies each record.

### FOREIGN KEY

Connects related tables.

### UNIQUE

Prevents duplicate email addresses.

### NOT NULL

Ensures required values are provided.

---

# 🔄 CRUD Operations

CRUD stands for:

| Operation | SQL |
|---|---|
| Create | INSERT |
| Read | SELECT |
| Update | UPDATE |
| Delete | DELETE |

The project demonstrates all four operations in Q1.

---

# 🔗 JOIN Concepts

The project demonstrates:

### INNER JOIN

Returns matching records from related tables.

### LEFT JOIN

Returns all records from the left table and matching records from the right table.

Multiple JOINs are used to connect:

```text
Students → Enrollments → Courses → Departments
```

---

# 📈 Aggregate Functions

The project uses:

```text
COUNT()
AVG()
MAX()
```

These functions are useful for calculating summaries from database records.

---

# 🔍 Filtering and Grouping

The project demonstrates:

```text
WHERE
GROUP BY
HAVING
ORDER BY
LIMIT
DISTINCT
IN
```

These clauses help filter, group and organize query results.

---

# 🧠 Advanced SQL

The project also includes:

- Nested Subqueries
- Date Functions
- String Functions
- CASE Expressions
- Window Functions
- Running Totals
- Multiple Table JOINs

---

# 💡 Key Learning Outcomes

After completing this project, you can understand:

1. How relational databases are structured.
2. How primary and foreign keys connect tables.
3. How student and course relationships are managed.
4. How JOINs combine information from multiple tables.
5. How aggregate functions calculate summaries.
6. How GROUP BY and HAVING work together.
7. How subqueries solve multi-step problems.
8. How dates can be extracted and compared.
9. How CASE creates conditional output.
10. How window functions create running calculations.

---

# ✅ Advantages

- Structured relational database design
- Clear table relationships
- Demonstrates real-world university data
- Covers beginner to advanced SQL concepts
- Includes CRUD operations
- Includes JOIN and subquery examples
- Includes an interactive browser preview
- Easy to understand and demonstrate

---

# ⚠️ Limitations

- Sample data is limited.
- The HTML preview displays static demonstration data.
- The browser interface is not directly connected to PostgreSQL.
- Authentication and user roles are not implemented.
- No backend API is included.

---

# 🔮 Future Enhancements

The project can be extended with:

- Student login
- Instructor login
- Course registration interface
- Search and filtering
- Real-time PostgreSQL connection
- Backend API
- Admin dashboard
- Attendance management
- Grades and examination management
- REST API integration
- Authentication and authorization

---

# 🎓 Conclusion

The **University Course Management System** demonstrates the practical use of SQL for managing academic information.

The project combines database design, relationships, CRUD operations, JOINs, aggregation, filtering, subqueries, date functions, conditional logic and window functions into one complete academic project.

The included interactive `index.html` provides a professional way to present the database structure and sample records during a project demonstration.

---

## 📌 Project Files

- `README.md` — Project documentation
- `university_course_management.sql` — Complete SQL project
- `index.html` — Interactive live project preview
