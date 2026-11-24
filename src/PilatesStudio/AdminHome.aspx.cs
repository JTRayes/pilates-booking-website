using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pilatesstudio
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        protected void btnLoginAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminDashboard.aspx");
        }
    }
}