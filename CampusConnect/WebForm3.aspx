<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="CampusConnect.WebForm3" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CampusConnect Login</title>
   
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <style>
        body {
            background-image: linear-gradient(to right, #00c6ff, #0072ff);
            color: #333;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            flex-direction: column; 
            justify-content: center;
            align-items: center;
        }

        .login-container {
            width: 100%;
            max-width: 400px;
            padding: 30px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            text-align: center;
            margin-top: 80px; 
        }

        .login-header {
            margin-bottom: 20px;
        }

        .login-header img {
            width: 100px;
            margin-bottom: 10px;
        }

        .login-header h2 {
            font-size: 1.5em;
            color: #007bff;
            margin: 0;
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

        .additional-links {
            margin-top: 15px;
        }

        .additional-links a {
            color: #007bff;
            font-size: 0.9em;
            text-decoration: none;
        }

        .additional-links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div class="login-container">
            <div class="login-header">
                <img src="https://www.icicicareers.com/campusconnect/images/logo.png" alt="CampusConnect Logo" />
                <h2>CampusConnect Login</h2>
            </div>
            
            <div class="form-group">
                <asp:TextBox ID="username" runat="server" CssClass="form-control" Placeholder="Username" />
            </div>
            <div class="form-group">
                <asp:TextBox ID="password" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Password" />
            </div>
            <div class="form-group">
                <asp:DropDownList ID="role" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Select a Role" Value="" />
                    <asp:ListItem Text="Student" Value="Student" />
                    <asp:ListItem Text="Lecturer" Value="Lecturer" />
                </asp:DropDownList>
            </div>
            <asp:Button ID="btnLogin" runat="server" CssClass="btn-custom" Text="Login" OnClick="btnLogin_Click" />
           
            <div class="additional-links">
                <a href="PasswordResetLectureStudents.aspx">Forgot Password?</a><br />
                <a href="HelpPage.aspx">Need Help?</a><br />
                <a href="Webform1.aspx">Back to Home</a> 
            </div>
           
            <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red" Visible="False"></asp:Label>
        </div>
    </form>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
