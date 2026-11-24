using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace pilatesstudio
{
    public partial class ManageUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUsers();
            }
        }

        private void LoadUsers()
        {
            string cs = ConfigurationManager.ConnectionStrings["AppointmentDBConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT UserID, Name, Email, Phone, Role FROM Users";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvUsers.DataSource = dt;
                gvUsers.DataBind();

                lblUsersCount.Text = dt.Rows.Count.ToString();
            }
        }

        protected void gvUsers_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int userID = Convert.ToInt32(gvUsers.DataKeys[e.RowIndex].Value);

            string cs = ConfigurationManager.ConnectionStrings["AppointmentDBConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                string deleteAppointments = "DELETE FROM Appointments WHERE UserID = @UserID";
                SqlCommand cmdAppointments = new SqlCommand(deleteAppointments, con);
                cmdAppointments.Parameters.AddWithValue("@UserID", userID);
                cmdAppointments.ExecuteNonQuery();

                string deleteUser = "DELETE FROM Users WHERE UserID = @UserID";
                SqlCommand cmdUser = new SqlCommand(deleteUser, con);
                cmdUser.Parameters.AddWithValue("@UserID", userID);
                cmdUser.ExecuteNonQuery();
            }

            LoadUsers();
        }
    }
}