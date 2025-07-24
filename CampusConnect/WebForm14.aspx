<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm14.aspx.cs" Inherits="CampusConnect.WebForm14" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Developer Info</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            width: 90%;
            max-width: 600px;
            text-align: center;
        }

        .container h2 {
            color: #333;
            margin-bottom: 20px;
        }

        .container p {
            font-size: 16px;
            color: #555;
            line-height: 1.6;
        }

        .button-group {
            margin-top: 30px;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .button-group a {
            text-decoration: none;
            padding: 12px 20px;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            background-color: #007acc;
            transition: background-color 0.3s ease;
        }

        .button-group a:hover {
            background-color: #005b99;
        }

        .button-group a.secondary {
            background-color: #555;
        }

        .button-group a.secondary:hover {
            background-color: #333;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>About the Developers</h2>
            <p>
                This system was developed by <strong>Phuti Danieljunior Matooane</strong>, a BSc in Information Technology (Computer Science and Information Systems) Final Year Student at North-West University, and <strong>Allen Makwakwa</strong>, also a BSc in Information Technology (Computer Science and Information Systems) Final Year Student at North-West University.
            </p>
            <div class="button-group">
                <a href="https://phutza.github.io/My-portfolio/" target="_blank">View Phuti Danieljunior Matooane's Profile</a>
                <a href="https://allen-makwakwa.github.io/Portfolio-Website/" target="_blank">View Allen Makwakwa's Profile</a>
                <a href="WebForm1.aspx" class="secondary">Back to Home</a>
            </div>
        </div>
    </form>
</body>
</html>
