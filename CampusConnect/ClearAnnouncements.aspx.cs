using System;
using System.Data.SqlClient;
using System.Configuration;

namespace CampusConnect
{
    public partial class ClearAnnouncements : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Database1"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Announcements";
                SqlCommand command = new SqlCommand(query, connection);

                try
                {
                    connection.Open();
                    int rowsAffected = command.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        Response.Write("<script>alert('All announcements cleared successfully.');</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('No announcements found to clear.');</script>");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write($"<script>alert('Error: {ex.Message}');</script>");
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminDashboard.aspx");
        }
    }
}
