<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm11.aspx.cs" Inherits="CampusConnect.WebForm11" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Announcements</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }
        .header {
            background-color: #007bff;
            color: #fff;
            padding: 20px;
            text-align: center;
            font-size: 24px;
        }
        .container {
            width: 80%;
            margin: 30px auto;
        }
        .dashboard {
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }
        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ced4da;
            border-radius: 4px;
            min-height: 100px;
        }
        .submit-btn {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        .submit-btn:hover {
            background-color: #0056b3;
        }
        .announcement-list {
            margin-top: 20px;
        }
        .announcement-item {
            padding: 15px;
            border: 1px solid #dee2e6;
            border-radius: 4px;
            margin-bottom: 10px;
        }
        .footer {
            text-align: center;
            padding: 20px;
            font-size: 14px;
            color: #6c757d;
            background-color: #f8f9fa;
            border-top: 1px solid #dee2e6;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            Manage Announcements
        </div>
        <div class="container">
            <div class="dashboard">
                <asp:Label ID="lblLoggedInAs" runat="server" Text="Logged in as:"></asp:Label>
                <br /><br />

                <div class="form-group">
                    <asp:Button ID="btnViewAnnouncements" runat="server" Text="View Announcements" CssClass="submit-btn" OnClick="btnViewAnnouncements_Click" />
                </div>

                <asp:Panel ID="pnlSendAnnouncement" runat="server" Visible="false">
                    <div class="form-group">
                        <label for="txtAnnouncement">Enter Announcement:</label>
                        <asp:TextBox ID="txtAnnouncement" runat="server" TextMode="MultiLine" />
                    </div>
                    <asp:Button ID="btnSendAnnouncement" runat="server" Text="Send Announcement" CssClass="submit-btn" OnClick="btnSendAnnouncement_Click" />
                </asp:Panel>

                <div class="announcement-list">
                    <asp:Repeater ID="rptAnnouncements" runat="server">
                        <ItemTemplate>
                            <div class="announcement-item">
                                <strong><%# Eval("Title") %></strong><br />
                                <i><%# Eval("DatePosted", "{0:MM/dd/yyyy}") %></i>
                                <p><%# Eval("Content") %></p>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>

                <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Visible="false"></asp:Label>
            </div>
        </div>
        <div class="footer">
            
        </div>
    </form>
</body>
</html>
