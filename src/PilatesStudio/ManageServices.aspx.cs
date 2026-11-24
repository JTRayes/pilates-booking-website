using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace pilatesstudio
{
    public partial class ManageServices : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadServices();
            }
        }

        private void LoadServices()
        {
            string cs = ConfigurationManager.ConnectionStrings["AppointmentDBConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT ServiceID, ServiceName, Duration, Price FROM Services";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvServices.DataSource = dt;
                gvServices.DataBind();

                lblServicesCount.Text = dt.Rows.Count.ToString();
            }
        }

        protected void gvServices_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int serviceID = Convert.ToInt32(gvServices.DataKeys[e.RowIndex].Value);

            string cs = ConfigurationManager.ConnectionStrings["AppointmentDBConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                SqlCommand deleteAppointments = new SqlCommand("DELETE FROM Appointments WHERE ServiceID=@ServiceID", con);
                deleteAppointments.Parameters.AddWithValue("@ServiceID", serviceID);
                deleteAppointments.ExecuteNonQuery();

                SqlCommand deleteAvailability = new SqlCommand("DELETE FROM Availability WHERE ServiceID=@ServiceID", con);
                deleteAvailability.Parameters.AddWithValue("@ServiceID", serviceID);
                deleteAvailability.ExecuteNonQuery();

                SqlCommand deleteService = new SqlCommand("DELETE FROM Services WHERE ServiceID=@ServiceID", con);
                deleteService.Parameters.AddWithValue("@ServiceID", serviceID);
                deleteService.ExecuteNonQuery();
            }

            LoadServices();
        }
    }
}