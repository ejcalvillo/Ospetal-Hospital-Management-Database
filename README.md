# 🏥 Ospetal Hospital Management Database

The **Ospetal Hospital Management System** is a **MySQL-based database** designed to manage core hospital operations, including **patients**, **employees**, **departments**, **appointments**, and **services**.

This project is intended for educational and development purposes, featuring a full schema, sample data, and relational design.

---

## 📊 Tables & Descriptions

| Table        | Description                                                                 |
|--------------|-----------------------------------------------------------------------------|
| **patients** | Stores personal information of hospital patients.                           |
| **departments** | Contains the list of medical departments in the hospital.               |
| **Employees** | Holds details about hospital staff and the departments they work in.       |
| **appointments** | Tracks medical appointments between employees and patients.            |
| **Services** | Logs services provided during appointments, including cost and quantity.    |

---

## 🔗 Schema Relationships (ERD Style)
patients ⟷ appointments ⟷ employees ⟷ departments

appointments ⟷ services

## ✨ Features

- Normalized relational structure using **foreign keys**
- Sample data for all tables to support testing
- Supports basic queries like:
  - Patient history
  - Appointment schedules
  - Department-wise staff listings
  - Billing summaries via services rendered

---

## 👨‍💻 Authors

- **Emir J. Calvillo** 
- **Alexander Hernandez-Carney**
- **Sneha Karki**

## 📝 License

This project is provided for educational and demonstration purposes. No license is associated.
