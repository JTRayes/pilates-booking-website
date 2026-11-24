<%@ Page Title="User Login" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="UserLogin.aspx.cs" Inherits="pilatesstudio.UserLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container auth-container">
        <!-- Exact same box as Register for consistency -->
        <div class="auth-box">
            <h2>WELCOME BACK</h2>
            <p class="subtitle">Login to your account.</p>
            
            <div class="form-group">
                <label>EMAIL ADDRESS</label>
                <!-- Specific C# ID and CssClass -->
                <asp:TextBox ID="txtUserEmail" runat="server" CssClass="input-field"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <label>PASSWORD</label>
                <!-- TextMode="Password" is required for security -->
                <asp:TextBox ID="txtUserPass" runat="server" TextMode="Password" CssClass="input-field"></asp:TextBox>
            </div>
           <asp:Button ID="btnLoginUser" runat="server" Text="LOG IN" CssClass="submit-btn"
    OnClick="btnLoginUser_Click" />

            <div class="auth-footer">
                <p>New here? <a href="Register.aspx">CREATE ACCOUNT</a></p>

                <p style="margin-top:15px;">
                    <a href="AdminLogin.aspx" style="font-size:11px; text-decoration:none; opacity:0.7;">
                        Login as an Admin
                    </a>
                </p>
            </div>
        </div>
    </div>
</asp:Content>