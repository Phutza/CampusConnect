<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HelpPage.aspx.cs" Inherits="CampusConnect.HelpPage" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>Help Page</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f4f8;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #007BFF;
            text-align: center;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }
        .form-group input,
        .form-group textarea,
        .form-group select {
            width: 100%;
            padding: 12px;
            border: 1px solid #007BFF;
            border-radius: 5px;
            transition: border-color 0.3s;
        }
        .form-group input:focus,
        .form-group textarea:focus,
        .form-group select:focus {
            border-color: #0056b3;
            outline: none;
        }
        .form-group button {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 12px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s;
        }
        .form-group button:hover {
            background-color: #0056b3;
        }
        .message {
            margin-top: 20px;
            color: green;
            font-weight: bold;
            text-align: center;
        }
        .ticket {
            margin-top: 20px;
            padding: 15px;
            background-color: #e7f5ff;
            border: 1px solid #007BFF;
            border-radius: 5px;
            color: #0056b3;
            text-align: center;
        }
        .contact-emails {
            margin-top: 30px;
            text-align: center;
            font-size: 14px;
            color: #333;
        }
        .contact-emails a {
            color: #007BFF;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Help & Support</h2>
            <div class="form-group">
                <label for="txtName">Your Name:</label>
                <asp:TextBox ID="txtName" runat="server" placeholder="Enter your name" required></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtEmail">Your Email:</label>
                <asp:TextBox ID="txtEmail" runat="server" type="email" placeholder="Enter your email" required></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="ddlIssueType">Issue Type:</label>
                <asp:DropDownList ID="ddlIssueType" runat="server" required>
                    <asp:ListItem Text="Select Issue Type" Value="" />
                    <asp:ListItem Text="Technical Support" Value="Technical Support" />
                    <asp:ListItem Text="Billing Inquiry" Value="Billing Inquiry" />
                    <asp:ListItem Text="General Question" Value="General Question" />
                    <asp:ListItem Text="Feedback" Value="Feedback" />
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="txtIssueDescription">Description:</label>
                <asp:TextBox ID="txtIssueDescription" runat="server" TextMode="MultiLine" Rows="4" placeholder="Describe your issue here..." required></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="SubmitHelpForm" />
            </div>
            <asp:Label ID="lblMessage" runat="server" CssClass="message" Visible="false"></asp:Label>
            <asp:Label ID="lblTicket" runat="server" CssClass="ticket" Visible="false"></asp:Label>
            
            <!-- Additional contact information -->
            <div class="contact-emails">
                <p>For further assistance, you can also contact us at:</p>
                <p>
                    <a href="mailto:support@campusconnect.com">support@campusconnect.com</a> | 
                    <a href="mailto:info@campusconnect.com">info@campusconnect.com</a>
                </p>
            </div>
        </div>
    </form>
</body>
</html>
