<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentDetails.aspx.cs" Inherits="CampusConnect.StudentDetails" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            color: #333;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #4a90e2;
        }
        .student-info {
            margin-bottom: 20px;
        }
        .student-info label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .student-info p {
            margin: 0;
            padding: 8px;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .form-actions {
            text-align: center;
        }
        .form-actions input[type="button"], .form-actions input[type="submit"] {
            background-color: #4a90e2;
            color: #fff;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 4px;
            margin: 0 10px;
        }
        .form-actions input[type="button"]:hover, .form-actions input[type="submit"]:hover {
            background-color: #357abd;
        }
        .form-actions input[type="button"] {
            background-color: #e94e77;
        }
        .form-actions input[type="button"]:hover {
            background-color: #c43c62;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Student Details</h1>
            
            <div class="student-info">
                <label for="lblStudentNumber">Student Number:</label>
                <asp:Label ID="lblStudentNumber" runat="server" CssClass="field-value"></asp:Label>
            </div>
            
            <div class="student-info">
                <label for="lblIdNumber">ID Number:</label>
                <asp:Label ID="lblIdNumber" runat="server" CssClass="field-value"></asp:Label>
            </div>
            
            <div class="student-info">
                <label for="lblName">Name:</label>
                <asp:Label ID="lblName" runat="server" CssClass="field-value"></asp:Label>
            </div>
            
            <div class="student-info">
                <label for="lblSurname">Surname:</label>
                <asp:Label ID="lblSurname" runat="server" CssClass="field-value"></asp:Label>
            </div>
            
            <div class="student-info">
                <label for="lblGender">Gender:</label>
                <asp:Label ID="lblGender" runat="server" CssClass="field-value"></asp:Label>
            </div>
            
            <div class="student-info">
                <label for="lblPhoneNumber">Phone Number:</label>
                <asp:Label ID="lblPhoneNumber" runat="server" CssClass="field-value"></asp:Label>
            </div>
            
            <div class="student-info">
                <label for="lblEmail">Email:</label>
                <asp:Label ID="lblEmail" runat="server" CssClass="field-value"></asp:Label>
            </div>
            
            <div class="student-info">
                <label for="lblStreetAddress">Street Address:</label>
                <asp:Label ID="lblStreetAddress" runat="server" CssClass="field-value"></asp:Label>
            </div>
            
            <div class="student-info">
                <label for="lblTown">Town:</label>
                <asp:Label ID="lblTown" runat="server" CssClass="field-value"></asp:Label>
            </div>
            
            <div class="student-info">
                <label for="lblPostalCode">Postal Code:</label>
                <asp:Label ID="lblPostalCode" runat="server" CssClass="field-value"></asp:Label>
            </div>
            
            <div class="student-info">
                <label for="lblCourse">Course:</label>
                <asp:Label ID="lblCourse" runat="server" CssClass="field-value"></asp:Label>
            </div>
            
            <div class="student-info">
                <label for="lblModule1">Module 1:</label>
                <asp:Label ID="lblModule1" runat="server" CssClass="field-value"></asp:Label>
            </div>
            
            <div class="student-info">
                <label for="lblModule2">Module 2:</label>
                <asp:Label ID="lblModule2" runat="server" CssClass="field-value"></asp:Label>
            </div>
            
            <div class="form-actions">
                <asp:Button ID="btnEditDetails" runat="server" Text="Edit Details" OnClick="btnEditDetails_Click" />
                <asp:Button ID="btnDeregister" runat="server" Text="Deregister" OnClick="btnDeregister_Click" CssClass="btn-cancel" />
            </div>
        </div>
    </form>
</body>
</html>
