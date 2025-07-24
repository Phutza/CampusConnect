<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClearAnnouncements.aspx.cs" Inherits="CampusConnect.ClearAnnouncements" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Clear Announcements - CampusConnect</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #e9ecef;
            font-family: 'Roboto', sans-serif;
            color: #495057;
        }

        .container {
            margin-top: 40px;
            max-width: 600px;
        }

        .alert {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Clear Announcements</h2>
            <div class="alert alert-warning" role="alert">
                Are you sure you want to clear all announcements? This action cannot be undone.
            </div>
            <asp:Button ID="btnClear" runat="server" Text="Clear Announcements" CssClass="btn btn-danger" OnClick="btnClear_Click" />
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary" OnClick="btnCancel_Click" />
        </div>
    </form>
</body>
</html>
