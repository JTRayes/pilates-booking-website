<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="AdminHome.aspx.cs" Inherits="pilatesstudio.AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container dashboard-welcome">
        <h1 class="welcome-text">WELCOME</h1>
        <p class="selection-subtitle">Choose your way</p>

        <div class="choice-container">
            <!-- Card 1: Manage Users -->
            <a href="ManageUsers.aspx" class="choice-card">
                <div class="icon-placeholder">
                    <img src="images/stickfugure.png" alt="Users" style="width: 70px; opacity: 0.5;" />
                </div>
                <h3>Manage Users</h3>
            </a>

            <!-- Card 2: Manage Services -->
            <a href="ManageServices.aspx" class="choice-card">
                <div class="icon-placeholder">
                    <img src="images/clipboard-icon.png" alt="Services" style="width: 70px; opacity: 0.5;" />
                </div>
                <h3>Manage Services</h3>
            </a>

            <!-- Card 3: Manage Appointments -->
            <a href="ManageAppointments.aspx" class="choice-card">
                <div class="icon-placeholder">
                    <img src="images/calendar-icon.png" alt="Appointments" style="width: 70px; opacity: 0.5;" />
                </div>
                <h3>Manage Appointments</h3>
            </a>
        </div>
    </div>
</asp:Content>
