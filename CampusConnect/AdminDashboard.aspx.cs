using System;
using System.Web;

namespace CampusConnect
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
         
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
          
            Session.Clear();
            Session.Abandon();

          
            Response.Redirect("WebForm2.aspx");
        }
    }
}
