using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Text;
using System.Web;

namespace pilatesstudio
{
    public partial class Booking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadAvailableSlots();
        }

        private void LoadAvailableSlots()
        {
            string cs = ConfigurationManager.ConnectionStrings["AppointmentDBConnection"].ConnectionString;
            StringBuilder sb = new StringBuilder();

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"SELECT S.ServiceName, A.AvailableDate, A.AvailableTime
                                 FROM Availability A
                                 INNER JOIN Services S ON A.ServiceID = S.ServiceID";

                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    string service = dr["ServiceName"].ToString().Trim().ToUpper();
                    string date = dr["AvailableDate"].ToString().Trim().ToUpper();
                    string time = dr["AvailableTime"].ToString().Trim().ToUpper();

                    sb.Append("\"");
                    sb.Append(HttpUtility.JavaScriptStringEncode(service + "|" + date + "|" + time));
                    sb.Append("\",");
                }
            }

            string slots = sb.ToString().TrimEnd(',');

            litAvailableSlots.Text = "<script>var availableSlots = [" + slots + "];</script>";
        }

        protected void btnConfirmBooking_Click(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Write("<script>alert('Please login first.'); window.location='UserLogin.aspx';</script>");
                return;
            }

            int serviceID = 0;

            if (hfClass.Value == "PRIVATE SESSION")
                serviceID = 3;
            else if (hfClass.Value == "BEGINNER CLASS")
                serviceID = 2;
            else if (hfClass.Value == "REFORMER PILATES")
                serviceID = 1;

            string selectedDate = hfDate.Value.Trim().ToUpper();
            string selectedTime = hfTime.Value.Trim().ToUpper();

            string cs = ConfigurationManager.ConnectionStrings["AppointmentDBConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                string checkQuery = @"SELECT COUNT(*)
                                      FROM Availability
                                      WHERE ServiceID = @ServiceID
                                      AND UPPER(LTRIM(RTRIM(AvailableDate))) = @AvailableDate
                                      AND UPPER(LTRIM(RTRIM(AvailableTime))) = @AvailableTime";

                SqlCommand checkCmd = new SqlCommand(checkQuery, con);
                checkCmd.Parameters.AddWithValue("@ServiceID", serviceID);
                checkCmd.Parameters.AddWithValue("@AvailableDate", selectedDate);
                checkCmd.Parameters.AddWithValue("@AvailableTime", selectedTime);

                int available = (int)checkCmd.ExecuteScalar();

                if (available == 0)
                {
                    Response.Write("<script>alert('This class is not available at this date and time.');</script>");
                    return;
                }

                string insertQuery = @"INSERT INTO Appointments
                                      (UserID, ServiceID, AppointmentDate, AppointmentTime)
                                      VALUES
                                      (@UserID, @ServiceID, @AppointmentDate, @AppointmentTime)";

                SqlCommand cmd = new SqlCommand(insertQuery, con);
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
                cmd.Parameters.AddWithValue("@ServiceID", serviceID);
                cmd.Parameters.AddWithValue("@AppointmentDate", hfDate.Value);
                cmd.Parameters.AddWithValue("@AppointmentTime", hfTime.Value);

                cmd.ExecuteNonQuery();
            }

            Response.Redirect("BookingConfirmation.aspx");
        }
    }
}