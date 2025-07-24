using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace CampusConnect
{
    public partial class WebForm6 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
           
                if (Session["StudentNumber"] != null)
                {
                    string studentNumber = Session["StudentNumber"].ToString();

                    
                    lblLoggedInAs.Text = $"Logged in as: {GetStudentName(studentNumber)} ({studentNumber})";

                    LoadStudentDetails(studentNumber);
                }
                else
                {
                   
                    Response.Redirect("WebForm1.aspx");
                }
            }
        }

        private string GetStudentName(string studentNumber)
        {
          
            string name = string.Empty;
            string connString = ConfigurationManager.ConnectionStrings["Database1"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "SELECT Name, Surname FROM Student WHERE StudentNumber = @StudentNumber";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@StudentNumber", studentNumber);
                conn.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    name = $"{reader["Name"]} {reader["Surname"]}";
                }
            }
            return name;
        }

        private void LoadStudentDetails(string studentNumber)
        {
          
            DataTable dt = new DataTable();
            dt.Columns.Add("FieldName");
            dt.Columns.Add("FieldValue");

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
                    dt.Rows.Add("ID Number", reader["IdNumber"].ToString());
                    dt.Rows.Add("Surname", reader["Surname"].ToString());
                    dt.Rows.Add("Name", reader["Name"].ToString());
                    dt.Rows.Add("Gender", reader["Gender"].ToString());
                    dt.Rows.Add("Phone Number", reader["PhoneNumber"].ToString());
                    dt.Rows.Add("Email", reader["Email"].ToString());
                    dt.Rows.Add("Street Address", reader["StreetAddress"].ToString());
                    dt.Rows.Add("Town", reader["Town"].ToString());
                    dt.Rows.Add("Postal Code", reader["PostalCode"].ToString());
                    dt.Rows.Add("Course", reader["Course"].ToString());
                    dt.Rows.Add("Module 1", reader["Module1"].ToString());
                    dt.Rows.Add("Module 2", reader["Module2"].ToString());
                }
            }

            gvStudentDetails.DataSource = dt;
            gvStudentDetails.DataBind();
        }

        protected void btnEditDetails_Click(object sender, EventArgs e)
        {
         
            Response.Redirect("~/UpdateStudentDetails.aspx");
        }

        protected void btnDeregister_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("~/DeregisterConfirmation.aspx");
        }

        protected void btnViewAcademicRecords_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AcademicRecords.aspx");
        }
    }
}
