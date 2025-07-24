<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateStudentDetails.aspx.cs" Inherits="CampusConnect.UpdateStudentDetails" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>Update Student Details</title>
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .form-group button {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .form-group button:hover {
            background-color: #218838;
        }
        .confirmation, .error {
            margin-top: 15px;
            padding: 10px;
            border-radius: 4px;
        }
        .confirmation {
            background-color: #d4edda;
            color: #155724;
        }
        .error {
            background-color: #f8d7da;
            color: #721c24;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Update Student Details</h1>
        <form id="updateForm" runat="server">
            <div class="form-group">
                <label for="idNumber">ID Number</label>
                <asp:TextBox ID="txtIdNumber" runat="server" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="studentNumber">Student Number</label>
                <asp:TextBox ID="txtStudentNumber" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="name">Name</label>
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="surname">Surname</label>
                <asp:TextBox ID="txtSurname" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="phoneNumber">Phone Number</label>
                <asp:TextBox ID="txtPhoneNumber" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="street">Street Address</label>
                <asp:TextBox ID="txtStreet" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="town">Town</label>
                <asp:TextBox ID="txtTown" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="postalCode">Postal Code</label>
                <asp:TextBox ID="txtPostalCode" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Button ID="btnSave" runat="server" Text="Save Changes" OnClick="btnSave_Click" CssClass="btn-save" />
            </div>
            <asp:Panel ID="confirmationPanel" runat="server" CssClass="confirmation" Visible="false">
                <asp:Label ID="lblConfirmationMessage" runat="server" Text=""></asp:Label>
            </asp:Panel>
            <asp:Panel ID="errorPanel" runat="server" CssClass="error" Visible="false">
                <asp:Label ID="lblErrorMessage" runat="server" Text=""></asp:Label>
            </asp:Panel>
        </form>
    </div>
</body>
</html>
