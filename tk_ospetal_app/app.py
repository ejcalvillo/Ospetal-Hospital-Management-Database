import tkinter as tk
from tkinter import ttk, messagebox
import mysql.connector
from config import DB_CONFIG

class App:
    def __init__(self, root):
        # --- DB Connection ---
        self.conn = mysql.connector.connect(**DB_CONFIG)
        self.cur  = self.conn.cursor(dictionary=True)

        # --- Main Window ---
        root.title("OSP ETAL Clinic")
        root.geometry("600x400")

        # --- Patient Selector ---
        ttk.Label(root, text="Patient:").grid(row=0, column=0, sticky="w")
        self.patients_cb = ttk.Combobox(root, state="readonly")
        self.patients_cb.grid(row=0, column=1, sticky="ew")
        self.load_patients()

        # --- Diagnosis Entry ---
        ttk.Label(root, text="Diagnosis:").grid(row=1, column=0, sticky="w")
        self.diagnosis_entry = ttk.Entry(root)
        self.diagnosis_entry.grid(row=1, column=1, sticky="ew")

        # --- Book Appointment Button ---
        ttk.Button(root, text="Book Appointment", command=self.book_appointment)\
            .grid(row=2, column=0, columnspan=2, pady=5)

        # --- Services List ---
        ttk.Label(root, text="Add Service:").grid(row=3, column=0, sticky="w")
        self.services_cb = ttk.Combobox(root, state="readonly")
        self.services_cb.grid(row=3, column=1, sticky="ew")
        self.load_services()

        ttk.Label(root, text="Qty:").grid(row=4, column=0, sticky="w")
        self.qty_spin = ttk.Spinbox(root, from_=1, to=10, width=5)
        self.qty_spin.grid(row=4, column=1, sticky="w")

        ttk.Button(root, text="Add Service", command=self.add_service)\
            .grid(row=5, column=0, columnspan=2, pady=5)

        # --- Invoice Display ---
        ttk.Label(root, text="Invoice Total:").grid(row=6, column=0, sticky="w")
        self.total_var = tk.StringVar(value="0.00")
        ttk.Label(root, textvariable=self.total_var).grid(row=6, column=1, sticky="w")

        # store last appointment_id for adding services
        self.current_appointment_id = None

    def load_patients(self):
        self.cur.execute("SELECT patient_id, first_name, last_name FROM patients")
        rows = self.cur.fetchall()
        self.patients = {f"{r['first_name']} {r['last_name']}": r['patient_id'] for r in rows}
        self.patients_cb['values'] = list(self.patients.keys())

    def load_services(self):
        self.cur.execute("SELECT Service_Code, Service_description FROM Services")
        rows = self.cur.fetchall()
        self.services = {r['Service_description']: r['Service_Code'] for r in rows}
        self.services_cb['values'] = list(self.services.keys())

    def book_appointment(self):
        pat_name = self.patients_cb.get()
        diag     = self.diagnosis_entry.get().strip()
        if not pat_name or not diag:
            return messagebox.showerror("Error", "Select patient and enter diagnosis")
        pid = self.patients[pat_name]
        sql = ("INSERT INTO appointment (employee_id, patient_id, diagnosis, time, date) "
               "VALUES (%s, %s, %s, CURTIME(), CURDATE())")
        # here you could replace 101 with a real logged-in employee id
        self.cur.execute(sql, (101, pid, diag))
        self.conn.commit()
        self.current_appointment_id = self.cur.lastrowid
        messagebox.showinfo("OK", f"Appt #{self.current_appointment_id} booked for {pat_name}")
        self.update_total()

    def add_service(self):
        if not self.current_appointment_id:
            return messagebox.showerror("Error", "Book an appointment first")
        svc_name = self.services_cb.get()
        qty      = int(self.qty_spin.get())
        scode    = self.services.get(svc_name)
        sql = "INSERT INTO AppointmentServices (Appointment_ID, Service_Code, Service_Quantity) VALUES (%s,%s,%s)"
        self.cur.execute(sql, (self.current_appointment_id, scode, qty))
        self.conn.commit()
        messagebox.showinfo("OK", f"Added {qty}×{svc_name}")
        self.update_total()

    def update_total(self):
        sql = """
        SELECT SUM(asvc.Service_Quantity * sc.Service_Unit_Cost) AS total
        FROM AppointmentServices asvc
        JOIN ServiceCatalogs sc ON asvc.Service_Code = sc.Service_Code
        WHERE asvc.Appointment_ID = %s
        """
        self.cur.execute(sql, (self.current_appointment_id,))
        total = self.cur.fetchone()['total'] or 0
        self.total_var.set(f"{total:.2f}")

if __name__ == "__main__":
    root = tk.Tk()
    app = App(root)
    root.mainloop()
