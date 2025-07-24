using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.Services;

namespace CampusConnect
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        
        string connectionString = WebConfigurationManager.ConnectionStrings["Database1"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadModules();
            }
        }

        
        private void LoadModules()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT DISTINCT Module1 FROM Student", con);
                SqlDataReader reader = cmd.ExecuteReader();
                ddlModules.DataSource = reader;
                ddlModules.DataTextField = "Module1";
                ddlModules.DataBind();
                con.Close();
            }
        }

       
        protected void btnGenerateReport_Click(object sender, EventArgs e)
        {
            string selectedModule = ddlModules.SelectedValue;
            LoadStudentReport(selectedModule);
        }

        
        private void LoadStudentReport(string module)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(
                    "SELECT S.Name AS StudentName, S.StudentNumber, S.Module1 AS Module, M.Marks, " +
                    "CASE WHEN M.Marks >= 50 THEN CASE WHEN M.Marks >= 75 THEN 'Distinction' ELSE 'Pass' END ELSE 'Fail' END AS Result " +
                    "FROM Student S JOIN Marks M ON S.StudentNumber = M.StudentNumber WHERE M.Module = @Module", con);

                cmd.Parameters.AddWithValue("@Module", module);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                gvStudentReport.DataSource = dt;
                gvStudentReport.DataBind();
                con.Close();
            }
        }

       
        [WebMethod]
        public static object GetChartData(string module)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["Database1"].ConnectionString;
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(
                    "SELECT CASE " +
                    "WHEN Marks BETWEEN 0 AND 49 THEN '0-49' " +
                    "WHEN Marks BETWEEN 50 AND 59 THEN '50-59' " +
                    "WHEN Marks BETWEEN 60 AND 69 THEN '60-69' " +
                    "WHEN Marks BETWEEN 70 AND 79 THEN '70-79' " +
                    "WHEN Marks BETWEEN 80 AND 89 THEN '80-89' " +
                    "WHEN Marks BETWEEN 90 AND 100 THEN '90-100' END AS MarksRange, " +
                    "COUNT(*) AS StudentCount " +
                    "FROM Marks WHERE Module = @Module " +
                    "GROUP BY CASE " +
                    "WHEN Marks BETWEEN 0 AND 49 THEN '0-49' " +
                    "WHEN Marks BETWEEN 50 AND 59 THEN '50-59' " +
                    "WHEN Marks BETWEEN 60 AND 69 THEN '60-69' " +
                    "WHEN Marks BETWEEN 70 AND 79 THEN '70-79' " +
                    "WHEN Marks BETWEEN 80 AND 89 THEN '80-89' " +
                    "WHEN Marks BETWEEN 90 AND 100 THEN '90-100'", con);

                cmd.Parameters.AddWithValue("@Module", module);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);
                con.Close();
            }

            return dt;
        }
    }
}
