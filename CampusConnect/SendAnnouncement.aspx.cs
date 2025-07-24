using System;
using System.Configuration;
using System.Data.SqlClient;

namespace CampusConnect
{
    public partial class SendAnnouncement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAnnouncements();
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            string title = txtTitle.Text.Trim();
            string announcement = txtAnnouncement.Text.Trim();
            string postedBy = txtPostedBy.Text.Trim();
            bool isForStudents = chkIsForStudents.Checked;

            if (string.IsNullOrWhiteSpace(title) || string.IsNullOrWhiteSpace(announcement) || string.IsNullOrWhiteSpace(postedBy))
            {
                lblMessage.Text = "Please fill in all fields.";
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["Database1"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "INSERT INTO Announcements (Title, Announcement, PostedBy, DatePosted, IsForStudents) VALUES (@Title, @Announcement, @PostedBy, @DatePosted, @IsForStudents)";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Title", title);
                    cmd.Parameters.AddWithValue("@Announcement", announcement);
                    cmd.Parameters.AddWithValue("@PostedBy", postedBy);
                    cmd.Parameters.AddWithValue("@DatePosted", DateTime.Now);
                    cmd.Parameters.AddWithValue("@IsForStudents", isForStudents);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            lblMessage.Text = "Announcement sent successfully.";
            LoadAnnouncements();
            ClearFields();
        }

        private void LoadAnnouncements()
        {
            string connStr = ConfigurationManager.ConnectionStrings["Database1"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT Title, Announcement, PostedBy, DatePosted FROM Announcements ORDER BY DatePosted DESC";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    // Clear any existing data
                    gvAnnouncements.DataSource = null;
                    gvAnnouncements.DataBind();

                    // Bind new data
                    gvAnnouncements.DataSource = reader;
                    gvAnnouncements.DataBind();
                }
            }
        }

        private void ClearFields()
        {
            txtTitle.Text = string.Empty;
            txtAnnouncement.Text = string.Empty;
            txtPostedBy.Text = string.Empty;
            chkIsForStudents.Checked = false;
        }

        protected void btnBackToDashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminDashboard.aspx");
        }
    }
}
