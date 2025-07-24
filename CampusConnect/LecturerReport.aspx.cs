using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace CampusConnect
{
    public partial class LecturerReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadLecturerData();
                lblTimestamp.Text = DateTime.Now.ToString("f"); // Display current date and time
            }
        }

        private void LoadLecturerData()
        {
            string connStr = ConfigurationManager.ConnectionStrings["Database1"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Lecturers", conn);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                gvLecturers.DataSource = dt;
                gvLecturers.DataBind();

                // Set total number of lecturers
                lblTotalLecturers.Text = dt.Rows.Count.ToString();
            }
        }
    }
}
