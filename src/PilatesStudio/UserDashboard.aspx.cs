using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace pilatesstudio
{
    public partial class UserDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("UserLogin.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadProfile();
                LoadBookings();
            }
        }

        private void LoadProfile()
        {
            txtFullName.Text = Session["UserName"].ToString();
            txtEmail.Text = Session["UserEmail"].ToString();
            txtPhone.Text = Session["UserPhone"].ToString();
            txtPassword.Attributes["value"] = "************";
        }

        private void LoadBookings()
        {
            string cs = ConfigurationManager.ConnectionStrings["AppointmentDBConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"SELECT S.ServiceName AS Class,
                                        A.AppointmentDate AS Date,
                                        A.AppointmentTime AS Time,
                                        'Confirmed' AS Status
                                 FROM Appointments A
                                 INNER JOIN Services S ON A.ServiceID = S.ServiceID
                                 WHERE A.UserID = @UserID";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvBookings.DataSource = dt;
                gvBookings.DataBind();

                lblActiveBookingCount.Text = dt.Rows.Count.ToString();
            }
        }
    }
}