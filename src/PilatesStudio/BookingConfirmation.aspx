<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="BookingConfirmation.aspx.cs" Inherits="pilatesstudio.BookingConfirmation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .confirm-page {
            width: 700px;
            margin: 80px auto;
            background-color: white;
            border: 2px solid #8f6f6f;
            text-align: center;
            padding: 70px 40px;
        }

        .check-circle {
            width: 110px;
            height: 110px;
            border-radius: 50%;
            background-color: #bd6668;
            color: white;
            font-size: 65px;
            line-height: 110px;
            margin: 0 auto 30px;
        }

        .confirm-page h1 {
            color: #6f3737;
            font-size: 32px;
            font-weight: normal;
            margin-bottom: 15px;
        }

        .confirm-page p {
            color: #777;
            font-size: 18px;
            margin-bottom: 35px;
        }

        .home-btn {
            display: inline-block;
            background-color: #bd6668;
            color: white;
            text-decoration: none;
            padding: 15px 45px;
            border-radius: 6px;
            font-size: 18px;
        }

        .home-btn:hover {
            opacity: 0.85;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="confirm-page">
        <div class="check-circle">✓</div>

        <h1>Booking Confirmed!</h1>

        <p>Your Pilates class has been booked successfully.</p>

<a href="UserDashboard.aspx" class="home-btn">Manage Your Appointments</a>
    </div>

</asp:Content>
