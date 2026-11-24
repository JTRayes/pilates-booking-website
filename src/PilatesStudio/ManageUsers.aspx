<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageUsers.aspx.cs" Inherits="pilatesstudio.ManageUsers" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Manage Users</title>

    <style>

        body {
            margin: 0;
            padding: 0;
            background-color: #f3f0ef;
            font-family: Arial, sans-serif;
            overflow-x: hidden;
        }

        .page {
            width: 100%;
            max-width: 1400px;
            margin: 0 auto;
            padding: 30px 40px 80px;
            box-sizing: border-box;
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 70px;
        }

        .logo-area {
            display: flex;
            align-items: center;
            gap: 14px;
        }

        .logo-area img {
            width: 45px;
        }

        .logo-area span {
            font-size: 15px;
            letter-spacing: 1px;
        }

        .nav-links a {
            margin-left: 45px;
            text-decoration: none;
            font-size: 14px;
            color: #8d6b6b;
            letter-spacing: 1px;
        }

        .title {
            font-size: 28px;
            font-weight: normal;
            margin-bottom: 35px;
            color: #111;
            letter-spacing: 1px;
        }

        .content {
            display: flex;
            gap: 40px;
            align-items: flex-start;
        }

        .table-box {
            flex: 1;
            background-color: #fbf7f7;
            border-radius: 12px;
            padding: 45px 35px;
        }

        .users-grid {
            width: 100%;
            border-collapse: collapse;
            color: #555;
            font-size: 16px;
        }

        .users-grid th {
            color: #999;
            font-weight: normal;
            text-align: left;
            padding: 0 0 25px;
            border-bottom: 1px solid #d8d1d1;
            font-size: 16px;
        }

        .users-grid td {
            padding: 28px 0;
            border-bottom: 1px solid #d8d1d1;
        }

        .users-grid a {
            text-decoration: none;
            margin-right: 18px;
        }

        .users-grid a[href*='Edit'] {
            color: #8daee8;
        }

        .users-grid a[href*='Delete'] {
            color: #ee7d7d;
        }

        .active-status {
            color: #4caf50;
        }

        .side {
            width: 250px;
        }

        .count-box,
        .back-box {
            background-color: #fbf7f7;
            border-radius: 12px;
            text-align: center;
            padding: 55px 20px;
            margin-bottom: 35px;
        }

        .count-number {
            display: block;
            font-size: 44px;
            color: #444;
            margin-bottom: 25px;
            font-weight: normal;
        }

        .count-box p {
            margin: 0;
            color: #6f3737;
            font-size: 18px;
        }

        .back-box a {
            text-decoration: none;
            color: #8daee8;
            font-size: 15px;
        }

    </style>

</head>

<body>

<form id="form1" runat="server">

<div class="page">

    <div class="navbar">

        <div class="logo-area">
            <img src="images/logo.png" />
            <span>PILATES STUDIO</span>
        </div>

        <div class="nav-links">
            <a href="mainpage.aspx">HOME</a>
            <a href="Services.aspx">SERVICES</a>
            <a href="UserLogin.aspx">LOGIN</a>
            <a href="Register.aspx">REGISTER</a>
            <a href="Contact.aspx">CONTACT</a>
        </div>

    </div>

    <h1 class="title">MANAGE USER</h1>

    <div class="content">

        <div class="table-box">

            <asp:GridView ID="gvUsers"
                runat="server"
                AutoGenerateColumns="False"
                DataKeyNames="UserID"
                OnRowDeleting="gvUsers_RowDeleting"
                CssClass="users-grid"
                GridLines="None"
                EmptyDataText="No users yet">

                <Columns>

                    <asp:BoundField DataField="Name" HeaderText="Name" />

                    <asp:BoundField DataField="Email" HeaderText="Email" />

                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <span class="active-status">Active</span>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>

                            <asp:LinkButton ID="btnDelete"
                                runat="server"
                                CommandName="Delete"
                                Text="Delete"
                                CausesValidation="false">
                            </asp:LinkButton>

                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>

            </asp:GridView>

        </div>

        <div class="side">

            <div class="count-box">

                <asp:Label ID="lblUsersCount"
                    runat="server"
                    Text="0"
                    CssClass="count-number">
                </asp:Label>

                <p>Total Users</p>

            </div>

            <div class="back-box">
                <a href="AdminHome.aspx">Back to admins homepage</a>
            </div>

        </div>

    </div>

</div>

</form>

</body>
</html>
