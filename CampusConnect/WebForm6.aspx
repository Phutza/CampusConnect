<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm6.aspx.cs" Inherits="CampusConnect.WebForm6" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #e9ecef;
            margin: 0;
            padding: 0;
            color: #343a40;
        }
        .header {
            background-color: #007bff;
            color: #fff;
            padding: 20px;
            text-align: center;
            font-size: 24px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .dashboard {
            padding: 30px;
            margin: 20px auto;
            width: 90%;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        .welcome-message {
            font-size: 20px;
            margin-bottom: 20px;
            font-weight: 600;
        }
        .details-grid {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }
        .details-grid th, .details-grid td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }
        .details-grid th {
            background-color: #f8f9fa;
            font-weight: bold;
            text-transform: uppercase;
        }
        .details-grid tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .details-grid tr:hover {
            background-color: #e9ecef;
        }
        .button {
            display: inline-block;
            width: 220px;
            padding: 12px;
            margin: 10px 0;
            color: #fff;
            background-color: #007bff;
            text-align: center;
            border-radius: 5px;
            text-decoration: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
            font-size: 16px;
            font-weight: 500;
        }
        .button:hover {
            background-color: #0056b3;
        }
        .footer {
            text-align: center;
            padding: 15px;
            font-size: 14px;
            color: #777;
            position: relative;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            CampusConnect Student Dashboard
        </div>
        <div class="dashboard">
            <asp:Label ID="lblLoggedInAs" runat="server" CssClass="welcome-message"></asp:Label>

            <asp:GridView ID="gvStudentDetails" runat="server" AutoGenerateColumns="False" CssClass="details-grid">
                <Columns>
                    <asp:BoundField DataField="FieldName" HeaderText="Field" />
                    <asp:BoundField DataField="FieldValue" HeaderText="Value" />
                </Columns>
            </asp:GridView>

            <asp:Button ID="btnEditDetails" runat="server" CssClass="button" Text="Edit Details" OnClick="btnEditDetails_Click" />
            <asp:Button ID="btnDeregister" runat="server" CssClass="button" Text="Deregister" OnClick="btnDeregister_Click" />
            <asp:Button ID="btnViewAcademicRecords" runat="server" CssClass="button" Text="View Academic Records" PostBackUrl="~/AcademicRecords.aspx" OnClick="btnViewAcademicRecords_Click" />
            <asp:Button ID="btnViewAnnouncements" runat="server" CssClass="button" Text="View Announcements" PostBackUrl="~/ViewAnnouncements.aspx" />
            <asp:Button ID="btnLogOut" runat="server" CssClass="button" Text="Log Out" PostBackUrl="~/WebForm1.aspx" />
        </div>
        <div class="footer">
            &copy; 2024 CampusConnect. All rights reserved.
        </div>
    </form>
</body>
</html>
