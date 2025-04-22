import tkinter as tk
from tkinter import ttk, messagebox
from tkcalendar import DateEntry
import mysql.connector
from config import DB_CONFIG

class App:
    def __init__(self, root):
        # --- DB Connection ---
        self.conn = mysql.connector.connect(**DB_CONFIG)
        self.cur  = self.conn.cursor(dictionary=True)

        # --- Main Window ---
        root.title("OSPETAL")
        root.geometry("600x400")

        # --- Patient Selector ---
        ttk.Label(root, text="Patient:").grid(row=0, column=0, sticky="w")
        self.patients_cb = ttk.Combobox(root, state="readonly")
        self.patients_cb.grid(row=0, column=1, sticky="ew")
        self.load_patients()

        # --- Book Appointment Button ---
        ttk.Button(root, text="Book Appointment", command=self.book_appointment)\
            .grid(row=4, column=0, columnspan=2, pady=5)

        # --- Appointment Date ---
        ttk.Label(root, text="Date (YYYY-MM-DD):").grid(row=2, column=0, sticky="w")
        self.date_entry = ttk.Entry(root)
        self.date_entry.grid(row=2, column=1, sticky="ew")

        #-- Reason for being seen --
        ttk.Label(root, text="Reason for being seen:").grid(row=1, column=0, sticky="w")
        self.diagnosis_entry = ttk.Entry(root)
        self.diagnosis_entry.grid(row=1, column=1, sticky="ew")

        # --- Appointment Time ---
        ttk.Label(root, text="Time (HH:MM AM/PM):").grid(row=3, column=0, sticky="w")
        self.time_entry = ttk.Entry(root)
        self.time_entry.grid(row=3, column=1, sticky="ew")

        # --- Services List ---
        ttk.Label(root, text="Add Service:").grid(row=7, column=0, sticky="w")
        self.service_desc = tk.Text(root, height=4, width=40)
        self.service_desc.grid(row=7, column=1, sticky="ew")

        # --- Adding Services Cost ---
        ttk.Label(root, text="Unit Cost:").grid(row=8, column=0, sticky="w")
        self.unit_cost_entry = ttk.Entry(root)
        self.unit_cost_entry.grid(row=8, column=1, sticky="ew")

        # --- Quantity Spinbox --- 
        ttk.Label(root, text="Quantity:").grid(row=9, column=0, sticky="w")
        self.qty_spin = tk.Spinbox(root, from_=1, to=10, width=5)
        self.qty_spin.grid(row=9, column=1, sticky="ew")

        ttk.Button(root, text="Add Service", command=self.add_service)\
            .grid(row=10, column=0, columnspan=2, pady=5)

        # --- Invoice Display ---
        ttk.Label(root, text="Invoice Total:").grid(row=11, column=0, sticky="w")
        self.total_var = tk.StringVar(value="0.00")
        ttk.Label(root, textvariable=self.total_var).grid(row=11, column=1, sticky="w")

        # --- Appointments Treeview ---
        ttk.Label(root, text="Appointments:").grid(row=5, column=0, sticky="w")
        self.appt_tree = ttk.Treeview(root, columns=("appt_id", "diagnosis", "time", "date"), show="headings", height=5)
        for col in ("appt_id", "diagnosis", "time", "date"):
            self.appt_tree.heading(col, text=col.capitalize())
            self.appt_tree.column(col, width=100)
        self.appt_tree.grid(row=6, column=0, columnspan=2, sticky="nsew")
        
        
        #-- Binding selection for an appointment --
        self.appt_tree.bind("<<TreeviewSelect>>", self.select_appointment)

        #-- Binding to get appointments for selected patient --
        self.patients_cb.bind("<<ComboboxSelected>>", self.load_appointments_for_patient)



        # --- Edit Diagnosis Entry ---
        ttk.Label(root, text="New Diagnosis:").grid(row=12, column=0, sticky="w")
        self.edit_diag_entry = ttk.Entry(root)
        self.edit_diag_entry.grid(row=12, column=1, sticky="ew")

        ttk.Button(root, text="Update Diagnosis", command=self.update_diagnosis)\
            .grid(row=13, column=0, columnspan=2, pady=5)



    def load_patients(self):
        self.cur.execute("SELECT patient_id, first_name, last_name FROM patients")
        rows = self.cur.fetchall()
        self.patients = {f"{r['first_name']} {r['last_name']} (Patient ID: {r['patient_id']})": r['patient_id'] for r in rows}
        self.patients_cb['values'] = list(self.patients.keys())

    def load_services(self):
        self.cur.execute("SELECT Service_ID, Description FROM Services")
        rows = self.cur.fetchall()
        self.services = {r['Description']: r['Service_ID'] for r in rows}
        self.services_cb['values'] = list(self.services.keys())

    #--- load appointments for selected patient ---
    def load_appointments_for_patient(self, event=None):
        patient_name = self.patients_cb.get()
        if not patient_name:
            return
        pid = self.patients[patient_name]
        self.cur.execute("""
            SELECT appointment_id, diagnosis, time, date
            FROM appointments
            WHERE patient_id = %s
            ORDER BY date DESC, time DESC
        """, (pid,))
        rows = self.cur.fetchall()

        # Clear previous entries
        for item in self.appt_tree.get_children():
            self.appt_tree.delete(item)

        # Insert new ones
        for row in rows:
            self.appt_tree.insert("", "end", values=(row['appointment_id'], row['diagnosis'], row['time'], row['date']))


    def book_appointment(self):
        patient_name = self.patients_cb.get()
        diag = self.diagnosis_entry.get().strip() or None
        date = self.date_entry.get().strip()
        time = self.time_entry.get().strip()

        if not patient_name or not date or not time:
            return messagebox.showerror("Error", "Fill out all fields: patient, diagnosis, date, and time")

        pid = self.patients[patient_name]
        sql = ("INSERT INTO appointments (employee_id, patient_id, diagnosis, time, date) "
            "VALUES (%s, %s, %s, %s, %s)")
        try:
            self.cur.execute(sql, (101, pid, diag, time, date))
            self.conn.commit()
        except mysql.connector.Error as err:
            return messagebox.showerror("SQL Error", f"Error: {err}")

        self.current_appointment_id = self.cur.lastrowid
        messagebox.showinfo("OK", f"Appointment #{self.current_appointment_id} booked for {patient_name}")
        self.update_total()
        self.load_appointments_for_patient()  # Refresh appointment list


    def add_service(self):
        if not self.current_appointment_id:
            return messagebox.showerror("Error", "Book an appointment first")

        desc = self.service_desc.get("1.0", "end").strip()
        try:
            unit_cost = float(self.unit_cost_entry.get())
            qty = int(self.qty_spin.get())
        except ValueError:
            return messagebox.showerror("Error", "Enter valid numbers for cost and quantity.")

        if not desc:
            return messagebox.showerror("Error", "Service description is required")

        sql = "INSERT INTO Services (appointment_ID, Description, UnitCost, Quantity) VALUES (%s,%s,%s,%s)"
        self.cur.execute(sql, (self.current_appointment_id, desc, unit_cost, qty))
        self.conn.commit()

        messagebox.showinfo("OK", "Service added successfully")
        self.update_total()


    def update_total(self):
        self.cur.callproc('sp_CalcAppointmentCost', (self.current_appointment_id,))
    
        total = 0.0
        for result in self.cur.stored_results():
            row = result.fetchone()
            if row and 'TotalCost' in row:
                total = row['TotalCost']

        
        self.total_var.set(f"{total:.2f}")


    # -- update diagnosis for selected appointment --
    def update_diagnosis(self):
        selected = self.appt_tree.selection()
        if not selected:
            return messagebox.showerror("Error", "Select an appointment to update")

        new_diag = self.edit_diag_entry.get().strip()
        if not new_diag:
            return messagebox.showerror("Error", "Enter a new diagnosis")

        appt_id = self.appt_tree.item(selected[0])["values"][0]

        self.cur.execute("UPDATE appointments SET diagnosis = %s WHERE appointment_id = %s", (new_diag, appt_id))
        self.conn.commit()
        messagebox.showinfo("Success", f"Diagnosis for appointment #{appt_id} updated.")

        self.load_appointments_for_patient()  # refresh list


    
    def select_appointment(self, event=None):
        selected = self.appt_tree.selection()
        if not selected:
            self.current_appointment_id = None
            return

        item = self.appt_tree.item(selected[0])
        self.current_appointment_id = item["values"][0]
        print(f"Selected appointment ID: {self.current_appointment_id}")



if __name__ == "__main__":
    root = tk.Tk()
    app = App(root)
    root.grid_columnconfigure(1, weight=1)  # Make column 1 expandable

    root.mainloop()
