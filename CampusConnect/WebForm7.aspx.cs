using System;
using System.Web.UI;

namespace CampusConnect
{
    public partial class WebForm7 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["LecturerStaffNumber"] != null && Session["LecturerSurname"] != null)
                {
                    string staffNumber = Session["LecturerStaffNumber"].ToString();
                    string surname = Session["LecturerSurname"].ToString();
                    lblLoggedInAs.Text = $"{staffNumber} Surname: {surname} (Lecturer)";
                }
                else
                {
                    Response.Redirect("WebForm3.aspx");
                }
            }
        }

        protected void btnMaintainMarks_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/MaintainModuleMarks.aspx");
        }

        protected void btnMaintainLecturers_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/WebForm8.aspx");
        }

        protected void btnGenerateReports_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/WebForm10.aspx");
        }

        protected void btnSendAnnouncement_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/LectureSendAnnouncements.aspx");
        }

        protected void btnViewAnnouncements_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ViewAnnouncements.aspx");
        }
    }
}
