using System;
using System.Configuration;
using System.Data.SqlClient;

namespace pilatesstudio
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLoginAdmin_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["AppointmentDBConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"SELECT UserID, Name, Role
                                 FROM Users
                                 WHERE Email = @Email
                                 AND Password = @Password
                                 AND Role = 'admin'";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@Email", txtAdminEmail.Text);
                cmd.Parameters.AddWithValue("@Password", txtAdminPass.Text);

                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    Session["AdminID"] = dr["UserID"].ToString();
                    Session["AdminName"] = dr["Name"].ToString();
                    Session["Role"] = dr["Role"].ToString();

                    Response.Redirect("AdminHome.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid admin email or password.');</script>");
                }
            }
        }
    }
}