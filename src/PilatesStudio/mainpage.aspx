<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="mainpage.aspx.cs" Inherits="pilatesstudio.mainpage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Extra styles for the home page can go here if needed -->
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Hero Section -->
    <section class="hero">
        <div class="container hero-container">
            <div class="hero-image">
                <img src="images/home.page.img.png" alt="Pilates Studio Hero" />
                <a href="UserLogin.aspx" class="book-btn">BOOK NOW</a>
            </div>
        </div>
    </section>

    <!-- Intro Text Section -->
    <section class="intro">
        <div class="container">
            <h1>
                Transform your body and mind with our personalized approach to classical Pilates
                in a serene, boutique setting.
            </h1>
        </div>
    </section>

    <!-- Features Grid Section -->
    <section class="features">
        <div class="container features-grid">
            <div class="feature-box">
                <img src="images/Private.png" class="feature-icon" alt="Private Sessions" />
                <h3>Private Sessions</h3>
                <p>One-on-one instruction tailored to your goals</p>
            </div>

            <div class="divider"></div>

            <div class="feature-box">
                <img src="images/Beginner.png" class="feature-icon" alt="Beginner Classes" />
                <h3>Beginner Classes</h3>
                <p>Supportive sessions with maximum attention</p>
            </div>

            <div class="divider"></div>

            <div class="feature-box">
                <img src="images/Reformer.png" class="feature-icon" alt="Reformer Pilates" />
                <h3>Reformer Pilates</h3>
                <p>Comprehensive approaches to lasting health</p>
            </div>
        </div>
    </section>
</asp:Content>
