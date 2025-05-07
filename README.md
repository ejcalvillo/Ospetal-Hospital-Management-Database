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



# 🏥 OSPETAL: Hospital Appointment & Invoice Management GUI

## 📋 Overview

**OSPETAL** is a desktop application built with Python and MySQL that allows users to:

- Manage patients and their appointments  
- Add and update diagnoses  
- Record and bill medical services  
- Generate and export PDF invoices  

## 💻 Technologies Used

- Python 3  
- Tkinter (GUI)  
- MySQL  
- `mysql-connector-python`  
- `reportlab` (for PDF generation)  

---

## 🚀 Getting Started

### 1. 🧾 Clone the Repository

```bash
git clone https://github.com/yourusername/ospetal.git
cd ospetal
```
### 2. 🏥 Set Up the Database

- Open **MySQL Workbench** or your preferred SQL client.
- Run the provided `ospetal_schema.sql` to create the database and tables.
- Insert test data or start with an empty system.

---

### 3. 🔧 Configure Database Access

Edit the `config.py` file with your MySQL credentials:

```python
DB_CONFIG = {
    'user': 'root',
    'password': 'yourpassword',
    'host': '127.0.0.1',
    'database': 'ospetal'
}
```

### 4. 📦 Install Dependencies

Install the required Python packages using pip:

```bash
pip install mysql-connector-python reportlab tk tkcalendar
```

### 5. ▶️ Run the App

```bash
python app.py
```

## 🧠 FEATURES
### 👩‍⚕️ Patient Management

- Select patients from a dropdown  
- Add new patients via a form (first name, last name, birthdate, address)  

### 📅 Appointments

- Book new appointments with date & time  
- Leave diagnosis blank if unknown  
- View all previous appointments for the selected patient  
- Update diagnosis at any time  


### 🧾 Services

- Add services (e.g., "X-ray", "Consultation") to appointments  
- Specify unit cost and quantity  
- Automatically calculates running total  


### 📄 Invoice

- Generate invoice for any appointment  
- Creates a professionally formatted PDF  
- Auto-opens in the default viewer on all platforms  

### 📌 Tips

- Add patients before trying to book appointments.  
- Diagnosis is optional when first creating an appointment.  
- Use the "Update Diagnosis" box below the appointments table to edit existing entries.  

### 🛠 Future Improvements

- Add employee login system  
- Filter appointments by date or keyword  
- Add invoice payment status (Paid / Unpaid)  
- Export patient data as CSV  

## 👨‍💻 Authors

- **Emir J. Calvillo** 
- **Alexander Hernandez-Carney**
- **Sneha Karki**
- **Roman Rendon**

## 📝 License

This project is provided for educational and demonstration purposes. No license is associated.

OSPETAL: Hospital Appointment & Invoice Management GUI
