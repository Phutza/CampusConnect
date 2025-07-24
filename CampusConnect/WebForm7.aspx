<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm7.aspx.cs" Inherits="CampusConnect.WebForm7" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lecturer Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .header {
            background-color: #3f51b5;
            color: #fff;
            padding: 20px;
            text-align: center;
            font-size: 24px;
        }
        .dashboard {
            padding: 20px;
            margin: 0 auto;
            width: 100%;
            max-width: 1200px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .welcome-message {
            font-size: 20px;
            margin-bottom: 20px;
        }
        .action-button {
            display: block;
            width: 220px;
            padding: 15px;
            margin: 20px auto;
            color: #fff;
            background-color: #3f51b5;
            text-align: center;
            border-radius: 5px;
            text-decoration: none;
            cursor: pointer;
            font-size: 18px;
            transition: background-color 0.3s ease;
        }
        .action-button:hover {
            background-color: #303f9f;
        }
        .notification-area {
            background-color: #ffeb3b;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
            font-weight: bold;
        }
        .activity-log {
            margin-top: 30px;
        }
        .search-container {
            margin: 20px auto;
            text-align: center;
        }
        .search-input {
            width: 50%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            CampusConnect Lecturer Dashboard
        </div>
        <div class="dashboard">
            <asp:Label ID="lblLoggedInAs" runat="server" CssClass="welcome-message"></asp:Label>
            
            <div class="notification-area">
                You have 3 new announcements and 1 upcoming deadline.
            </div>

            <div class="search-container">
                <input type="text" class="search-input" placeholder="Search Announcements or Reports..." />
            </div>

            <asp:Button ID="btnMaintainMarks" runat="server" CssClass="action-button" Text="Maintain Module Marks" OnClick="btnMaintainMarks_Click" />
            <asp:Button ID="btnMaintainLecturers" runat="server" CssClass="action-button" Text="Maintain Lecturers" OnClick="btnMaintainLecturers_Click" />
            <asp:Button ID="btnGenerateReports" runat="server" CssClass="action-button" Text="Generate Reports" OnClick="btnGenerateReports_Click" />
            <asp:Button ID="btnSendAnnouncement" runat="server" CssClass="action-button" Text="Send Announcement" OnClick="btnSendAnnouncement_Click" />
            <asp:Button ID="btnViewAnnouncements" runat="server" CssClass="action-button" Text="View Announcements" OnClick="btnViewAnnouncements_Click" />
            <asp:Button ID="btnLogOut" runat="server" CssClass="action-button" Text="Log Out" PostBackUrl="~/WebForm1.aspx" />

            <div class="activity-log">
                <h3>Recent Activities</h3>
                <ul>
                    <li>Sent an announcement on Course Updates.</li>
                    <li>Updated marks for Data Structure.</li>
                    <li>Generated report for Object oriented programming.</li>
                </ul>
            </div>
        </div>
    </form>
</body>
</html>
