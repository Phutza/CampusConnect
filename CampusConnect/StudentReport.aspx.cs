using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace CampusConnect
{
    public partial class StudentReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblDateTime.Text = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                string text = "Report generated on : "+ lblDateTime;
                LoadStudents(null); 
            }
        }

        protected void ddlCourseFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedCourse = ddlCourseFilter.SelectedValue;
            LoadStudents(selectedCourse);
        }

        private void LoadStudents(string course)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database1"].ConnectionString))
            {
                string query = @"
                    SELECT 
                        StudentNumber, 
                        Name, 
                        Surname, 
                        Gender, 
                        PhoneNumber, 
                        Email, 
                        StreetAddress, 
                        Town, 
                        PostalCode, 
                        Module1_Test1, 
                        Module1_Test2, 
                        Module1_ModuleMark, 
                        Module2_Test1, 
                        Module2_Test2, 
                        Module2_ModuleMark, 
                        Course 
                    FROM 
                        Student";

                if (!string.IsNullOrEmpty(course))
                {
                    query += " WHERE Course = @Course";
                }

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    if (!string.IsNullOrEmpty(course))
                    {
                        cmd.Parameters.AddWithValue("@Course", course);
                    }

                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);

                    StudentsGridView.DataSource = dt;
                    StudentsGridView.DataBind();

                    
                    lblTotalStudents.Text = "Total Students Registered: " + dt.Rows.Count;
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminDashboard.aspx");
        }
    }
}
