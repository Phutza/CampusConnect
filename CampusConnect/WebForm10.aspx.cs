using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CampusConnect
{
    public partial class MarksReport : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadModules();
            }
        }

        private void LoadModules()
        {
            
            ddlModule.Items.Add(new ListItem("Object Oriented Programming", "Object Oriented Programming"));
            ddlModule.Items.Add(new ListItem("Data Structure", "Data Structure"));
            ddlModule.Items.Add(new ListItem("C#", "C#"));
            ddlModule.Items.Add(new ListItem("System Design", "System Design"));
            ddlModule.Items.Insert(0, new ListItem("-- Select Module --", "0"));
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            if (ddlModule.SelectedValue == "0")
            {
                lblMessage.Text = "Please select a module.";
                return;
            }

            lblMessage.Text = string.Empty;
            string selectedModule = ddlModule.SelectedValue;
            string filterCriteria = ddlFilter.SelectedValue;
            GenerateReport(selectedModule, filterCriteria);
        }

        private void GenerateReport(string selectedModule, string filterCriteria)
        {
            string connString = ConfigurationManager.ConnectionStrings["Database1"].ConnectionString;
            string query = "SELECT StudentNumber, Surname, Name, " +
                           "Module1_Test1, Module1_Test2, Module1_ModuleMark " +
                           "FROM Student WHERE (Module1 = @Module OR Module2 = @Module) ";

            
            if (filterCriteria != "All")
            {
                if (filterCriteria == "Passed")
                {
                    query += "AND Module1_ModuleMark >= 50";
                }
                else if (filterCriteria == "Failed")
                {
                    query += "AND Module1_ModuleMark < 50";
                }
                else if (filterCriteria == "Distinction")
                {
                    query += "AND Module1_ModuleMark > 75";
                }
            }

            using (SqlConnection conn = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Module", selectedModule);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                gvMarks.DataSource = dt;
                gvMarks.DataBind();

               
                int totalStudents = dt.Rows.Count;
                int passed = 0, failed = 0, distinction = 0;

                foreach (DataRow row in dt.Rows)
                {
                    
                    float moduleMark = row["Module1_ModuleMark"] != DBNull.Value
                        ? Convert.ToSingle(row["Module1_ModuleMark"])
                        : 0.0f;  

                    if (moduleMark >= 50)
                    {
                        passed++;
                        if (moduleMark > 75)
                            distinction++;
                    }
                    else
                    {
                        failed++;
                    }
                }

                lblReportTitle.Text = $"Student Report for {selectedModule} - Date: {DateTime.Now.ToString("dd/MM/yyyy HH:mm")}";
                lblDateTime.Text = $"Generated on: {DateTime.Now}";
                lblSummary.Text = $"Total Students: {totalStudents}, Passed: {passed}, Failed: {failed}, Distinctions: {distinction}";

                
                lblComments.Text = GenerateComments(passed, failed, distinction);
            }
        }

        private string GenerateComments(int passed, int failed, int distinction)
        {
            string comments = "Comments: ";

            if (passed > 0)
                comments += "Some students passed. ";
            if (failed > 0)
                comments += "Some students failed. ";
            if (distinction > 0)
                comments += "Some students achieved distinctions! ";

            if (passed == 0 && failed > 0)
                comments += "All students failed. ";
            if (passed == 0 && distinction == 0)
                comments += "No students achieved a distinction. ";

            return comments;
        }
    }
}
