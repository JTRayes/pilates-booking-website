<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="pilatesstudio.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .contact-page {
            text-align: center;
            padding: 30px 0 70px;
        }

        .contact-title {
            font-size: 32px;
            color: #8d6b6b;
            font-weight: normal;
            margin-bottom: 5px;
        }

        .contact-subtitle {
            font-size: 15px;
            color: #333;
            margin-bottom: 60px;
            font-variant: small-caps;
        }

        .contact-wrapper {
            width: 760px;
            margin: 0 auto;
            background-color: #eadede;
            border-radius: 28px;
            padding: 22px;
            display: grid;
            grid-template-columns: 1.2fr 0.9fr;
            gap: 10px;
        }

        .message-box,
        .info-box,
        .hours-box {
            background-color: #fff;
            border-radius: 25px;
            text-align: left;
        }

        .message-box {
            padding: 25px 35px;
            grid-row: span 2;
        }

        .info-box,
        .hours-box {
            padding: 22px 28px;
        }

        .box-title {
            color: #8d6b6b;
            font-size: 24px;
            font-weight: normal;
            font-variant: small-caps;
            margin: 0 0 28px;
        }

        .form-group {
            margin-bottom: 14px;
        }

        .form-group label {
            display: block;
            color: #3c2f2f;
            font-size: 13px;
            font-weight: bold;
            margin-bottom: 5px;
            font-variant: small-caps;
        }

        .contact-input {
            width: 100%;
            height: 32px;
            border: 1px solid #b99d9d;
            background-color: #fbf7f7;
            padding: 6px 10px;
            box-sizing: border-box;
            color: #6f3737;
            font-size: 14px;
        }

        .message-input {
            width: 100%;
            height: 95px;
            border: 1px solid #b99d9d;
            background-color: #fbf7f7;
            padding: 8px 10px;
            box-sizing: border-box;
            color: #6f3737;
            resize: none;
            font-size: 14px;
        }

        .send-btn {
            margin-top: 8px;
            width: 100%;
            padding: 12px;
            background-color: #bd6668;
            border: none;
            color: white;
            font-size: 16px;
            letter-spacing: 1px;
            cursor: pointer;
            font-variant: small-caps;
        }

        .send-btn:hover {
            opacity: 0.9;
        }

        .info-label {
            color: #8d6b6b;
            font-size: 16px;
            margin: 10px 0 3px;
            font-variant: small-caps;
        }

        .info-text {
            color: #8d6b6b;
            font-size: 14px;
            line-height: 1.45;
            margin: 0;
            font-variant: small-caps;
        }

        .hours-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            color: #8d6b6b;
            font-size: 14px;
            line-height: 1.6;
            font-variant: small-caps;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="contact-page">
        <h1 class="contact-title">Get In Touch</h1>
        <p class="contact-subtitle">Have a question? We'd love to hear from you.</p>

        <div class="contact-wrapper">

            <div class="message-box">
                <h2 class="box-title">Send Us A Message:</h2>

                <div class="form-group">
                    <label>NAME</label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="contact-input" placeholder="ENTER YOUR NAME"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>EMAIL</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="contact-input" placeholder="YOUR@EMAIL.COM"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>PHONE</label>
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="contact-input" placeholder="05XXXXXXXX"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>MESSAGE</label>
                    <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" CssClass="message-input" placeholder="TYPE YOUR MESSAGE"></asp:TextBox>
                </div>

                <asp:Button ID="btnSend" runat="server" Text="SEND MESSAGE" CssClass="send-btn" />
            </div>

            <div class="info-box">
                <h2 class="box-title">Contact Information</h2>

                <p class="info-label">ADDRESS</p>
                <p class="info-text">Olaya Street, Al Olaya District,<br />Riyadh 12211, Saudi Arabia</p>

                <p class="info-label">PHONE</p>
                <p class="info-text">(555) 123-4567</p>

                <p class="info-label">EMAIL</p>
                <p class="info-text">helloruh@pilatesstudio.com</p>
            </div>

            <div class="hours-box">
                <h2 class="box-title">Studio Hours</h2>

                <div class="hours-row">
                    <span>Monday - Friday</span>
                    <span>6am - 8pm</span>

                    <span>Saturday</span>
                    <span>8am - 6pm</span>

                    <span>Sunday</span>
                    <span>9am - 5pm</span>
                </div>
            </div>

        </div>
    </div>

</asp:Content>
