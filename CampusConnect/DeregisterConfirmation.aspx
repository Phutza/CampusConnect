<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeregisterConfirmation.aspx.cs" Inherits="CampusConnect.DeregisterConfirmation" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>Deregister Confirmation</title>
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
            color: #d9534f;
        }
        .message {
            text-align: center;
            margin-top: 20px;
            font-size: 18px;
            color: #333;
        }
        .warning {
            text-align: center;
            margin: 20px 0;
            font-size: 16px;
            color: #721c24;
        }
        .form-group {
            text-align: center;
            margin-top: 20px;
        }
        .form-group button {
            padding: 10px 20px;
            margin: 5px;
            background-color: #d9534f;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .form-group button:hover {
            background-color: #c9302c;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Deregister Confirmation</h1>
            <div class="message">
                Are you sure you want to deregister from the system?
            </div>
            <div class="warning">
                <strong>Warning:</strong> Deregistering will remove you from the system permanently.
            </div>
            <div class="form-group">
                <asp:Button ID="btnYes" runat="server" Text="Yes, Deregister" OnClick="btnYes_Click" />
                <asp:Button ID="btnNo" runat="server" Text="No, Cancel" OnClick="btnNo_Click" />
            </div>
        </div>
    </form>
</body>
</html>
