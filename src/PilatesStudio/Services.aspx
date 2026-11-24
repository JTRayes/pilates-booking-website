<%@ Page Title="Services" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="Services.aspx.cs" Inherits="pilatesstudio.Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">

        <h2 class="services-title">OUR SERVICES</h2>

        <div class="services-container">

            <asp:Literal ID="litServices" runat="server"></asp:Literal>

        </div>

    </div>

</asp:Content>
