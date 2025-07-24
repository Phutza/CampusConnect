using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace CampusConnect
{
    public partial class ViewAnnouncements : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAnnouncements();
            }
        }

        private void LoadAnnouncements()
        {
            string connStr = ConfigurationManager.ConnectionStrings["Database1"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT ID, Title, PostedBy FROM Announcements", conn);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                gvAnnouncements.DataSource = dt;
                gvAnnouncements.DataBind();
            }
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string announcementId = btn.CommandArgument;

            Response.Redirect($"AnnouncementDetails.aspx?id={announcementId}");
        }
    }
}
