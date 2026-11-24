<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="pilatesstudio.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .position: {
            width: 388px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container auth-container">
        <div class="auth-box">
            <h2>CREATE ACCOUNT</h2>
            <p class="subtitle">Join the Pilates Community.</p>

            <div style="display: flex; justify-content: center; align-items: center;">
                <img src="images/stickfugure.png" alt="Centered Image" style="height: 85px; width: 100px" />
            </div>
            
            <!-- 1. FULL NAME FIELD -->
            <div class="form-group">
                <label>FULL NAME</label>
                <asp:TextBox ID="txtFullName" runat="server" CssClass="input-field"></asp:TextBox>
            </div>
            
            <!-- 2. EMAIL FIELD -->
            <div class="form-group">
                <label>EMAIL ADDRESS</label>
                <asp:TextBox ID="txtRegEmail" runat="server" CssClass="input-field"></asp:TextBox>
            </div>
            
            <!-- 3. PHONE FIELD -->
            <div class="form-group">
                <label>PHONE NUMBER (e.g. 05XXXXXXXX)</label>
                <asp:TextBox ID="txtPhone" runat="server" CssClass="input-field"></asp:TextBox>
            </div>
            
            <!-- 4. PASSWORD FIELD -->
            <div class="form-group">
                <label>PASSWORD</label>
                <asp:TextBox ID="txtRegPass" runat="server" TextMode="Password" CssClass="input-field"></asp:TextBox>
            </div>

            <!-- 5. CONFIRM PASSWORD FIELD -->
            <div class="form-group">
                <label>CONFIRM PASSWORD</label>
                <asp:TextBox ID="txtConfirmPass" runat="server" TextMode="Password" CssClass="input-field"></asp:TextBox>
            </div>

            <!-- 
                CREATE ACCOUNT BUTTON
                OnClick: يشغل كود C# الموجود في Register.aspx.cs
                OnClientClick: يشغل JavaScript قبل الإرسال عشان يحفظ البيانات مؤقتًا في المتصفح
            -->
           <asp:Button ID="btnRegister" runat="server" Text="CREATE ACCOUNT" CssClass="create-account-btn"
    OnClick="btnRegister_Click" />
            
            <div class="auth-footer">
                <p>Already a Have an Account? <a href="UserLogin.aspx">LOGIN HERE</a></p>
            </div>
        </div>
    </div>

    <script>
        /*
            This function stores the user registration data in localStorage.
            UserDashboard.aspx will read these same values and display them.
        */
        function saveRegisterData() {
            var fullName = document.getElementById("<%= txtFullName.ClientID %>").value;
            var email = document.getElementById("<%= txtRegEmail.ClientID %>").value;
            var phone = document.getElementById("<%= txtPhone.ClientID %>").value;
            var password = document.getElementById("<%= txtRegPass.ClientID %>").value;
            var confirmPassword = document.getElementById("<%= txtConfirmPass.ClientID %>").value;

            /*
                Basic check:
                If password and confirm password are not the same,
                stop the registration button from continuing.
            */
            if (password !== confirmPassword) {
                alert("Password and Confirm Password do not match.");
                return false;
            }

            /*
                Save data using the same keys used in UserDashboard.aspx:
                userName, userEmail, userPhone, userPassword
            */
            localStorage.setItem("userName", fullName);
            localStorage.setItem("userEmail", email);
            localStorage.setItem("userPhone", phone);
            localStorage.setItem("userPassword", password);

            alert("Account created successfully!");

            /*
                return true means:
                continue to run the C# button event btnRegister_Click.
            */
            return true;
        }
    </script>
</asp:Content>