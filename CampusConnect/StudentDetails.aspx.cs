using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace CampusConnect
{
    public partial class StudentDetails : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["StudentNumber"] != null)
                {
                    string studentNumber = Session["StudentNumber"].ToString();
                    LoadStudentDetails(studentNumber);
                }
                else
                {
                    Response.Redirect("LoginPage.aspx"); 
                }
            }
        }

        private void LoadStudentDetails(string studentNumber)
        {
            string connString = ConfigurationManager.ConnectionStrings["Database1"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "SELECT IdNumber, Surname, Name, Gender, PhoneNumber, Email, StreetAddress, Town, PostalCode, Course, Module1, Module2 FROM Student WHERE StudentNumber = @StudentNumber";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@StudentNumber", studentNumber);
                conn.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    lblStudentNumber.Text = studentNumber;
                    lblIdNumber.Text = reader["IdNumber"].ToString();
                    lblSurname.Text = reader["Surname"].ToString();
                    lblName.Text = reader["Name"].ToString();
                    lblGender.Text = reader["Gender"].ToString();
                    lblPhoneNumber.Text = reader["PhoneNumber"].ToString();
                    lblEmail.Text = reader["Email"].ToString();
                    lblStreetAddress.Text = reader["StreetAddress"].ToString();
                    lblTown.Text = reader["Town"].ToString();
                    lblPostalCode.Text = reader["PostalCode"].ToString();
                    lblCourse.Text = reader["Course"].ToString();
                    lblModule1.Text = reader["Module1"].ToString();
                    lblModule2.Text = reader["Module2"].ToString();
                }
            }
        }

        protected void btnEditDetails_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/EditStudentDetails.aspx");
        }

        protected void btnDeregister_Click(object sender, EventArgs e)
        {
            string studentNumber = Session["StudentNumber"].ToString();
            string connString = ConfigurationManager.ConnectionStrings["Database1"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string deleteQuery = "DELETE FROM Student WHERE StudentNumber = @StudentNumber";
                SqlCommand cmd = new SqlCommand(deleteQuery, conn);
                cmd.Parameters.AddWithValue("@StudentNumber", studentNumber);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

           
            Session.Clear();
            Response.Redirect("~/DeregisterConfirmation.aspx");
        }
    }
}
