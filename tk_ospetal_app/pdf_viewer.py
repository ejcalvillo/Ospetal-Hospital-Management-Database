from reportlab.lib.pagesizes import LETTER
from reportlab.pdfgen import canvas
import os
import platform
import subprocess
import textwrap
from decimal import Decimal
from tkinter import messagebox

#-- Ensuring pdf works cross platform --
def open_pdf_cross_platform(path):
    if platform.system() == 'Darwin':  # macOS
        subprocess.run(['open', path])
    elif platform.system() == 'Linux':
        subprocess.run(['xdg-open', path])
    elif platform.system() == 'Windows':
        os.startfile(path)

def generate_invoice_pdf(cur, appointment_id):
    # Step 1: Fetch appointment, patient, and services
    cur.execute("""
        SELECT a.appointment_id, a.date, a.time, a.diagnosis,
               p.first_name, p.last_name
        FROM appointments a
        JOIN patients p ON a.patient_id = p.patient_id
        WHERE a.appointment_id = %s
    """, (appointment_id,))
    appt = cur.fetchone()

    cur.execute("""
        SELECT Description, UnitCost, Quantity
        FROM Services
        WHERE appointment_id = %s
    """, (appointment_id,))
    services = cur.fetchall()

    # Step 2: Set up the PDF file
    filename = f"Invoice_{appointment_id}.pdf"
    c = canvas.Canvas(filename, pagesize=LETTER)
    width, height = LETTER

    y = height - 50

    # Step 3: Header
    c.setFont("Helvetica-Bold", 16)
    c.drawString(50, y, "OSPETAL INVOICE")
    y -= 30

    c.setFont("Helvetica", 12)
    c.drawString(50, y, f"Appointment ID: {appointment_id}")
    y -= 20
    c.drawString(50, y, f"Patient: {appt['first_name']} {appt['last_name']}")
    y -= 20
    c.drawString(50, y, f"Date Seen: {appt['date']} at {appt['time']}")
    y -= 20
    c.drawString(50, y, f"Diagnosis: {appt['diagnosis'] or 'Pending'}")
    y -= 40

    # Step 4: Service breakdown
    c.setFont("Helvetica-Bold", 12)
    c.drawString(50, y, "Services:")
    y -= 20
    total = Decimal("0.00")

    c.setFont("Helvetica", 11)
    import textwrap  # make sure it's imported at the top

    for s in services:
        qty = Decimal(s['Quantity'])
        cost = s['UnitCost'] * qty
        total += cost

        # Wrap the description to a nice width (adjust width as needed)
        wrapped_lines = textwrap.wrap(s['Description'], width=80)

        for i, line in enumerate(wrapped_lines):
            if y < 100:
                c.showPage()
                y = height - 50
                c.setFont("Helvetica", 11)

            if i == 0:
                full_line = f"{line}  x{qty}  @ ${s['UnitCost']:.2f}"
            else:
                full_line = f"    {line}"  # Indent continuation lines

            c.drawString(50, y, full_line)
            y -= 15


    y -= 20
    c.setFont("Helvetica-Bold", 12)
    c.drawString(50, y, f"Total: ${total:.2f}")

    # Step 5: Save the PDF
    c.save()
    open_pdf_cross_platform(filename)
    messagebox.showinfo("Done","Invoice generated successfully!")

def export_invoice_pdf(app_instance):
    appointment_id = app_instance.current_appointment_id
    if not appointment_id:
        return messagebox.showerror("Error", "Select or create an appointment first.")
        # Generate the PDF
    try:
        generate_invoice_pdf(app_instance.cur, appointment_id)
        messagebox.showinfo("Success", "Invoice PDF generated successfully.")
    except Exception as e:
        messagebox.showerror("Error", f"Failed to generate PDF: {e}")
