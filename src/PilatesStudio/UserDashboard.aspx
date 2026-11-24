<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="UserDashboard.aspx.cs" Inherits="pilatesstudio.UserDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
        background-color: #ffffff;
    }

    .dashboard-page {
        width: 1220px;
        margin: 40px auto;
        background-color: white;
        padding: 10px 0 40px;
    }

    .title {
        margin: 20px 0 35px 20px;
        font-size: 28px;
        letter-spacing: 2px;
        color: #111;
        font-weight: normal;
    }

    .cards {
        display: flex;
        justify-content: space-between;
        gap: 25px;
        margin-bottom: 14px;
    }

    .card {
        width: 33.3%;
        height: 170px;
        background-color: #fbf7f7;
        border-radius: 14px;
        text-align: center;
        text-decoration: none;
        color: #6f3737;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        font-size: 24px;
    }

    .card img {
        width: 65px;
        margin-bottom: 18px;
    }

    .number-icon {
        font-size: 36px;
        color: #444;
        margin-bottom: 25px;
    }

    .card h3 {
        margin: 0;
        font-size: 24px;
        font-weight: normal;
        color: #6f3737;
    }

    .section-box {
        background-color: #fbf7f7;
        border-radius: 8px;
        margin-top: 14px;
        padding: 15px 50px 25px;
    }

    .section-box h2 {
        text-align: center;
        color: #666;
        font-size: 26px;
        font-weight: normal;
        margin: 0 0 35px;
    }

    .booking-grid {
        width: 100%;
        border-collapse: collapse;
        text-align: center;
        color: #555;
        font-size: 24px;
    }

    .booking-grid th {
        color: #999;
        font-weight: normal;
        padding: 18px 0 25px;
        border-bottom: 1px solid #bbb;
        font-size: 24px;
    }

    .booking-grid td {
        padding: 22px 0;
        border-bottom: 1px solid #bbb;
        font-size: 24px;
    }

    .profile-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 32px 180px;
        padding: 0 40px;
    }

    .field label {
        display: block;
        color: #999;
        font-size: 20px;
        margin-bottom: 12px;
    }

    .field input {
        width: 100%;
        height: 43px;
        padding: 6px 12px;
        border: none;
        background-color: white;
        border-radius: 5px;
        font-size: 20px;
        color: #555;
    }
</style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="dashboard-page">

    <h1 class="title">MY PAGE</h1>

    <div class="cards">

        <a href="Booking.aspx" class="card">
            <img src="images/booking-icon.png" alt="Booking" />
            <h3>Book a class</h3>
        </a>

        <a href="#profileSection" class="card">
            <img src="images/Editprofile-icon.png" alt="Profile" />
            <h3>View&amp; Edit profile</h3>
        </a>

        <div class="card">
            <asp:Label ID="lblActiveBookingCount" runat="server"
                CssClass="number-icon"
                Text="0"></asp:Label>
            <h3>Active Booking</h3>
        </div>

    </div>

    <div class="section-box">

        <h2>Upcoming Booking</h2>

        <asp:GridView ID="gvBookings"
            runat="server"
            AutoGenerateColumns="true"
            CssClass="booking-grid"
            GridLines="None"
            EmptyDataText="No booking yet">
        </asp:GridView>

    </div>

    <div class="section-box" id="profileSection">

        <h2>Profile information</h2>

        <div class="profile-grid">

            <div class="field">
                <label>FULL NAME</label>
                <asp:TextBox ID="txtFullName" runat="server"></asp:TextBox>
            </div>

            <div class="field">
                <label>EMAIL</label>
                <asp:TextBox ID="txtEmail" runat="server" ReadOnly="true"></asp:TextBox>
            </div>

            <div class="field">
                <label>PHONE</label>
                <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
            </div>

            <div class="field">
                <label>PASSWORD</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" ReadOnly="true"></asp:TextBox>
            </div>

        </div>

    </div>

</div>

</asp:Content>