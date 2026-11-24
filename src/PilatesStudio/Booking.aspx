<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Booking.aspx.cs" Inherits="pilatesstudio.Booking" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Book a Class</title>

    <style>
        html, body {
            margin: 0 !important;
            padding: 0 !important;
            background: white !important;
            width: 100% !important;
            min-height: 100% !important;
            font-family: Arial, sans-serif;
        }

        .page {
            width: 100%;
            max-width: 1400px;
            margin: 0 auto;
            background-color: white;
            padding: 35px 45px;
            box-sizing: border-box;
            border: none !important;
        }

        .navbar { display: flex; justify-content: space-between; align-items: center; }
        .logo-area { display: flex; align-items: center; gap: 12px; }
        .logo-area img { width: 45px; height: 45px; object-fit: contain; }
        .logo-area span { font-size: 14px; letter-spacing: 1px; color: #111; }
        .nav-links a { margin-left: 45px; text-decoration: none; font-size: 13px; color: #8d6b6b; letter-spacing: 1px; }

        h1 { text-align: center; color: #8d6b6b; font-weight: normal; font-size: 30px; margin: 25px 0; }
        .booking-section { display: flex; justify-content: space-between; gap: 20px; }

        .box {
            background-color: #f7eeee;
            width: 31%;
            min-height: 310px;
            text-align: center;
            padding: 25px 10px;
        }

        .box h2 { font-size: 20px; color: #777; font-weight: normal; margin-bottom: 30px; }

        .option-btn {
            display: block;
            width: 190px;
            margin: 20px auto;
            padding: 12px;
            background-color: white;
            border: 1px solid #f1caca;
            color: #111;
            font-size: 14px;
            letter-spacing: 1px;
            cursor: pointer;
        }

        .selected { background-color: #bd6668 !important; color: white !important; border: none !important; }
        .disabled-option { opacity: 0.35; pointer-events: none; text-decoration: line-through; }

        .calendar { width: 300px; margin: auto; }
        .month { background-color: #decfcf; padding: 7px; font-size: 12px; letter-spacing: 1px; }
        .days, .dates { display: grid; grid-template-columns: repeat(7, 1fr); gap: 6px; margin-top: 7px; }
        .days div { background-color: #e5d8d8; padding: 8px 0; font-size: 12px; }
        .dates div { background-color: #fffafa; padding: 8px 0; font-size: 14px; cursor: pointer; }

        .summary {
            margin-top: 30px;
            background-color: #fffafa;
            text-align: center;
            padding: 15px 30px 25px;
        }

        .summary h2 { color: #b9a0a0; font-size: 19px; font-weight: normal; margin-bottom: 40px; }
        .summary-content { display: flex; justify-content: space-around; align-items: center; }
        .summary-item { width: 30%; font-size: 18px; color: #555; line-height: 1.7; }
        .summary-item span { display: block; font-size: 22px; letter-spacing: 1px; min-height: 30px; }

        .confirm-btn {
            margin-top: 20px;
            width: 270px;
            padding: 16px;
            background-color: #bd6668;
            border: none;
            color: white;
            font-size: 20px;
            letter-spacing: 1px;
            cursor: pointer;
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

    <asp:HiddenField ID="hfClass" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hfDate" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hfTime" runat="server" ClientIDMode="Static" />

    <asp:Literal ID="litAvailableSlots" runat="server"></asp:Literal>

    <div class="page">

        <div class="navbar">
            <div class="logo-area">
                <img src="images/logo.png" alt="Pilates Logo" />
                <span>PILATES STUDIO</span>
            </div>

            <div class="nav-links">
                <a href="mainpage.aspx">HOME</a>
                <a href="Services.aspx">SERVICES</a>
                <a href="UserDashboard.aspx">DASHBOARD</a>
                <a href="Contact.aspx">CONTACT</a>
            </div>
        </div>

        <h1>Book a Class</h1>

        <div class="booking-section">

            <div class="box">
                <h2>1- Select Class</h2>
                <button type="button" class="option-btn class-option" onclick="selectClass(this, 'PRIVATE SESSION')">PRIVATE SESSION</button>
                <button type="button" class="option-btn class-option" onclick="selectClass(this, 'BEGINNER CLASS')">BEGINNER CLASS</button>
                <button type="button" class="option-btn class-option" onclick="selectClass(this, 'REFORMER PILATES')">REFORMER PILATES</button>
            </div>

            <div class="box">
                <h2>2-Choose Date</h2>

                <div class="calendar">
                    <div class="month">MARCH</div>

                    <div class="days">
                        <div>SUN</div><div>MON</div><div>TUE</div><div>WED</div><div>THU</div><div>FRI</div><div>SAT</div>
                    </div>

                    <div class="dates">
                        <div onclick="selectDate(this, '1 MARCH 2026')">1</div>
                        <div onclick="selectDate(this, '2 MARCH 2026')">2</div>
                        <div onclick="selectDate(this, '3 MARCH 2026')">3</div>
                        <div onclick="selectDate(this, '4 MARCH 2026')">4</div>
                        <div onclick="selectDate(this, '5 MARCH 2026')">5</div>
                        <div onclick="selectDate(this, '6 MARCH 2026')">6</div>
                        <div onclick="selectDate(this, '7 MARCH 2026')">7</div>
                        <div onclick="selectDate(this, '8 MARCH 2026')">8</div>
                        <div onclick="selectDate(this, '9 MARCH 2026')">9</div>
                        <div onclick="selectDate(this, '10 MARCH 2026')">10</div>
                        <div onclick="selectDate(this, '11 MARCH 2026')">11</div>
                        <div onclick="selectDate(this, '12 MARCH 2026')">12</div>
                        <div onclick="selectDate(this, '13 MARCH 2026')">13</div>
                        <div onclick="selectDate(this, '14 MARCH 2026')">14</div>
                        <div onclick="selectDate(this, '15 MARCH 2026')">15</div>
                        <div onclick="selectDate(this, '16 MARCH 2026')">16</div>
                        <div onclick="selectDate(this, '17 MARCH 2026')">17</div>
                        <div onclick="selectDate(this, '18 MARCH 2026')">18</div>
                        <div onclick="selectDate(this, '19 MARCH 2026')">19</div>
                        <div onclick="selectDate(this, '20 MARCH 2026')">20</div>
                        <div onclick="selectDate(this, '21 MARCH 2026')">21</div>
                        <div onclick="selectDate(this, '22 MARCH 2026')">22</div>
                        <div onclick="selectDate(this, '23 MARCH 2026')">23</div>
                        <div onclick="selectDate(this, '24 MARCH 2026')">24</div>
                        <div onclick="selectDate(this, '25 MARCH 2026')">25</div>
                        <div onclick="selectDate(this, '26 MARCH 2026')">26</div>
                        <div onclick="selectDate(this, '27 MARCH 2026')">27</div>
                        <div onclick="selectDate(this, '28 MARCH 2026')">28</div>
                        <div onclick="selectDate(this, '29 MARCH 2026')">29</div>
                        <div onclick="selectDate(this, '30 MARCH 2026')">30</div>
                        <div onclick="selectDate(this, '31 MARCH 2026')">31</div>
                    </div>
                </div>
            </div>

            <div class="box">
                <h2>3-Select Time</h2>
                <button type="button" class="option-btn time-option disabled-option" onclick="selectTime(this, '9:00 AM')">9:00 AM</button>
                <button type="button" class="option-btn time-option disabled-option" onclick="selectTime(this, '4:00 PM')">4:00 PM</button>
                <button type="button" class="option-btn time-option disabled-option" onclick="selectTime(this, '8:00 PM')">8:00 PM</button>
            </div>

        </div>

        <div class="summary">
            <h2>Booking Summary</h2>

            <div class="summary-content">
                <div class="summary-item">CLASS:<span id="selectedClass">---</span></div>
                <div class="summary-item">DATE:<span id="selectedDate">---</span></div>
                <div class="summary-item">TIME:<span id="selectedTime">---</span></div>
            </div>

            <asp:Button ID="btnConfirmBooking" runat="server"
                Text="Confirm Booking"
                CssClass="confirm-btn"
                OnClientClick="return saveBookingData();"
                OnClick="btnConfirmBooking_Click" />
        </div>

    </div>

<script>
    function clearSelected(groupClass) {
        document.querySelectorAll(groupClass).forEach(function (item) {
            item.classList.remove("selected");
        });
    }

    function selectClass(element, value) {
        clearSelected(".class-option");
        element.classList.add("selected");

        document.getElementById("selectedClass").innerText = value;
        document.getElementById("selectedDate").innerText = "---";
        document.getElementById("selectedTime").innerText = "---";

        document.querySelectorAll(".dates div").forEach(function (dateBox) {
            dateBox.classList.remove("disabled-option", "selected");

            var fullDate = dateBox.getAttribute("onclick").split("'")[1].toUpperCase();

            var exists = availableSlots.some(function (slot) {
                var parts = slot.split("|");
                return parts[0] === value.toUpperCase() && parts[1] === fullDate;
            });

            if (!exists) {
                dateBox.classList.add("disabled-option");
            }
        });

        document.querySelectorAll(".time-option").forEach(function (btn) {
            btn.classList.add("disabled-option");
            btn.classList.remove("selected");
        });
    }

    function selectDate(element, value) {
        if (element.classList.contains("disabled-option")) {
            return;
        }

        clearSelected(".dates div");
        element.classList.add("selected");

        document.getElementById("selectedDate").innerText = value;
        document.getElementById("selectedTime").innerText = "---";

        var selectedClass = document.getElementById("selectedClass").innerText.toUpperCase();
        var selectedDate = value.toUpperCase();

        document.querySelectorAll(".time-option").forEach(function (btn) {
            btn.classList.remove("disabled-option", "selected");

            var timeText = btn.innerText.trim().toUpperCase();

            var exists = availableSlots.some(function (slot) {
                var parts = slot.split("|");
                return parts[0] === selectedClass && parts[1] === selectedDate && parts[2] === timeText;
            });

            if (!exists) {
                btn.classList.add("disabled-option");
            }
        });
    }

    function selectTime(element, value) {
        if (element.classList.contains("disabled-option")) {
            return;
        }

        clearSelected(".time-option");
        element.classList.add("selected");
        document.getElementById("selectedTime").innerText = value;
    }

    function saveBookingData() {
        var selectedClass = document.getElementById("selectedClass").innerText;
        var selectedDate = document.getElementById("selectedDate").innerText;
        var selectedTime = document.getElementById("selectedTime").innerText;

        if (selectedClass === "---" || selectedDate === "---" || selectedTime === "---") {
            alert("Please select available class, date, and time.");
            return false;
        }

        document.getElementById("hfClass").value = selectedClass;
        document.getElementById("hfDate").value = selectedDate;
        document.getElementById("hfTime").value = selectedTime;

        return true;
    }
</script>

</form>
</body>
</html>