using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CampusConnect
{
    public partial class WebForm13 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAnnouncementDetails();
            }
        }

        private void LoadAnnouncementDetails()
        {
            string announcementId = Request.QueryString["id"];
            if (string.IsNullOrEmpty(announcementId))
            {
                lblMessage.Text = "Announcement ID is missing.";
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["Database1"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT Title, Announcement, PostedBy, DatePosted FROM Announcements WHERE Id = @ID";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@ID", announcementId);
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        lblTitle.Text = reader["Title"].ToString();
                        lblContent.Text = reader["Announcement"].ToString(); 
                        lblPostedBy.Text = reader["PostedBy"].ToString();

                        // Check for DBNull before converting
                        if (reader["DatePosted"] != DBNull.Value)
                        {
                            lblPostedDate.Text = Convert.ToDateTime(reader["DatePosted"]).ToString("g");
                        }
                        else
                        {
                            lblPostedDate.Text = "Date not available";
                        }
                    }
                    else
                    {
                        lblMessage.Text = "Announcement not found.";
                    }
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("LectureViewAnnouncement.aspx");
        }
    }
}
