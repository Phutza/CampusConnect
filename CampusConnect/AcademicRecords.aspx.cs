using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;

namespace CampusConnect
{
    public partial class AcademicRecords : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["StudentNumber"] != null)
                {
                    string studentNumber = Session["StudentNumber"].ToString();
                    LoadStudentInfo(studentNumber);
                    LoadAcademicRecords(studentNumber);
                    DisplaySummary();
                }
                else
                {
                    Response.Redirect("WebForm1.aspx");
                }
            }
        }

        private void LoadStudentInfo(string studentNumber)
        {
            string connString = ConfigurationManager.ConnectionStrings["Database1"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "SELECT Name, Surname, Course FROM Student WHERE StudentNumber = @StudentNumber";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@StudentNumber", studentNumber);
                conn.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    string name = $"{reader["Name"]} {reader["Surname"]}";
                    string course = reader["Course"].ToString();
                    lblStudentInfo.Text = $"Student: {name}<br />Student Number: {studentNumber}<br />Course: {course}";
                    lblDateTime.Text = $"Date and Time: {DateTime.Now}";
                }
            }
        }

        private void LoadAcademicRecords(string studentNumber)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Module");
            dt.Columns.Add("Marks");
            dt.Columns.Add("Status");

            string connString = ConfigurationManager.ConnectionStrings["Database1"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = @"
                    SELECT Module1 AS Module, 
                           Module1_ModuleMark AS Marks 
                    FROM Student WHERE StudentNumber = @StudentNumber
                    UNION ALL
                    SELECT Module2 AS Module, 
                           Module2_ModuleMark AS Marks 
                    FROM Student WHERE StudentNumber = @StudentNumber";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@StudentNumber", studentNumber);
                conn.Open();

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }

            decimal totalMarks = 0;
            int countMarks = 0;

            foreach (DataRow row in dt.Rows)
            {
                decimal marks;
                if (decimal.TryParse(row["Marks"].ToString(), out marks))
                {
                    row["Status"] = GetStatus(marks);
                    totalMarks += marks;
                    countMarks++;
                }
                else
                {
                    row["Marks"] = "No marks";
                    row["Status"] = "No marks";
                }
            }

            gvAcademicRecords.DataSource = dt;
            gvAcademicRecords.DataBind();

            Session["TotalMarks"] = totalMarks;
            Session["CountMarks"] = countMarks;
        }

        private string GetStatus(decimal mark)
        {
            if (mark == 0)
            {
                return "No marks";
            }
            else if (mark >= 75)
            {
                return "Distinction";
            }
            else if (mark >= 50)
            {
                return "Pass";
            }
            else
            {
                return "Fail";
            }
        }

        private void DisplaySummary()
        {
            decimal totalMarks = (decimal)(Session["TotalMarks"] ?? 0);
            int countMarks = (int)(Session["CountMarks"] ?? 0);

            if (countMarks > 0)
            {
                decimal averageMarks = totalMarks / countMarks;
                lblStudentInfo.Text += $"<br/>Average Marks: {averageMarks:F2}";
            }
            else
            {
                lblStudentInfo.Text += "<br/>Average Marks: No marks available";
            }
        }

        protected void btnDownload_Click(object sender, EventArgs e)
        {
            // Logic to download the academic records as a CSV file
            string studentNumber = Session["StudentNumber"].ToString();
            string fileName = $"AcademicRecords_{studentNumber}.pdf"; // Change to your desired file type and naming convention

            Response.Clear();
            Response.ContentType = "text/csv"; // Change this to your desired content type (e.g., "application/pdf" for PDFs)
            Response.AddHeader("Content-Disposition", $"attachment; filename={fileName}");

            // Create CSV data
            StringWriter sw = new StringWriter();
            sw.WriteLine("Module,Marks,Status"); // Header

            // Retrieve the data to be exported
            DataTable dt = GetAcademicRecordsData(studentNumber); // Method to get academic records data
            foreach (DataRow row in dt.Rows)
            {
                sw.WriteLine($"{row["Module"]},{row["Marks"]},{row["Status"]}"); // Create CSV rows
            }

            Response.Write(sw.ToString());
            Response.End();
        }

        private DataTable GetAcademicRecordsData(string studentNumber)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Module");
            dt.Columns.Add("Marks");
            dt.Columns.Add("Status");

            string connString = ConfigurationManager.ConnectionStrings["Database1"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = @"
                    SELECT Module1 AS Module, 
                           Module1_ModuleMark AS Marks 
                    FROM Student WHERE StudentNumber = @StudentNumber
                    UNION ALL
                    SELECT Module2 AS Module, 
                           Module2_ModuleMark AS Marks 
                    FROM Student WHERE StudentNumber = @StudentNumber";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@StudentNumber", studentNumber);
                conn.Open();

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }

            return dt;
        }
    }
}
