using System;
using System.Configuration;
using System.Data.SqlClient;

namespace pilatesstudio
{
    public partial class UserLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLoginUser_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["AppointmentDBConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"SELECT UserID, Name, Email, Phone, Role 
                                 FROM Users 
                                 WHERE Email = @Email 
                                 AND Password = @Password 
                                 AND Role = 'client'";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Email", txtUserEmail.Text);
                cmd.Parameters.AddWithValue("@Password", txtUserPass.Text);

                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    Session["UserID"] = dr["UserID"].ToString();
                    Session["UserName"] = dr["Name"].ToString();
                    Session["UserEmail"] = dr["Email"].ToString();
                    Session["UserPhone"] = dr["Phone"].ToString();
                    Session["Role"] = dr["Role"].ToString();

                    Response.Redirect("UserChoice.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid email or password. Please try again.');</script>");
                }
            }
        }
    }
}