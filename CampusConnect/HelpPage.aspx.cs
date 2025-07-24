using System;

namespace CampusConnect
{
    public partial class HelpPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SubmitHelpForm(object sender, EventArgs e)
        {
            // Generate a unique ticket number (for example, based on the current timestamp)
            string ticketNumber = GenerateTicketNumber();
            lblMessage.Text = "Thank you for reaching out! Your request has been added to the queue.";
            lblTicket.Text = $"Your ticket number is: {ticketNumber}. We will get back to you shortly.";
            lblMessage.Visible = true;
            lblTicket.Visible = true;

            // Clear the form fields after submission
            txtName.Text = string.Empty;
            txtEmail.Text = string.Empty;
            ddlIssueType.SelectedIndex = 0;
            txtIssueDescription.Text = string.Empty;
        }

        private string GenerateTicketNumber()
        {
            // Simple ticket number generation logic (you can customize this)
            return "TKT-" + DateTime.Now.ToString("yyyyMMddHHmmss");
        }
    }
}
