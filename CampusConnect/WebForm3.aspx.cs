using System;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace CampusConnect
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = this.username.Text.Trim();
            string password = this.password.Text.Trim();  
            string role = this.role.SelectedValue;        

          
            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(role))
            {
                lblErrorMessage.Text = "Please fill in all fields.";
                lblErrorMessage.Visible = true;
                return;
            }

        
            lblErrorMessage.Text = $"Trying to login as {role} with username: {username}";
            lblErrorMessage.Visible = true;

         
            if (AuthenticateUser(username, password, role))
            {
           
                lblErrorMessage.Text = $"Login successful for {role}";
                lblErrorMessage.Visible = false;

            
                if (role == "Student")
                {
                    Session["StudentNumber"] = username;
                    Response.Redirect("WebForm6.aspx");
                }
                else if (role == "Lecturer")
                {
                    Session["LecturerStaffNumber"] = username;
                    string lecturerSurname = GetLecturerSurname(username);
                    Session["LecturerSurname"] = lecturerSurname;
                    Response.Redirect("WebForm7.aspx");
                }
            }
            else
            {
                lblErrorMessage.Text = "Invalid username or password. Please try again.";
                lblErrorMessage.Visible = true;
            }
        }

      
        private bool AuthenticateUser(string username, string password, string role)
        {
            bool isAuthenticated = false;
            string connectionString = WebConfigurationManager.ConnectionStrings["Database1"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = string.Empty;

              
                if (role == "Student")
                {
                    query = @"SELECT COUNT(1) 
                              FROM Student 
                              WHERE StudentNumber = @Username 
                              AND LTRIM(RTRIM(Password)) = @Password"; 
                }
                else if (role == "Lecturer")
                {
                    query = @"SELECT COUNT(1) 
                              FROM Lecturers 
                              WHERE StaffNumber = @Username 
                              AND LTRIM(RTRIM(Password)) = @Password"; 
                }

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Password", password);

                try
                {
                    conn.Open();
                   
                    lblErrorMessage.Text = $"Executing query: {cmd.CommandText}";
                    lblErrorMessage.Visible = true;

                    int count = Convert.ToInt32(cmd.ExecuteScalar());

                    if (count == 1)
                    {
                        isAuthenticated = true;
                    }
                    else
                    {
                   
                        lblErrorMessage.Text = "Authentication failed. No matching user found.";
                        lblErrorMessage.Visible = true;
                    }
                }
                catch (Exception ex)
                {
                    lblErrorMessage.Text = $"Error during login: {ex.Message}";
                    lblErrorMessage.Visible = true;
                }
            }

            return isAuthenticated;
        }

 
        private string GetLecturerSurname(string staffNumber)
        {
            string surname = string.Empty;
            string connectionString = WebConfigurationManager.ConnectionStrings["Database1"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT Surname FROM Lecturers WHERE StaffNumber = @StaffNumber";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@StaffNumber", staffNumber);

                try
                {
                    conn.Open();
                    object result = cmd.ExecuteScalar();
                    if (result != null)
                    {
                        surname = result.ToString();
                    }
                }
                catch (Exception ex)
                {
                    lblErrorMessage.Text = $"Error retrieving lecturer details: {ex.Message}";
                    lblErrorMessage.Visible = true;
                }
            }

            return surname;
        }
    }
}
