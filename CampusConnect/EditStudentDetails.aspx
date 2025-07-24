<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditStudentDetails.aspx.cs" Inherits="CampusConnect.EditStudentDetails" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Student Details</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 40px;
        }
        h1 {
            color: #007bff;
            text-align: center;
            margin-bottom: 30px;
        }
        table {
            margin-bottom: 40px;
        }
        .form-container {
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        label {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Edit Student Details</h1>

            <!-- Student List Table -->
            <asp:GridView ID="gvStudents" runat="server" AutoGenerateColumns="false" CssClass="table table-striped" OnRowCommand="gvStudents_RowCommand">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="ID" Visible="false" />
                    <asp:BoundField DataField="StudentNumber" HeaderText="Student Number" />
                    <asp:BoundField DataField="IdNumber" HeaderText="ID Number" />
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="Surname" HeaderText="Surname" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:ButtonField ButtonType="Button" CommandName="EditStudent" Text="Edit" />
                </Columns>
            </asp:GridView>

            <!-- Edit Student Form -->
            <div class="form-container">
                <h3>Edit Student Information</h3>
                <div class="form-group">
                    <label>ID Number:</label>
                    <asp:TextBox ID="txtIdNumber" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Student Number:</label>
                    <asp:TextBox ID="txtStudentNumber" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Name:</label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Surname:</label>
                    <asp:TextBox ID="txtSurname" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Email:</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Phone Number:</label>
                    <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Street Address:</label>
                    <asp:TextBox ID="txtStreetAddress" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Town:</label>
                    <asp:TextBox ID="txtTown" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Postal Code:</label>
                    <asp:TextBox ID="txtPostalCode" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-primary" Text="Update" OnClick="btnUpdate_Click" />
            </div>
        </div>
    </form>
</body>
</html>
