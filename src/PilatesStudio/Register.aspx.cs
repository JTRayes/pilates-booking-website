using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace pilatesstudio
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (txtRegPass.Text != txtConfirmPass.Text)
            {
                Response.Write("<script>alert('Password and Confirm Password do not match.');</script>");
                return;
            }

            string cs = ConfigurationManager.ConnectionStrings["AppointmentDBConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string checkQuery = "SELECT COUNT(*) FROM Users WHERE Email = @Email";

                SqlCommand checkCmd = new SqlCommand(checkQuery, con);
                checkCmd.Parameters.AddWithValue("@Email", txtRegEmail.Text);

                con.Open();

                int emailExists = (int)checkCmd.ExecuteScalar();

                if (emailExists > 0)
                {
                    Response.Write("<script>alert('This email is already registered. Please login.');</script>");
                    return;
                }

                string insertQuery = @"INSERT INTO Users (Name, Email, Password, Phone, Role)
                                       VALUES (@Name, @Email, @Password, @Phone, @Role)";

                SqlCommand cmd = new SqlCommand(insertQuery, con);

                cmd.Parameters.AddWithValue("@Name", txtFullName.Text);
                cmd.Parameters.AddWithValue("@Email", txtRegEmail.Text);
                cmd.Parameters.AddWithValue("@Password", txtRegPass.Text);
                cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                cmd.Parameters.AddWithValue("@Role", "client");

                cmd.ExecuteNonQuery();
            }

            Response.Write("<script>alert('Account created successfully!'); window.location='UserLogin.aspx';</script>");
        }
    }
}