using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace CampusConnect
{
    public partial class AddStudent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Optionally load any initial data here if needed
            }
        }

        protected void ddlCourse_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlModule1.Items.Clear();
            ddlModule2.Items.Clear();

            string selectedCourse = ddlCourse.SelectedValue;
            if (selectedCourse == "BSc Computer Science")
            {
                ddlModule1.Items.Add(new ListItem("Object Oriented Programming", "Object Oriented Programming"));
                ddlModule2.Items.Add(new ListItem("Data Structure", "Data Structure"));
            }
            else if (selectedCourse == "BSc Information Systems")
            {
                ddlModule1.Items.Add(new ListItem("C#", "C#"));
                ddlModule2.Items.Add(new ListItem("System Design", "System Design"));
            }
            // Add more courses and modules as needed
        }

        protected void btnAddStudent_Click(object sender, EventArgs e)
        {
            string idNumber = txtIdNumber.Text.Trim();
            string surname = txtSurname.Text.Trim();
            string name = txtName.Text.Trim();
            string gender = ddlGender.SelectedValue;
            string phoneNumber = txtPhoneNumber.Text.Trim();
            string email = txtEmail.Text.Trim();
            string streetAddress = txtStreetAddress.Text.Trim();
            string town = txtTown.Text.Trim();
            string postalCode = txtPostalCode.Text.Trim();
            string course = ddlCourse.SelectedValue;
            string studentNumber = GenerateStudentNumber();
            string password = "defaultPassword"; 
            string module1 = ddlModule1.SelectedValue;
            string module2 = ddlModule2.SelectedValue;

         
            string validationMessage = ValidateInputs(idNumber, surname, name, gender, phoneNumber, email, streetAddress, town, postalCode, course, module1, module2);
            if (!string.IsNullOrEmpty(validationMessage))
            {
                lblMessage.Text = validationMessage;
                lblMessage.Visible = true;
                return;
            }

         
            string connString = WebConfigurationManager.ConnectionStrings["Database1"].ConnectionString;
            if (AddStudentToDatabase(connString, idNumber, surname, name, gender, phoneNumber, email, streetAddress, town, postalCode, course, studentNumber, module1, module2, password))
            {
                lblMessage.Text = $"Student added successfully! Student Number: {studentNumber}";
                lblMessage.Visible = true;
                ClearFields();
            }
        }

        private string ValidateInputs(string idNumber, string surname, string name, string gender, string phoneNumber, string email, string streetAddress, string town, string postalCode, string course, string module1, string module2)
        {
            if (string.IsNullOrWhiteSpace(idNumber) || idNumber.Length != 13)
                return "ID Number must be 13 digits long.";
            if (string.IsNullOrWhiteSpace(surname) || string.IsNullOrWhiteSpace(name) ||
                string.IsNullOrWhiteSpace(gender) || string.IsNullOrWhiteSpace(phoneNumber) ||
                string.IsNullOrWhiteSpace(email) || string.IsNullOrWhiteSpace(streetAddress) ||
                string.IsNullOrWhiteSpace(town) || string.IsNullOrWhiteSpace(postalCode) ||
                course == "0" || module1 == "0" || module2 == "0")
                return "All fields are required.";
            if (!IsValidEmail(email))
                return "Please enter a valid email address.";
            if (!IsValidPhoneNumber(phoneNumber))
                return "Phone number must be 10 digits.";

            return string.Empty;
        }

        private bool AddStudentToDatabase(string connString, string idNumber, string surname, string name, string gender, string phoneNumber, string email, string streetAddress, string town, string postalCode, string course, string studentNumber, string module1, string module2, string password)
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO Student (IdNumber, Surname, Name, Gender, PhoneNumber, Email, StreetAddress, Town, PostalCode, Course, StudentNumber, Module1, Module2, Password) VALUES (@IdNumber, @Surname, @Name, @Gender, @PhoneNumber, @Email, @StreetAddress, @Town, @PostalCode, @Course, @StudentNumber, @Module1, @Module2, @Password)", conn);
                cmd.Parameters.AddWithValue("@IdNumber", idNumber);
                cmd.Parameters.AddWithValue("@Surname", surname);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Gender", gender);
                cmd.Parameters.AddWithValue("@PhoneNumber", phoneNumber);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@StreetAddress", streetAddress);
                cmd.Parameters.AddWithValue("@Town", town);
                cmd.Parameters.AddWithValue("@PostalCode", postalCode);
                cmd.Parameters.AddWithValue("@Course", course);
                cmd.Parameters.AddWithValue("@StudentNumber", studentNumber);
                cmd.Parameters.AddWithValue("@Module1", module1);
                cmd.Parameters.AddWithValue("@Module2", module2);
                cmd.Parameters.AddWithValue("@Password", password);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    return true;
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                    lblMessage.Visible = true;
                    return false;
                }
            }
        }

        private string GenerateStudentNumber()
        {
           
            return "S" + new Random().Next(1000000, 9999999).ToString();
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminDashboard.aspx"); 
        }

        private void ClearFields()
        {
            txtIdNumber.Text = "";
            txtSurname.Text = "";
            txtName.Text = "";
            ddlGender.SelectedIndex = 0;
            txtPhoneNumber.Text = "";
            txtEmail.Text = "";
            txtStreetAddress.Text = "";
            txtTown.Text = "";
            txtPostalCode.Text = "";
            ddlCourse.SelectedIndex = 0;
            ddlModule1.SelectedIndex = 0;
            ddlModule2.SelectedIndex = 0;
        }

        private bool IsValidEmail(string email)
        {
           
            string emailPattern = @"^[^@\s]+@[^@\s]+\.[^@\s]+$";
            return Regex.IsMatch(email, emailPattern);
        }

        private bool IsValidPhoneNumber(string phoneNumber)
        {
            return phoneNumber.Length == 10 && long.TryParse(phoneNumber, out _);
        }
    }
}
