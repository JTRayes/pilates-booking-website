using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace pilatesstudio
{
    public partial class ManageAppointments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAppointments();
            }
        }

        private void LoadAppointments()
        {
            string cs = ConfigurationManager.ConnectionStrings["AppointmentDBConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"SELECT 
                                    A.AppointmentID,
                                    U.Name AS Client,
                                    A.AppointmentDate AS Date,
                                    A.AppointmentTime AS Time,
                                    S.ServiceName AS Class
                                 FROM Appointments A
                                 INNER JOIN Users U ON A.UserID = U.UserID
                                 INNER JOIN Services S ON A.ServiceID = S.ServiceID";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvAppointments.DataSource = dt;
                gvAppointments.DataBind();

                lblAppointmentsCount.Text = dt.Rows.Count.ToString();
            }
        }

        protected void gvAppointments_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int appointmentID = Convert.ToInt32(gvAppointments.DataKeys[e.RowIndex].Value);

            string cs = ConfigurationManager.ConnectionStrings["AppointmentDBConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "DELETE FROM Appointments WHERE AppointmentID = @AppointmentID";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@AppointmentID", appointmentID);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            LoadAppointments();
        }
    }
}