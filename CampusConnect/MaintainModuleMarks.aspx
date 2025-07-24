<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaintainModuleMarks.aspx.cs" Inherits="CampusConnect.MaintainModuleMarks" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Maintain Module Marks</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            background: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        label {
            margin-top: 10px;
            display: block;
        }
        input[type="text"], input[type="number"], select {
            width: 100%;
            padding: 8px;
            margin: 5px 0 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Maintain Module Marks</h2>

            <label for="ddlModules">Select Module:</label>
            <asp:DropDownList ID="ddlModules" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlModules_SelectedIndexChanged"></asp:DropDownList>

            <label for="ddlStudents">Select Student:</label>
            <asp:DropDownList ID="ddlStudents" runat="server"></asp:DropDownList>

            <label for="txtTest1">Test 1 Marks:</label>
            <asp:TextBox ID="txtTest1" runat="server"></asp:TextBox>

            <label for="txtTest2">Test 2 Marks:</label>
            <asp:TextBox ID="txtTest2" runat="server"></asp:TextBox>

            <label for="txtModuleMark">Module Mark:</label>
            <asp:TextBox ID="txtModuleMark" runat="server"></asp:TextBox>

            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" ></asp:Label>

            <asp:Button ID="btnSubmit" runat="server" Text="Submit Marks" OnClick="btnSubmit_Click" />
            <asp:Button ID="btnViewMarks" runat="server" Text="View Marks" OnClick="btnViewMarks_Click" />

            <asp:GridView ID="gvMarks" runat="server" Visible="false" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="Test1_Module1" HeaderText="Test 1 (Module 1)" />
                    <asp:BoundField DataField="Test2_Module1" HeaderText="Test 2 (Module 1)" />
                    <asp:BoundField DataField="ModuleMark_Module1" HeaderText="Module Mark (Module 1)" />
                    <asp:BoundField DataField="Test1_Module2" HeaderText="Test 1 (Module 2)" />
                    <asp:BoundField DataField="Test2_Module2" HeaderText="Test 2 (Module 2)" />
                    <asp:BoundField DataField="ModuleMark_Module2" HeaderText="Module Mark (Module 2)" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
