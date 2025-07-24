using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CampusConnect
{
    public partial class Register : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void courseDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedCourse = courseDropDownList.SelectedValue;
            moduleCheckBoxList.Items.Clear();
            if (selectedCourse == "BSc Computer Science")
            {
                moduleCheckBoxList.Items.Add(new ListItem("Object Oriented Programming", "Object Oriented Programming"));
                moduleCheckBoxList.Items.Add(new ListItem("Data Structure", "Data Structure"));
            }
            else if (selectedCourse == "BSc Information Systems")
            {
                moduleCheckBoxList.Items.Add(new ListItem("C#", "C#"));
                moduleCheckBoxList.Items.Add(new ListItem("System Design", "System Design"));
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // Input validation
            if (password.Text != confirmPassword.Text)
            {
                ShowError("Passwords do not match.");
                return;
            }

            if (idNumber.Text.Length != 13 || !idNumber.Text.All(char.IsDigit))
            {
                ShowError("ID number must be 13 digits.");
                return;
            }

            if (phoneNumber.Text.Length != 10 || !phoneNumber.Text.All(char.IsDigit))
            {
                ShowError("Phone number must be 10 digits.");
                return;
            }

            if (!IsValidEmail(email.Text))
            {
                ShowError("Please enter a valid email address.");
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["Database1"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

     
                if (IsIdNumberExists(conn, idNumber.Text))
                {
                    ShowError("Error: ID number already exists in the system.");
                    return;
                }

         
                string studentNumber = GenerateUniqueStudentNumber();

            
                string plainPassword = password.Text;

       
                var selectedModules = moduleCheckBoxList.Items.Cast<ListItem>().Where(i => i.Selected).Select(i => i.Text).ToList();
                string module1 = selectedModules.ElementAtOrDefault(0) ?? "";
                string module2 = selectedModules.ElementAtOrDefault(1) ?? "";

     
                string sql = @"INSERT INTO Student (Name, Surname, IdNumber, Gender, PhoneNumber, Email, StreetAddress, Town, PostalCode, Course, StudentNumber, Password, Module1, Module2)
                               VALUES (@Name, @Surname, @IdNumber, @Gender, @PhoneNumber, @Email, @StreetAddress, @Town, @PostalCode, @Course, @StudentNumber, @Password, @Module1, @Module2)";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@Name", name.Text);
                    cmd.Parameters.AddWithValue("@Surname", surname.Text);
                    cmd.Parameters.AddWithValue("@IdNumber", idNumber.Text);
                    cmd.Parameters.AddWithValue("@Gender", genderDropDownList.SelectedValue);
                    cmd.Parameters.AddWithValue("@PhoneNumber", phoneNumber.Text);
                    cmd.Parameters.AddWithValue("@Email", email.Text);
                    cmd.Parameters.AddWithValue("@StreetAddress", street.Text);
                    cmd.Parameters.AddWithValue("@Town", town.Text);
                    cmd.Parameters.AddWithValue("@PostalCode", postalCode.Text);
                    cmd.Parameters.AddWithValue("@Course", courseDropDownList.SelectedValue);
                    cmd.Parameters.AddWithValue("@StudentNumber", studentNumber);
                    cmd.Parameters.AddWithValue("@Password", plainPassword); 
                    cmd.Parameters.AddWithValue("@Module1", module1);
                    cmd.Parameters.AddWithValue("@Module2", module2);

                    cmd.ExecuteNonQuery();
                }

         
                DisplayConfirmation(studentNumber);
                ClearFormFields();
            }
        }

        private void ShowError(string message)
        {
            errorMessage.Text = message;
            errorMessage.Visible = true;
        }

        private void DisplayConfirmation(string studentNumber)
        {
            confirmationPanel.Visible = true;
            confirmationMessage.Text = "Registration successful!";
            lblStudentNumber.Text = studentNumber;
            lblStudentName.Text = name.Text;
            lblStudentSurname.Text = surname.Text;
            lblStudentID.Text = idNumber.Text;
            lblCourseRegistered.Text = courseDropDownList.SelectedValue;
            lblModulesRegistered.Text = string.Join(", ", moduleCheckBoxList.Items.Cast<ListItem>().Where(i => i.Selected).Select(i => i.Text));
        }

        private bool IsIdNumberExists(SqlConnection conn, string idNumber)
        {
            string sql = "SELECT COUNT(*) FROM Student WHERE IdNumber = @IdNumber";
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.AddWithValue("@IdNumber", idNumber);
                int count = (int)cmd.ExecuteScalar();
                return count > 0; 
            }
        }

        private bool IsValidEmail(string email)
        {
            try
            {
                var mail = new System.Net.Mail.MailAddress(email);
                return mail.Address == email;
            }
            catch
            {
                return false;
            }
        }

        private string GenerateUniqueStudentNumber()
        {
            Random random = new Random();
            int studentNumber = random.Next(10000000, 99999999);
            return studentNumber.ToString();
        }

        private void ClearFormFields()
        {
            name.Text = "";
            surname.Text = "";
            idNumber.Text = "";
            genderDropDownList.SelectedIndex = 0;
            phoneNumber.Text = "";
            email.Text = "";
            street.Text = "";
            town.Text = "";
            postalCode.Text = "";
            courseDropDownList.SelectedIndex = 0;
            moduleCheckBoxList.Items.Clear();
            password.Text = "";
            confirmPassword.Text = "";
        }
    }
}
