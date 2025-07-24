using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace CampusConnect
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            
                string staffNumber = Session["LecturerStaffNumber"]?.ToString();

                if (!string.IsNullOrEmpty(staffNumber))
                {
               
                    LoadModules(staffNumber);
                }
                else
                {
                    lblMessage.Text = "Staff Number is not found in the session.";
                }
            }
        }

        private void LoadModules(string staffNumber)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Database1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT Module1, Module2 FROM Lecturers WHERE StaffNumber = @StaffNumber";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@StaffNumber", staffNumber);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                   
                    if (!string.IsNullOrEmpty(reader["Module1"].ToString()))
                    {
                        ddlModules.Items.Add(new ListItem(reader["Module1"].ToString()));
                    }
                    if (!string.IsNullOrEmpty(reader["Module2"].ToString()))
                    {
                        ddlModules.Items.Add(new ListItem(reader["Module2"].ToString()));
                    }
                }
                else
                {
                    lblMessage.Text = "No modules found for the lecturer.";
                }
            }
        }

        protected void ddlModules_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedModule = ddlModules.SelectedValue;
            if (!string.IsNullOrEmpty(selectedModule))
            {
            
                LoadLecturersForModule(selectedModule);
            }
        }

        private void LoadLecturersForModule(string module)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Database1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"SELECT StaffNumber, Name, Surname, Email, Phone
                                 FROM Lecturers
                                 WHERE Module1 = @Module OR Module2 = @Module";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Module", module);

                DataTable dt = new DataTable();
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);

               
                gvLecturers.DataSource = dt;
                gvLecturers.DataBind();
            }
        }
    }
}
