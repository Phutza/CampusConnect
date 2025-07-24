using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Text.RegularExpressions;

namespace CampusConnect
{
    public partial class UpdateStudentDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStudentDetails();
            }
        }

        private void LoadStudentDetails()
        {
            string studentNumber = (string)Session["StudentNumber"];

            if (string.IsNullOrEmpty(studentNumber))
            {
                errorPanel.Visible = true;
                lblErrorMessage.Text = "No student found. Please log in again.";
                return;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["Database1"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT IdNumber, StudentNumber, Name, Surname, Email, PhoneNumber, StreetAddress, Town, PostalCode FROM Student WHERE StudentNumber = @StudentNumber";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@StudentNumber", studentNumber);
                con.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    txtIdNumber.Text = reader["IdNumber"].ToString();
                    txtStudentNumber.Text = reader["StudentNumber"].ToString();
                    txtStudentNumber.ReadOnly = true;  
                    txtIdNumber.ReadOnly = true; 
                    txtName.Text = reader["Name"].ToString();
                    txtSurname.Text = reader["Surname"].ToString();
                    txtEmail.Text = reader["Email"].ToString();
                    txtPhoneNumber.Text = reader["PhoneNumber"].ToString();
                    txtStreet.Text = reader["StreetAddress"].ToString();
                    txtTown.Text = reader["Town"].ToString();
                    txtPostalCode.Text = reader["PostalCode"].ToString();
                }
                else
                {
                    errorPanel.Visible = true;
                    lblErrorMessage.Text = "Student details not found.";
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            // Validate input fields
            if (string.IsNullOrWhiteSpace(txtName.Text) || string.IsNullOrWhiteSpace(txtSurname.Text))
            {
                errorPanel.Visible = true;
                lblErrorMessage.Text = "Name and surname cannot be empty.";
                return;
            }

            if (!IsValidEmail(txtEmail.Text))
            {
                errorPanel.Visible = true;
                lblErrorMessage.Text = "Please enter a valid email address.";
                return;
            }

            if (!IsValidPhoneNumber(txtPhoneNumber.Text))
            {
                errorPanel.Visible = true;
                lblErrorMessage.Text = "Phone number must be 10 digits.";
                return;
            }

            if (string.IsNullOrWhiteSpace(txtStreet.Text) || string.IsNullOrWhiteSpace(txtTown.Text) || string.IsNullOrWhiteSpace(txtPostalCode.Text))
            {
                errorPanel.Visible = true;
                lblErrorMessage.Text = "Street, town, and postal code cannot be empty.";
                return;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["Database1"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "UPDATE Student SET Name = @Name, Surname = @Surname, Email = @Email, PhoneNumber = @PhoneNumber, StreetAddress = @StreetAddress, Town = @Town, PostalCode = @PostalCode WHERE IdNumber = @IdNumber AND StudentNumber = @StudentNumber";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@IdNumber", txtIdNumber.Text);
                cmd.Parameters.AddWithValue("@StudentNumber", txtStudentNumber.Text); // Student number cannot be edited
                cmd.Parameters.AddWithValue("@Name", txtName.Text);
                cmd.Parameters.AddWithValue("@Surname", txtSurname.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@PhoneNumber", txtPhoneNumber.Text);
                cmd.Parameters.AddWithValue("@StreetAddress", txtStreet.Text);
                cmd.Parameters.AddWithValue("@Town", txtTown.Text);
                cmd.Parameters.AddWithValue("@PostalCode", txtPostalCode.Text);

                con.Open();
                int result = cmd.ExecuteNonQuery();

                if (result > 0)
                {
                    confirmationPanel.Visible = true;
                    lblConfirmationMessage.Text = "Student details updated successfully.";
                }
                else
                {
                    errorPanel.Visible = true;
                    lblErrorMessage.Text = "Failed to update student details.";
                }
            }
        }

        private bool IsValidEmail(string email)
        {
            // Regular expression for basic email validation
            string emailPattern = @"^[^@\s]+@[^@\s]+\.[^@\s]+$";
            return Regex.IsMatch(email, emailPattern);
        }

        private bool IsValidPhoneNumber(string phoneNumber)
        {
            return phoneNumber.Length == 10 && long.TryParse(phoneNumber, out _);
        }
    }
}
