<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentReport.aspx.cs" Inherits="CampusConnect.StudentReport" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Student Report</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 10px; /* Reduced padding for smaller screens */
        }
        .container {
            width: 100%;
            max-width: 1000px; /* Reduced max width */
            margin: auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            overflow-x: auto; /* Allow horizontal scroll if needed */
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px; /* Added margin for spacing */
        }
        .filter {
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .filter label {
            margin-right: 10px;
            font-weight: bold;
        }
        #ddlCourseFilter {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 200px; /* Adjusted width for better fit */
        }
        #StudentsGridView {
            width: 100%; 
            border-collapse: collapse;
            margin-top: 20px;
            overflow-x: auto; /* Added overflow for horizontal scrolling */
            display: block; /* Make grid a block element */
        }
        #StudentsGridView th, #StudentsGridView td {
            border: 1px solid #ddd;
            padding: 8px; /* Reduced padding for smaller screens */
            text-align: left;
            min-width: 120px; /* Ensure a minimum width for readability */
        }
        #StudentsGridView th {
            background-color: #007BFF;
            color: white;
        }
        #StudentsGridView tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        #StudentsGridView tr:hover {
            background-color: #f1f1f1;
        }
        #lblTotalStudents {
            font-weight: bold;
            margin-top: 20px;
            text-align: right;
            display: block;
        }
        .button-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .back-button {
            width: 100%;
            max-width: 250px; /* Reduced max width */
            padding: 10px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            text-align: center;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }
        .back-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Student Report</h2>
            <asp:Label ID="lblDateTime" runat="server" />
            <div class="filter">
                <asp:Label ID="lblCourseFilter" runat="server" Text="Filter by Course:"></asp:Label>
                <asp:DropDownList ID="ddlCourseFilter" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCourseFilter_SelectedIndexChanged">
                    <asp:ListItem Value="">--Select Course--</asp:ListItem>
                    <asp:ListItem Value="BSc Computer Science">BSc Computer Science</asp:ListItem>
                    <asp:ListItem Value="BSc Information Systems">BSc Information Systems</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div style="overflow-x: auto;"> <!-- Added scroll container -->
                <asp:GridView ID="StudentsGridView" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="StudentNumber" HeaderText="Student Number" />
                        <asp:BoundField DataField="Name" HeaderText="Name" />
                        <asp:BoundField DataField="Surname" HeaderText="Surname" />
                        <asp:BoundField DataField="Gender" HeaderText="Gender" />
                        <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:BoundField DataField="StreetAddress" HeaderText="Street Address" />
                        <asp:BoundField DataField="Town" HeaderText="Town" />
                        <asp:BoundField DataField="PostalCode" HeaderText="Postal Code" />
                        <asp:BoundField DataField="Module1_Test1" HeaderText="Module 1 Test 1" />
                        <asp:BoundField DataField="Module1_Test2" HeaderText="Module 1 Test 2" />
                        <asp:BoundField DataField="Module1_ModuleMark" HeaderText="Module 1 Mark" />
                        <asp:BoundField DataField="Module2_Test1" HeaderText="Module 2 Test 1" />
                        <asp:BoundField DataField="Module2_Test2" HeaderText="Module 2 Test 2" />
                        <asp:BoundField DataField="Module2_ModuleMark" HeaderText="Module 2 Mark" />
                        <asp:BoundField DataField="Course" HeaderText="Course" />
                    </Columns>
                </asp:GridView>
            </div>
            <asp:Label ID="lblTotalStudents" runat="server" Text=""></asp:Label>
            
            <!-- Back Button -->
            <div class="button-container">
                <asp:Button ID="btnBack" runat="server" Text="Back to Admin Dashboard" CssClass="back-button" OnClick="btnBack_Click" />
            </div>
        </div>
    </form>
</body>
</html>
