using System;

namespace pilatesstudio
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect("mainpage.aspx");
        }
    }
}