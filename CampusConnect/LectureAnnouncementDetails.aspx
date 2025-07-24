<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LectureAnnouncementDetails.aspx.cs" Inherits="CampusConnect.WebForm13" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Announcement Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
        }
        .announcement-detail {
            margin-top: 20px;
        }
        .btn-back {
            background-color: #007BFF;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }
        .btn-back:hover {
            background-color: #0056b3;
        }
        .error-message {
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Announcement Details</h2>
            <asp:Label ID="lblMessage" runat="server" CssClass="error-message"></asp:Label><br />
            <div class="announcement-detail">
                <asp:Label ID="lblTitle" runat="server" FontSize="Large" FontBold="True"></asp:Label><br />
                <asp:Label ID="lblPostedBy" runat="server" FontSize="Medium"></asp:Label><br />
                <asp:Label ID="lblPostedDate" runat="server" FontSize="Small" ForeColor="Gray"></asp:Label><br />
                <asp:Label ID="lblContent" runat="server" FontSize="Medium"></asp:Label><br />
            </div>
            <div style="text-align:center; margin-top:20px;">
                <asp:Button ID="btnBack" runat="server" Text="Back to Announcements" CssClass="btn-back" OnClick="btnBack_Click" />
            </div>
        </div>
    </form>
</body>
</html>
