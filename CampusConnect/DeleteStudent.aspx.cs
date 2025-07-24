using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI.WebControls;

namespace CampusConnect
{
    public partial class DeleteStudent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStudents();
            }
        }

        private void LoadStudents()
        {
            string connString = WebConfigurationManager.ConnectionStrings["Database1"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                // Load student data from the database
                SqlCommand cmd = new SqlCommand("SELECT Id, StudentNumber, Name, Surname FROM Student", conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvStudents.DataSource = dt;
                gvStudents.DataBind();
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int studentId = Convert.ToInt32(btn.CommandArgument);
            string connString = WebConfigurationManager.ConnectionStrings["Database1"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Student WHERE Id = @Id", conn);
                cmd.Parameters.AddWithValue("@Id", studentId);
                conn.Open();
                int rowsAffected = cmd.ExecuteNonQuery();
                conn.Close();

                if (rowsAffected > 0)
                {
                    lblMessage.Text = "Student successfully deleted.";
                    lblMessage.Visible = true;
                    LoadStudents(); 
                }
                else
                {
                    lblMessage.Text = "Error deleting student.";
                    lblMessage.Visible = true;
                }
            }
        }

        protected void btnBackToDashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminDashboard.aspx");
        }
    }
}
