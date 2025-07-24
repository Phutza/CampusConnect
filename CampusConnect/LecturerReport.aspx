<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LecturerReport.aspx.cs" Inherits="CampusConnect.LecturerReport" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lecturer Report</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }
        .container {
            margin-top: 40px;
        }
        h1 {
            color: #007bff;
            text-align: center;
            margin-bottom: 30px;
        }
        table {
            width: 100%;
            margin-bottom: 20px;
        }
        th {
            background-color: #007bff;
            color: white;
            padding: 10px;
            text-align: left;
        }
        td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        .report-summary {
            margin-top: 20px;
            font-size: 1.2em;
        }
        .timestamp {
            text-align: right;
            font-style: italic;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Lecturer Report</h1>
            <asp:GridView ID="gvLecturers" runat="server" AutoGenerateColumns="False" CssClass="table table-striped">
                <Columns>
                    <asp:BoundField DataField="StaffNumber" HeaderText="Staff Number" />
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="Surname" HeaderText="Surname" />
                    <asp:BoundField DataField="IDNumber" HeaderText="ID Number" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone Number" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="Module1" HeaderText="Module 1" />
                    <asp:BoundField DataField="Module2" HeaderText="Module 2" />
                </Columns>
            </asp:GridView>

            <div class="report-summary">
                Total Registered Lecturers: <asp:Label ID="lblTotalLecturers" runat="server" Text="0"></asp:Label>
            </div>
            <div class="timestamp">
                Report generated on: <asp:Label ID="lblTimestamp" runat="server"></asp:Label>
            </div>
        </div>
    </form>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
