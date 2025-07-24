using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI.WebControls;

namespace CampusConnect
{
    public partial class WebForm11 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["LecturerStaffNumber"] != null || Session["StudentNumber"] != null)
                {
                    string userRole = Session["LecturerStaffNumber"] != null ? "Lecturer" : "Student";
                    lblLoggedInAs.Text = $"Logged in as: {userRole}";

                   
                    pnlSendAnnouncement.Visible = Session["LecturerStaffNumber"] != null;
                }
                else
                {
                    Response.Redirect("LoginForm.aspx");
                }
            }
        }

        protected void btnViewAnnouncements_Click(object sender, EventArgs e)
        {
            LoadAnnouncements();
        }

        protected void btnSendAnnouncement_Click(object sender, EventArgs e)
        {
            string announcementContent = txtAnnouncement.Text.Trim();

            if (string.IsNullOrEmpty(announcementContent))
            {
                lblMessage.Text = "Please enter an announcement.";
                lblMessage.Visible = true;
                return;
            }

            string connectionString = WebConfigurationManager.ConnectionStrings["Database1"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Announcements (Title, Content, DatePosted, PostedBy, IsForStudents) VALUES (@Title, @Content, @DatePosted, @PostedBy, @IsForStudents)";
                SqlCommand cmd = new SqlCommand(query, conn);

                cmd.Parameters.AddWithValue("@Title", "Announcement Title"); 
                cmd.Parameters.AddWithValue("@Content", announcementContent);
                cmd.Parameters.AddWithValue("@DatePosted", DateTime.Now);
                cmd.Parameters.AddWithValue("@PostedBy", Session["LecturerStaffNumber"] ?? "Admin");
                cmd.Parameters.AddWithValue("@IsForStudents", true); 

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    lblMessage.Text = "Announcement sent successfully.";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Visible = true;

                    txtAnnouncement.Text = string.Empty;
                    LoadAnnouncements();
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error sending announcement.";
                    lblMessage.Visible = true;
                }
            }
        }

        private void LoadAnnouncements()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["Database1"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT Title, Content, DatePosted 
                    FROM Announcements
                    WHERE IsForStudents = @IsForStudents
                    OR PostedBy = @PostedBy
                    ORDER BY DatePosted DESC";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@IsForStudents", Session["StudentNumber"] != null);
                cmd.Parameters.AddWithValue("@PostedBy", Session["LecturerStaffNumber"] ?? "Admin");

                try
                {
                    conn.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    rptAnnouncements.DataSource = dt;
                    rptAnnouncements.DataBind();
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error loading announcements.";
                    lblMessage.Visible = true;
                }
            }
        }
    }
}
