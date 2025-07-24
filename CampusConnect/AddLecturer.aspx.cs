using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Text.RegularExpressions;

namespace CampusConnect
{
    public partial class AddLecturer : System.Web.UI.Page
    {
        protected void btnAddLecturer_Click(object sender, EventArgs e)
        {
            string idNumber = txtIDNumber.Text.Trim();
            string name = txtName.Text.Trim();
            string surname = txtSurname.Text.Trim();
            string password = txtPassword.Text.Trim();
            string phone = txtPhone.Text.Trim();
            string email = txtEmail.Text.Trim();
            string module1 = ddlModule1.SelectedValue;
            string module2 = ddlModule2.SelectedValue;

         
            if (string.IsNullOrWhiteSpace(idNumber) || idNumber.Length != 13) 
            {
                lblMessage.Text = "ID Number must be 13 digits long.";
                lblMessage.Visible = true;
                return;
            }

            if (string.IsNullOrWhiteSpace(name) || string.IsNullOrWhiteSpace(surname) ||
                string.IsNullOrWhiteSpace(password) || string.IsNullOrWhiteSpace(phone) ||
                string.IsNullOrWhiteSpace(email) || module1 == "0" || module2 == "0") 
            {
                lblMessage.Text = "All fields are required.";
                lblMessage.Visible = true;
                return;
            }

            if (!IsValidEmail(email))
            {
                lblMessage.Text = "Please enter a valid email address.";
                lblMessage.Visible = true;
                return;
            }

            if (!IsValidPhoneNumber(phone))
            {
                lblMessage.Text = "Phone number must be 10 digits.";
                lblMessage.Visible = true;
                return;
            }

         
            string connectionString = ConfigurationManager.ConnectionStrings["Database1"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string checkIdQuery = "SELECT COUNT(*) FROM Lecturers WHERE IDNumber = @IDNumber";
                using (SqlCommand checkIdCommand = new SqlCommand(checkIdQuery, connection))
                {
                    checkIdCommand.Parameters.AddWithValue("@IDNumber", idNumber);
                    int count = (int)checkIdCommand.ExecuteScalar();

                    if (count > 0)
                    {
                        lblMessage.Text = "ID number already exists.";
                        lblMessage.Visible = true;
                        return; 
                    }
                }

               
                Random random = new Random();
                int staffNumber = random.Next(10000000, 99999999);

              
                string insertQuery = "INSERT INTO Lecturers (IDNumber, Name, Surname, Password, Phone, Email, StaffNumber, Module1, Module2) " +
                                     "VALUES (@IDNumber, @Name, @Surname, @Password, @Phone, @Email, @StaffNumber, @Module1, @Module2)";

                using (SqlCommand insertCommand = new SqlCommand(insertQuery, connection))
                {
                    insertCommand.Parameters.AddWithValue("@IDNumber", idNumber);
                    insertCommand.Parameters.AddWithValue("@Name", name);
                    insertCommand.Parameters.AddWithValue("@Surname", surname);
                    insertCommand.Parameters.AddWithValue("@Password", password); 
                    insertCommand.Parameters.AddWithValue("@Phone", phone);
                    insertCommand.Parameters.AddWithValue("@Email", email);
                    insertCommand.Parameters.AddWithValue("@StaffNumber", staffNumber);
                    insertCommand.Parameters.AddWithValue("@Module1", module1);
                    insertCommand.Parameters.AddWithValue("@Module2", module2);

                    try
                    {
                        insertCommand.ExecuteNonQuery();
                        lblMessage.Text = $"Lecturer successfully added with Staff Number: {staffNumber}";
                        lblMessage.Visible = true;

                        ClearInputFields();
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = "Error adding lecturer: " + ex.Message;
                        lblMessage.Visible = true;
                    }
                }
            }
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

        private void ClearInputFields()
        {
            txtIDNumber.Text = "";
            txtName.Text = "";
            txtSurname.Text = "";
            txtPassword.Text = "";
            txtPhone.Text = "";
            txtEmail.Text = "";
            ddlModule1.SelectedIndex = 0; 
            ddlModule2.SelectedIndex = 0; 
        }
    }
}
