<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteStudent.aspx.cs" Inherits="CampusConnect.DeleteStudent" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Delete Student</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            width: 80%;
            margin: 20px auto;
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .message {
            color: green;
            margin-bottom: 20px;
            font-weight: bold;
        }
        .error {
            color: red;
            margin-bottom: 20px;
            font-weight: bold;
        }
        .grid-view {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .grid-view th, .grid-view td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }
        .grid-view th {
            background-color: #007bff;
            color: white;
        }
        .grid-view tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .grid-view tr:hover {
            background-color: #f1f1f1;
        }
        .btn {
            padding: 10px 15px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            text-align: center;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .btn-secondary {
            background-color: #6c757d;
        }
        .btn-secondary:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Delete Student</h1>
            <asp:Label ID="lblMessage" runat="server" CssClass="message" Visible="false"></asp:Label>
            <asp:Label ID="lblError" runat="server" CssClass="error" Visible="false"></asp:Label>

            <asp:GridView ID="gvStudents" runat="server" AutoGenerateColumns="False" CssClass="grid-view">
                <Columns>
                    <asp:BoundField DataField="StudentNumber" HeaderText="Student Number" />
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="Surname" HeaderText="Surname" />
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" 
                                        CommandArgument='<%# Eval("Id") %>' 
                                        OnClick="btnDelete_Click" CssClass="btn" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <div style="text-align: center; margin-top: 20px;">
                <asp:Button ID="btnBackToDashboard" runat="server" Text="Back to Dashboard" 
                    OnClick="btnBackToDashboard_Click" CssClass="btn btn-secondary" />
            </div>
        </div>
    </form>
</body>
</html>
