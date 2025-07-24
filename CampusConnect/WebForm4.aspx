<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Webform4.aspx.cs" Inherits="CampusConnect.Register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Registration</title>
  
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f5f5f5;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 0;
            margin: 0;
        }

        .container {
            max-width: 600px;
            margin-top: 50px;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
        }

        .form-group label {
            font-weight: bold;
        }

        .btn-custom {
            background-color: #007bff;
            color: #fff;
            border-radius: 20px;
            padding: 10px;
        }

        .btn-custom:hover {
            background-color: #0056b3;
        }

        .error-message {
            color: red;
            display: none;
        }

        .confirmation-message {
            margin-top: 20px;
            color: green;
            font-size: 16px;
        }

        .student-details {
            margin-top: 20px;
            background-color: #e9ffe9;
            padding: 15px;
            border-radius: 10px;
            border: 1px solid #90ee90;
        }

        .back-button {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2 class="text-center">Student Registration</h2>

           
            <div class="form-group">
                <label for="name">Name</label>
                <asp:TextBox ID="name" runat="server" CssClass="form-control" Placeholder="Enter your name"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="surname">Surname</label>
                <asp:TextBox ID="surname" runat="server" CssClass="form-control" Placeholder="Enter your surname"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="idNumber">ID Number</label>
                <asp:TextBox ID="idNumber" runat="server" CssClass="form-control" Placeholder="Enter your ID number"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="gender">Gender</label>
                <asp:DropDownList ID="genderDropDownList" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Select Gender" Value="" />
                    <asp:ListItem Text="Male" Value="Male" />
                    <asp:ListItem Text="Female" Value="Female" />
                    <asp:ListItem Text="Other" Value="Other" />
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="phoneNumber">Phone Number</label>
                <asp:TextBox ID="phoneNumber" runat="server" CssClass="form-control" Placeholder="Enter your phone number"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <asp:TextBox ID="email" runat="server" CssClass="form-control" Placeholder="Enter your email"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="street">Street Address</label>
                <asp:TextBox ID="street" runat="server" CssClass="form-control" Placeholder="Enter your street address"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="town">Town</label>
                <asp:TextBox ID="town" runat="server" CssClass="form-control" Placeholder="Enter your town"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="postalCode">Postal Code</label>
                <asp:TextBox ID="postalCode" runat="server" CssClass="form-control" Placeholder="Enter your postal code"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="course">Course</label>
                <asp:DropDownList ID="courseDropDownList" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="courseDropDownList_SelectedIndexChanged">
                    <asp:ListItem Text="Select Course" Value="" />
                    <asp:ListItem Text="BSc Computer Science" Value="BSc Computer Science" />
                    <asp:ListItem Text="BSc Information Systems" Value="BSc Information Systems" />
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="module">Modules</label>
                <asp:CheckBoxList ID="moduleCheckBoxList" runat="server" CssClass="form-control">
                </asp:CheckBoxList>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <asp:TextBox ID="password" runat="server" TextMode="Password" CssClass="form-control" Placeholder="Create a password"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="confirmPassword">Confirm Password</label>
                <asp:TextBox ID="confirmPassword" runat="server" TextMode="Password" CssClass="form-control" Placeholder="Confirm your password"></asp:TextBox>
                <asp:Label ID="errorMessage" runat="server" CssClass="error-message" Text="Passwords do not match." Visible="false"></asp:Label>
            </div>
            <asp:Button ID="btnRegister" runat="server" CssClass="btn btn-custom btn-block" Text="Register" OnClick="btnRegister_Click" />

          
            <asp:Panel ID="confirmationPanel" runat="server" Visible="false">
                <asp:Label ID="confirmationMessage" runat="server" CssClass="confirmation-message" Text=""></asp:Label>
                <div class="student-details">
                    <p><strong>Student Number:</strong> <asp:Label ID="lblStudentNumber" runat="server" /></p>
                    <p><strong>Name:</strong> <asp:Label ID="lblStudentName" runat="server" /></p>
                    <p><strong>Surname:</strong> <asp:Label ID="lblStudentSurname" runat="server" /></p>
                    <p><strong>ID Number:</strong> <asp:Label ID="lblStudentID" runat="server" /></p>
                    <p><strong>Course Registered:</strong> <asp:Label ID="lblCourseRegistered" runat="server" /></p>
                    <p><strong>Modules Registered:</strong> <asp:Label ID="lblModulesRegistered" runat="server" /></p>
                </div>
                <asp:Button ID="btnBack" runat="server" CssClass="btn btn-custom btn-block back-button" Text="Back" PostBackUrl="~/WebForm1.aspx" />
            </asp:Panel>

            <asp:Button ID="btnBackToHome" runat="server" CssClass="btn btn-custom btn-block back-button" Text="Back to Home" PostBackUrl="~/WebForm1.aspx" />
        </div>
    </form>


    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
