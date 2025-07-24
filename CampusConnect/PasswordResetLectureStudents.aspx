<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PasswordResetLectureStudents.aspx.cs" Inherits="CampusConnect.PasswordResetLectureStudents" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reset Password</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <style>
        body {
            background-image: linear-gradient(to right, #00c6ff, #0072ff);
            color: #333;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .reset-container {
            width: 100%;
            max-width: 400px;
            padding: 30px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        .form-control {
            margin-bottom: 20px;
            border-radius: 25px;
        }

        .btn-custom {
            background-color: #007bff;
            color: white;
            border-radius: 25px;
            padding: 10px 20px;
            font-size: 1em;
            width: 100%;
        }

        .btn-custom:hover {
            background-color: #0056b3;
            color: #fff;
        }

        .error-message {
            color: red;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="reset-container">
            <h2>Reset Password</h2>
            <div class="form-group">
                <asp:TextBox ID="txtIdNumber" runat="server" CssClass="form-control" Placeholder="ID Number" />
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtSurname" runat="server" CssClass="form-control" Placeholder="Surname" />
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control" Placeholder="Phone Number" />
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control" TextMode="Password" Placeholder="New Password" />
            </div>
            <asp:Button ID="btnResetPassword" runat="server" CssClass="btn-custom" Text="Reset Password" OnClick="btnResetPassword_Click" />
            <asp:Label ID="lblMessage" runat="server" CssClass="error-message" Visible="False"></asp:Label>
        </div>
    </form>
</body>
</html>
