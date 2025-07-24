<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeregistrationSuccess.aspx.cs" Inherits="CampusConnect.DeregistrationSuccess" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Deregistration Success</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .success-message {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .success-message h1 {
            color: #4CAF50;
            margin-bottom: 20px;
        }
        .success-message p {
            font-size: 18px;
            margin-bottom: 30px;
        }
        .btn-dashboard {
            display: inline-block;
            padding: 15px 25px;
            background-color: #3f51b5;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        .btn-dashboard:hover {
            background-color: #303f9f;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="success-message">
            <h1>Successfully Deregistered</h1>
            <p>You have been successfully deregistered from Campus Connect.</p>
            <asp:Button ID="btnBackToDashboard" runat="server" CssClass="btn-dashboard" Text="Back to Dashboard" PostBackUrl="~/WebForm1.aspx" />
        </div>
    </form>
</body>
</html>
