using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace CampusConnect
{
    public partial class MaintainModuleMarks : System.Web.UI.Page
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
            string connectionString = ConfigurationManager.ConnectionStrings["Database1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                // Select distinct Module1 and Module2
                SqlCommand cmd = new SqlCommand(@"
                    SELECT DISTINCT Module1 AS Module FROM dbo.Student WHERE Module1 IS NOT NULL
                    UNION
                    SELECT DISTINCT Module2 AS Module FROM dbo.Student WHERE Module2 IS NOT NULL", con);

                con.Open();
                ddlModules.DataSource = cmd.ExecuteReader();
                ddlModules.DataTextField = "Module";
                ddlModules.DataValueField = "Module";
                ddlModules.DataBind();
                ddlModules.Items.Insert(0, new ListItem("Select Module", "")); // Add default value
            }
        }

        protected void ddlModules_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadStudents();
        }

        private void LoadStudents()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Database1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT StudentNumber, Name FROM dbo.Student WHERE Module1 = @Module OR Module2 = @Module", con);
                cmd.Parameters.AddWithValue("@Module", ddlModules.SelectedValue);
                con.Open();

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    ddlStudents.DataSource = reader;
                    ddlStudents.DataTextField = "StudentNumber";
                    ddlStudents.DataValueField = "StudentNumber";
                    ddlStudents.DataBind();
                }

                ddlStudents.Items.Insert(0, new ListItem("Select Student", ""));
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (ddlStudents.SelectedValue == "" || string.IsNullOrWhiteSpace(txtTest1.Text) || string.IsNullOrWhiteSpace(txtTest2.Text) || string.IsNullOrWhiteSpace(txtModuleMark.Text))
            {
                lblMessage.Text = "Please select a student and enter marks for both tests and the module mark.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["Database1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    float test1 = float.Parse(txtTest1.Text);
                    float test2 = float.Parse(txtTest2.Text);
                    float moduleMark = float.Parse(txtModuleMark.Text);

                    string selectedModule = ddlModules.SelectedValue;
                    string sql = string.Empty;

                    // Identify if the selected module is Module1 or Module2 for the student
                    SqlCommand checkCmd = new SqlCommand("SELECT Module1, Module2 FROM dbo.Student WHERE StudentNumber = @StudentNumber", con);
                    checkCmd.Parameters.AddWithValue("@StudentNumber", ddlStudents.SelectedValue);

                    using (SqlDataReader reader = checkCmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            string module1 = reader["Module1"].ToString();
                            string module2 = reader["Module2"].ToString();
                            reader.Close(); // Close the reader before executing another command

                            if (selectedModule == module1)
                            {
                                // If it's Module1, update the Module1 fields
                                sql = "UPDATE dbo.Student SET Module1_Test1 = @Test1, Module1_Test2 = @Test2, Module1_ModuleMark = @ModuleMark WHERE StudentNumber = @StudentNumber";
                            }
                            else if (selectedModule == module2)
                            {
                                // If it's Module2, update the Module2 fields
                                sql = "UPDATE dbo.Student SET Module2_Test1 = @Test1, Module2_Test2 = @Test2, Module2_ModuleMark = @ModuleMark WHERE StudentNumber = @StudentNumber";
                            }
                        }
                        else
                        {
                            lblMessage.Text = "Error: Student not found.";
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                            return;
                        }
                    }

                    // Execute the update command
                    using (SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        cmd.Parameters.AddWithValue("@Test1", test1);
                        cmd.Parameters.AddWithValue("@Test2", test2);
                        cmd.Parameters.AddWithValue("@ModuleMark", moduleMark);
                        cmd.Parameters.AddWithValue("@StudentNumber", ddlStudents.SelectedValue);

                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            lblMessage.Text = "Marks successfully added!";
                            lblMessage.ForeColor = System.Drawing.Color.Green;
                        }
                        else
                        {
                            lblMessage.Text = "Error: Marks could not be added.";
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        protected void btnViewMarks_Click(object sender, EventArgs e)
        {
            // Load marks for the selected student
            string connectionString = ConfigurationManager.ConnectionStrings["Database1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT Module1_Test1, Module1_Test2, Module1_ModuleMark, Module2_Test1, Module2_Test2, Module2_ModuleMark FROM dbo.Student WHERE StudentNumber = @StudentNumber", con);
                cmd.Parameters.AddWithValue("@StudentNumber", ddlStudents.SelectedValue);
                con.Open();

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        // Clear previous data and add new rows
                        gvMarks.Visible = true;
                        gvMarks.DataSource = new[] {
                            new {
                                Test1_Module1 = reader["Module1_Test1"],
                                Test2_Module1 = reader["Module1_Test2"],
                                ModuleMark_Module1 = reader["Module1_ModuleMark"],
                                Test1_Module2 = reader["Module2_Test1"],
                                Test2_Module2 = reader["Module2_Test2"],
                                ModuleMark_Module2 = reader["Module2_ModuleMark"]
                            }
                        };
                        gvMarks.DataBind();
                    }
                    else
                    {
                        lblMessage.Text = "No marks found for the selected student.";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
        }
    }
}
