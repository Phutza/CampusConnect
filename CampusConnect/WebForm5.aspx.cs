using System;
using System.Configuration;
using System.Data.SqlClient;

namespace CampusConnect
{
    public partial class WebForm5 : System.Web.UI.Page
    {

        protected void RegisterLecturer_Click(object sender, EventArgs e)
        {
      
            string name = nameTextBox.Text.Trim();
            string surname = surnameTextBox.Text.Trim();
            string idNumber = idNumberTextBox.Text.Trim();
            string password = passwordTextBox.Text.Trim();
            string phoneNumber = phoneNumberTextBox.Text.Trim();
            string email = emailTextBox.Text.Trim();

            int selectedModulesCount = 0;
            string module1 = null, module2 = null;

            if (module1CheckBox.Checked) { selectedModulesCount++; module1 = "Data Structures"; }
            if (module2CheckBox.Checked) { selectedModulesCount++; module2 = "Object-Oriented Programming"; }
            if (module3CheckBox.Checked) { selectedModulesCount++; module1 = module1 == null ? "C#" : module2 = "C#"; }
            if (module4CheckBox.Checked) { selectedModulesCount++; module1 = module1 == null ? "System Design" : module2 = "System Design"; }

            if (selectedModulesCount == 0 || selectedModulesCount > 2)
            {
                errorMessageLabel.Text = "Please select exactly 2 modules.";
                errorMessageLabel.Visible = true;
                return;
            }

        
            string staffNumber = GenerateStaffNumber();

            string connectionString = ConfigurationManager.ConnectionStrings["Database1"].ConnectionString;
            string query = "INSERT INTO Lecturers (Name, Surname, IDNumber, Password, Phone, Email, StaffNumber, Module1, Module2) " +
                           "VALUES (@Name, @Surname, @IDNumber, @Password, @Phone, @Email, @StaffNumber, @Module1, @Module2)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Name", name);
                command.Parameters.AddWithValue("@Surname", surname);
                command.Parameters.AddWithValue("@IDNumber", idNumber);
                command.Parameters.AddWithValue("@Password", password); 
                command.Parameters.AddWithValue("@Phone", phoneNumber);
                command.Parameters.AddWithValue("@Email", email);
                command.Parameters.AddWithValue("@StaffNumber", staffNumber);
                command.Parameters.AddWithValue("@Module1", module1);
                command.Parameters.AddWithValue("@Module2", module2);

                try
                {
                    connection.Open();
                    int result = command.ExecuteNonQuery();

                    if (result > 0)
                    {
                      
                        confirmationMessageLabel.Text = $"Lecturer successfully added with Staff Number: {staffNumber}";
                        confirmationMessageLabel.Visible = true;

         
                        DisplayLecturerDetails(name, surname, idNumber, phoneNumber, email, staffNumber, module1, module2);
                    }
                    else
                    {
                        errorMessageLabel.Text = "Error: Lecturer registration failed.";
                        errorMessageLabel.Visible = true;
                    }
                }
                catch (Exception ex)
                {
                    errorMessageLabel.Text = "Error: " + ex.Message;
                    errorMessageLabel.Visible = true;
                }
            }
        }

      
        private void DisplayLecturerDetails(string name, string surname, string idNumber, string phone, string email, string staffNumber, string module1, string module2)
        {
            LecturerDetailsPanel.Visible = true;
            nameDisplay.InnerText = name;
            surnameDisplay.InnerText = surname;
            idNumberDisplay.InnerText = idNumber;
            phoneDisplay.InnerText = phone;
            emailDisplay.InnerText = email;
            staffNumberDisplay.InnerText = staffNumber;
            module1Display.InnerText = module1;
            module2Display.InnerText = module2;
        }

        
        private string GenerateStaffNumber()
        {
            Random random = new Random();
            return random.Next(10000000, 99999999).ToString();
        }
    }
}
