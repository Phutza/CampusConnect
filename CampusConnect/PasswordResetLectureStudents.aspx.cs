using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace CampusConnect
{
    public partial class PasswordResetLectureStudents : Page
    {
        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            string idNumber = txtIdNumber.Text.Trim();
            string surname = txtSurname.Text.Trim();
            string phoneNumber = txtPhoneNumber.Text.Trim();
            string newPassword = txtNewPassword.Text.Trim();

      
            if (string.IsNullOrEmpty(idNumber) || string.IsNullOrEmpty(surname) || string.IsNullOrEmpty(phoneNumber) || string.IsNullOrEmpty(newPassword))
            {
                lblMessage.Text = "Please fill in all fields.";
                lblMessage.Visible = true;
                return;
            }

           
            string connectionString = ConfigurationManager.ConnectionStrings["Database1"].ConnectionString;

            
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

               
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Student WHERE IdNumber = @IdNumber AND Surname = @Surname AND PhoneNumber = @PhoneNumber", conn))
                {
                    cmd.Parameters.AddWithValue("@IdNumber", idNumber);
                    cmd.Parameters.AddWithValue("@Surname", surname);
                    cmd.Parameters.AddWithValue("@PhoneNumber", phoneNumber);

                    int count = (int)cmd.ExecuteScalar();
                    if (count == 1)
                    {
                        // Update password
                        SqlCommand updateCmd = new SqlCommand("UPDATE Student SET Password = @NewPassword WHERE IdNumber = @IdNumber", conn);
                        updateCmd.Parameters.AddWithValue("@NewPassword", newPassword); 
                        updateCmd.Parameters.AddWithValue("@IdNumber", idNumber);
                        updateCmd.ExecuteNonQuery();

                        lblMessage.Text = "Password reset successfully.";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        lblMessage.Visible = true;
                        return;
                    }
                }

                // Check for lecturer
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Lecturers WHERE IDNumber = @IdNumber AND Surname = @Surname AND Phone = @PhoneNumber", conn))
                {
                    cmd.Parameters.AddWithValue("@IdNumber", idNumber);
                    cmd.Parameters.AddWithValue("@Surname", surname);
                    cmd.Parameters.AddWithValue("@PhoneNumber", phoneNumber);

                    int count = (int)cmd.ExecuteScalar();
                    if (count == 1)
                    {
                        // Update password
                        SqlCommand updateCmd = new SqlCommand("UPDATE Lecturers SET Password = @NewPassword WHERE IDNumber = @IdNumber", conn);
                        updateCmd.Parameters.AddWithValue("@NewPassword", newPassword);
                        updateCmd.Parameters.AddWithValue("@IdNumber", idNumber);
                        updateCmd.ExecuteNonQuery();

                        lblMessage.Text = "Password reset successfully.";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        lblMessage.Visible = true;
                        return;
                    }
                }
            }

            lblMessage.Text = "User not found or details do not match.";
            lblMessage.Visible = true;
        }
    }
}
