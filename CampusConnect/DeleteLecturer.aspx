<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteLecturer.aspx.cs" Inherits="CampusConnect.DeleteLecturer" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Delete Lecturer - CampusConnect</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #e9ecef;
            font-family: 'Roboto', sans-serif;
            color: #495057;
        }
        .container {
            margin-top: 40px;
            max-width: 1200px;
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
        .message {
            margin: 20px 0;
            font-weight: bold;
            color: green;
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="card">
                <div class="card-header">
                    Delete Lecturer
                </div>
                <div class="card-body">
                    <asp:Label ID="lblMessage" runat="server" CssClass="message" Visible="false"></asp:Label>
                    <asp:GridView ID="gvLecturers" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="IDNumber" HeaderText="ID Number" />
                            <asp:BoundField DataField="Name" HeaderText="Name" />
                            <asp:BoundField DataField="Surname" HeaderText="Surname" />
                            <asp:BoundField DataField="Email" HeaderText="Email" />
                            <asp:BoundField DataField="Phone" HeaderText="Phone" />
                            <asp:BoundField DataField="Module1" HeaderText="Module 1" />
                            <asp:BoundField DataField="Module2" HeaderText="Module 2" />
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandArgument='<%# Eval("Id") %>' OnClick="btnDelete_Click" CssClass="btn btn-danger" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" CssClass="btn btn-custom" />
                </div>
            </div>
        </div>
    </form>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
