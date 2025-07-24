using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace CampusConnect
{
    public partial class EditStudentDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStudents();
            }
        }

        // Load all students from the database
        private void LoadStudents()
        {
            string connStr = ConfigurationManager.ConnectionStrings["Database1"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Student", conn);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                gvStudents.DataSource = dt;
                gvStudents.DataBind();
            }
        }

        // Handle the Edit button click event
        protected void gvStudents_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditStudent")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvStudents.Rows[rowIndex];

                // Fetch student details from the selected row
                txtIdNumber.Text = row.Cells[2].Text;
                txtStudentNumber.Text = row.Cells[1].Text;
                txtName.Text = row.Cells[3].Text;
                txtSurname.Text = row.Cells[4].Text;
                txtEmail.Text = row.Cells[5].Text;
            }
        }

        // Update student details in the database
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["Database1"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("UPDATE Student SET Name = @Name, Surname = @Surname, Email = @Email, PhoneNumber = @PhoneNumber, StreetAddress = @StreetAddress, Town = @Town, PostalCode = @PostalCode WHERE StudentNumber = @StudentNumber", conn);

                cmd.Parameters.AddWithValue("@Name", txtName.Text);
                cmd.Parameters.AddWithValue("@Surname", txtSurname.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@PhoneNumber", txtPhoneNumber.Text);
                cmd.Parameters.AddWithValue("@StreetAddress", txtStreetAddress.Text);
                cmd.Parameters.AddWithValue("@Town", txtTown.Text);
                cmd.Parameters.AddWithValue("@PostalCode", txtPostalCode.Text);
                cmd.Parameters.AddWithValue("@StudentNumber", txtStudentNumber.Text);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }

            // Reload the student list after the update
            LoadStudents();
        }
    }
}
