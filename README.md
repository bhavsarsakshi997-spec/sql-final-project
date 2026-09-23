# 🎓 University Course Management System

<p align="center">

### PostgreSQL Database Management Project

A complete relational database project for managing university students, courses, instructors, departments, and enrollments.

</p>

---

## 📌 Project Overview

The **University Course Management System** is a PostgreSQL-based relational database project designed to manage important academic information in a structured and efficient way.

This project demonstrates practical SQL concepts such as:

- Database and table creation
- Primary Keys
- Foreign Keys
- CRUD Operations
- Filtering
- Sorting
- Grouping
- Aggregate Functions
- INNER JOIN
- LEFT JOIN
- Subqueries
- Date Functions
- String Functions
- CASE Expressions
- Window Functions

---

## 🗄️ Database Tables

The project contains **5 main tables**:

| Table | Description |
|---|---|
| `Departments` | Stores university department information |
| `Students` | Stores student details |
| `Courses` | Stores course information |
| `Instructors` | Stores instructor details |
| `Enrollments` | Connects students with courses |

---

## 🔗 Database Relationships

```text
Departments
    │
    ├────────── Courses
    │              │
    │              │
    └──────── Instructors
                  

Students
    │
    │
    └──────── Enrollments ──────── Courses
