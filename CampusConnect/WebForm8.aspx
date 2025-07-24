<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm8.aspx.cs" Inherits="CampusConnect.WebForm8" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lecturer Module Selection</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 50px;
        }
        .container {
            width: 100%;
            max-width: 800px;
            margin: 0 auto;
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
        .module-selection {
            margin-bottom: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1 class="header">Select Module to View Lecturers</h1>
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
            
      
            <div class="module-selection">
                <asp:Label ID="lblModuleSelect" runat="server" Text="Select Module:"></asp:Label>
                <asp:DropDownList ID="ddlModules" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlModules_SelectedIndexChanged">
                </asp:DropDownList>
            </div>

           
            <h2>Lecturers Registered for Selected Module</h2>
            <asp:GridView ID="gvLecturers" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="StaffNumber" HeaderText="Staff Number" />
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="Surname" HeaderText="Surname" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
