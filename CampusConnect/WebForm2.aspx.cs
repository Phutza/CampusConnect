using System;
using System.Web.UI;

namespace CampusConnect
{
    public partial class WebForm2 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
      
            string username = this.username.Text; 
            string password = this.password.Text; 

            if (username == "31546455" && password == "991012")
            {
               
                Response.Redirect("AdminDashboard.aspx");
            }
            else
            {
               
                Response.Write("<script>alert('Invalid username or password');</script>");
            }
        }

        protected void BackToDashboardButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebForm1.aspx");
        }
    }
}
