using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace pilatesstudio
{
    public partial class Services : System.Web.UI.Page
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
                string query = "SELECT ServiceName, Duration, Price FROM Services";

                SqlDataAdapter da = new SqlDataAdapter(query, con);

                DataTable dt = new DataTable();

                da.Fill(dt);

                StringBuilder html = new StringBuilder();

                foreach (DataRow row in dt.Rows)
                {
                    string serviceName = row["ServiceName"].ToString();
                    string duration = row["Duration"].ToString();
                    string price = row["Price"].ToString();

                    string image = "images/reformer-service.png";
                    string description = "Professional pilates training.";

                    if (serviceName.ToUpper().Contains("BEGINNER"))
                    {
                        image = "images/beginner-service.png";

                        description = "New to Pilates? This class is designed for you. Learn the fundamentals in a welcoming, supportive environment.";
                    }

                    else if (serviceName.ToUpper().Contains("PRIVATE"))
                    {
                        image = "images/private-service.png";

                        description = "Receive personalized one-on-one instruction tailored to your unique goals and fitness needs.";
                    }

                    else if (serviceName.ToUpper().Contains("REFORMER"))
                    {
                        image = "images/reformer-service.png";

                        description = "Experience a dynamic full-body workout using our reformer machines to improve strength and flexibility.";
                    }

                    html.Append(@"

                    <div class='service-card'>

                        <img src='" + image + @"' class='service-img' />

                        <h3>" + serviceName + @"</h3>

                        <p>" + description + @"</p>

                        <div class='details-box'>

                            <p><span>DURATION</span> " + duration + @"</p>
                            <hr />

                            <p><span>PRICE</span> " + price + @" SAR</p>
                            <hr />

                            <p><span>LEVEL</span> ALL LEVELS</p>

                        </div>

                    </div>

                    ");
                }

                litServices.Text = html.ToString();
            }
        }
    }
}