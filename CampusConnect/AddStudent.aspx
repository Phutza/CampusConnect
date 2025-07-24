<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddStudent.aspx.cs" Inherits="CampusConnect.AddStudent" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Student - CampusConnect</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #e9ecef;
            font-family: 'Roboto', sans-serif;
            color: #495057;
        }
        .container {
            margin-top: 40px;
            max-width: 800px;
        }
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }
        .card-header {
            background-color: #007bff;
            color: #fff;
            font-size: 1.5em;
            font-weight: 500;
            border-bottom: 2px solid #0056b3;
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
        }
        .btn-custom {
            background-color: #007bff;
            color: #fff;
            border-radius: 25px;
            padding: 12px 24px;
            font-size: 1em;
            transition: background-color 0.3s, transform 0.2s;
        }
        .btn-custom:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }
        .message {
            margin: 20px 0;
            font-weight: bold;
            color: green;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="card">
                <div class="card-header">
                    Add Student
                </div>
                <div class="card-body">
                    <asp:Label ID="lblMessage" runat="server" CssClass="message" Visible="false"></asp:Label>
                    <div class="form-group">
                        <label for="txtIdNumber">ID Number</label>
                        <asp:TextBox ID="txtIdNumber" runat="server" CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="txtSurname">Surname</label>
                        <asp:TextBox ID="txtSurname" runat="server" CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="txtName">Name</label>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="ddlGender">Gender</label>
                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Select Gender" Value="" />
                            <asp:ListItem Text="Male" Value="Male" />
                            <asp:ListItem Text="Female" Value="Female" />
                            <asp:ListItem Text="Other" Value="Other" />
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="txtPhoneNumber">Phone Number</label>
                        <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="txtEmail">Email</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="txtStreetAddress">Street Address</label>
                        <asp:TextBox ID="txtStreetAddress" runat="server" CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="txtTown">Town</label>
                        <asp:TextBox ID="txtTown" runat="server" CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="txtPostalCode">Postal Code</label>
                        <asp:TextBox ID="txtPostalCode" runat="server" CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="ddlCourse">Course</label>
                        <asp:DropDownList ID="ddlCourse" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCourse_SelectedIndexChanged">
                            <asp:ListItem Text="Select Course" Value="" />
                            <asp:ListItem Text="BSc Computer Science" Value="BSc Computer Science" />
                            <asp:ListItem Text="BSc Information Systems" Value="BSc Information Systems" />
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="ddlModule1">Module 1</label>
                        <asp:DropDownList ID="ddlModule1" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Select Module" Value="" />
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="ddlModule2">Module 2</label>
                        <asp:DropDownList ID="ddlModule2" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Select Module" Value="" />
                        </asp:DropDownList>
                    </div>
                    <asp:Button ID="btnAddStudent" runat="server" Text="Add Student" OnClick="btnAddStudent_Click" CssClass="btn-custom" />
                    <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" CssClass="btn-custom" />
                </div>
            </div>
        </div>
    </form>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
