<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddLecturer.aspx.cs" Inherits="CampusConnect.AddLecturer" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Lecturer</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e9ecef;
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
        input, select {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ced4da;
            border-radius: 4px;
        }
        .submit-btn {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
        }
        .submit-btn:hover {
            background-color: #0056b3;
        }
        .message {
            color: green;
            font-weight: bold;
            margin-top: 10px;
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
            Add Lecturer
        </div>
        <div class="container">
            <div class="dashboard">
                <div class="form-group">
                    <label for="IDNumber">ID Number:</label>
                    <asp:TextBox ID="txtIDNumber" runat="server" required="required"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="Name">Name:</label>
                    <asp:TextBox ID="txtName" runat="server" required="required"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="Surname">Surname:</label>
                    <asp:TextBox ID="txtSurname" runat="server" required="required"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="Password">Password:</label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" required="required"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="Phone">Phone:</label>
                    <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="Email">Email:</label>
                    <asp:TextBox ID="txtEmail" runat="server" required="required"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="Module1">Select Module 1:</label>
                    <asp:DropDownList ID="ddlModule1" runat="server">
                        <asp:ListItem Text="-- Select Module --" Value="" />
                        <asp:ListItem Text="Object Oriented Programming" Value="Object Oriented Programming" />
                        <asp:ListItem Text="Data Structure" Value="Data Structure" />
                        <asp:ListItem Text="C#" Value="C#" />
                        <asp:ListItem Text="System Design" Value="System Design" />
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label for="Module2">Select Module 2:</label>
                    <asp:DropDownList ID="ddlModule2" runat="server">
                        <asp:ListItem Text="-- Select Module --" Value="" />
                        <asp:ListItem Text="Object Oriented Programming" Value="Object Oriented Programming" />
                        <asp:ListItem Text="Data Structure" Value="Data Structure" />
                        <asp:ListItem Text="C#" Value="C#" />
                        <asp:ListItem Text="System Design" Value="System Design" />
                    </asp:DropDownList>
                </div>
                <asp:Button ID="btnAddLecturer" runat="server" Text="Add Lecturer" CssClass="submit-btn" OnClick="btnAddLecturer_Click" />
                
                <asp:Label ID="lblMessage" runat="server" CssClass="message" Visible="false"></asp:Label>
            </div>
        </div>
        <div class="footer">
            
        </div>
    </form>
</body>
</html>
