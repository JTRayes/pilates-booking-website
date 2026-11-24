<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="UserChoice.aspx.cs" Inherits="pilatesstudio.UserDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container dashboard-welcome">
        <h1 class="welcome-text">WELCOME</h1>
        <p class="selection-subtitle">Choose your way</p>

        <!-- This container activates the flexbox layout -->
        <div class="choice-container">
            
            <!-- Card 1 -->
            <a href="UserDashboard.aspx" class="choice-card">
                <div class="icon-placeholder">
                    <img src="images/clipboard-icon.png" alt="Dashboard" style="width: 70px; opacity: 0.5;" />
                </div>
                <h3>View Dashboard</h3>
            </a>

            <!-- Card 2 -->
            <a href="Booking.aspx" class="choice-card">
                <div class="icon-placeholder">
                    <img src="images/calendar-icon.png" alt="Booking" style="width: 70px; opacity: 0.5;" />
                </div>
                <h3>Book appointment</h3>
            </a>
            
        </div>
    </div>
</asp:Content>