<%@ Page Title="Admin Login" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" Inherits="pilatesstudio.AdminLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container auth-container">
        <div class="auth-box">
            <h2 style="color: #72655f;">WELCOME BACK</h2>
            <p>Login as an Admin</p>
            
            <div class="form-group">
                <label>STAFF ID / EMAIL</label>
                <asp:TextBox ID="txtAdminEmail" runat="server" CssClass="input-field"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <label>PASSWORD</label>
                <asp:TextBox ID="txtAdminPass" runat="server" TextMode="Password" CssClass="input-field"></asp:TextBox>
            </div>
            
<asp:Button ID="btnLoginAdmin" runat="server" Text="LOG IN" CssClass="submit-btn" OnClick="btnLoginAdmin_Click" />            
            <div class=".text-input-box">
                <p style="margin-top:15px;">
                   <a href="UserLogin.aspx" style="font-size:11px; text-decoration:none; opacity:0.7; color:#6f5b5b;">
                       Login as a User
                   </a>
                </p>
            </div>
        </div>
    </div>
</asp:Content>
