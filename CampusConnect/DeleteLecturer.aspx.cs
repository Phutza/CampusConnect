using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI.WebControls;

namespace CampusConnect
{
    public partial class DeleteLecturer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadLecturers();
            }
        }

        private void LoadLecturers()
        {
            string connString = WebConfigurationManager.ConnectionStrings["Database1"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                // Include additional lecturer details in the query
                SqlCommand cmd = new SqlCommand("SELECT Id, IDNumber, Name, Surname, Email, Phone, Module1, Module2 FROM Lecturers", conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvLecturers.DataSource = dt;
                gvLecturers.DataBind();
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int lecturerId = Convert.ToInt32(btn.CommandArgument);
            string connString = WebConfigurationManager.ConnectionStrings["Database1"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Lecturers WHERE Id = @Id", conn);
                cmd.Parameters.AddWithValue("@Id", lecturerId);
                conn.Open();
                int rowsAffected = cmd.ExecuteNonQuery();
                conn.Close();

                if (rowsAffected > 0)
                {
                    lblMessage.Text = "Lecturer successfully deleted.";
                    lblMessage.Visible = true;
                    LoadLecturers(); // Reload the list of lecturers
                }
                else
                {
                    lblMessage.Text = "Error deleting lecturer.";
                    lblMessage.Visible = true;
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminDashboard.aspx");
        }
    }
}
