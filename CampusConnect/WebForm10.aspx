<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm10.aspx.cs" Inherits="CampusConnect.MarksReport" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Marks Report</title>
    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .container {
            margin-top: 20px;
        }
        h2, h4, h5 {
            color: #343a40;
        }
        .report-summary {
            margin-top: 20px;
            font-size: 1.1em;
            background-color: #e9ecef;
            padding: 15px;
            border-radius: 5px;
        }
        .error-message {
            color: red;
        }
        .comment-section {
            margin-top: 20px;
            font-style: italic;
        }
        .report-title {
            font-weight: bold;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Student Marks Report</h2>

            <div class="form-group">
                <label for="ddlModule">Select Module:</label>
                <asp:DropDownList ID="ddlModule" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>

            <div class="form-group">
                <label for="ddlFilter">Filter by:</label>
                <asp:DropDownList ID="ddlFilter" runat="server" CssClass="form-control">
                    <asp:ListItem Text="All" Value="All" />
                    <asp:ListItem Text="Passed" Value="Passed" />
                    <asp:ListItem Text="Failed" Value="Failed" />
                    <asp:ListItem Text="Distinction" Value="Distinction" />
                </asp:DropDownList>
            </div>

            <asp:Button ID="btnFilter" runat="server" Text="Generate Report" OnClick="btnFilter_Click" CssClass="btn btn-primary" />

            <asp:Label ID="lblMessage" runat="server" CssClass="error-message" />

            <h4 class="report-title">
                <asp:Label ID="lblReportTitle" runat="server" Text=""></asp:Label>
            </h4>

            <h5>
                <asp:Label ID="lblDateTime" runat="server" Text=""></asp:Label>
            </h5>

            <asp:GridView ID="gvMarks" runat="server" AutoGenerateColumns="False" CssClass="table table-striped">
                <Columns>
                    <asp:BoundField DataField="StudentNumber" HeaderText="Student Number" />
                    <asp:BoundField DataField="Surname" HeaderText="Surname" />
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="Module1_Test1" HeaderText="Test 1 Mark" />
                    <asp:BoundField DataField="Module1_Test2" HeaderText="Test 2 Mark" />
                    <asp:BoundField DataField="Module1_ModuleMark" HeaderText="Module Mark" />
                </Columns>
            </asp:GridView>

            <div class="report-summary">
                <asp:Label ID="lblSummary" runat="server" Text=""></asp:Label>
            </div>

            <div class="comment-section">
                <h5>
                    <asp:Label ID="lblComments" runat="server" Text=""></asp:Label>
                </h5>
            </div>
        </div>
    </form>
</body>
</html>
