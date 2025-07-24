using System;
using System.Data.SqlClient;
using System.Configuration;

namespace CampusConnect
{
    public partial class DeregisterConfirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (Session["StudentNumber"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            
            string studentNumber = (string)Session["StudentNumber"];

            if (!string.IsNullOrEmpty(studentNumber))
            {
                
                string connectionString = ConfigurationManager.ConnectionStrings["Database1"].ConnectionString;

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                
                    string query = "DELETE FROM Student WHERE StudentNumber = @StudentNumber";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@StudentNumber", studentNumber);

                    try
                    {
                       
                        con.Open();
                        int result = cmd.ExecuteNonQuery();

                        
                        if (result > 0)
                        {
                            Response.Redirect("DeregistrationSuccess.aspx");
                        }
                        else
                        {
                            
                            Response.Write("<script>alert('Failed to deregister. Please try again.');</script>");
                        }
                    }
                    catch (Exception ex)
                    {
                        
                        Response.Write($"<script>alert('An error occurred: {ex.Message}');</script>");
                    }
                }
            }
            else
            {
                
                Response.Write("<script>alert('No student found. Please log in again.');</script>");
            }
        }

        protected void btnNo_Click(object sender, EventArgs e)
        {

            Response.Redirect("WebForm1.aspx");
        }
    }
}
