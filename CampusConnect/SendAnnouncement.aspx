<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SendAnnouncement.aspx.cs" Inherits="CampusConnect.SendAnnouncement" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Send Announcement</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fa;
            margin: 0;
            padding: 20px;
        }

        #form1 {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            max-width: 600px;
            margin: auto;
        }

        h2 {
            color: #333;
            text-align: center;
        }

        label {
            font-weight: bold;
            margin-top: 10px;
        }

        input[type="text"], textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
        }

        textarea {
            height: 150px; /* Enlarged textbox */
            resize: none;  /* Disable resizing */
        }

        input[type="checkbox"] {
            margin-top: 10px;
        }

        button {
            background-color: #007BFF;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
        }

        button:hover {
            background-color: #0056b3;
        }

        .message {
            color: red;
            text-align: center;
        }

        .gridview {
            margin-top: 20px;
            width: 100%;
            border-collapse: collapse;
        }

        .gridview th, .gridview td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        .gridview th {
            background-color: #007BFF;
            color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Send Announcement</h2>
            <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label><br />
            <label for="txtTitle">Title</label>
            <asp:TextBox ID="txtTitle" runat="server" placeholder="Title"></asp:TextBox><br />
            
            <label for="txtAnnouncement">Announcement</label>
            <asp:TextBox ID="txtAnnouncement" runat="server" TextMode="MultiLine" placeholder="Announcement"></asp:TextBox><br />
            
            <label for="txtPostedBy">Posted By</label>
            <asp:TextBox ID="txtPostedBy" runat="server" placeholder="Posted By"></asp:TextBox><br />
            
            <asp:CheckBox ID="chkIsForStudents" runat="server" Text="Is for Students" /><br />
            
            <asp:Button ID="btnSend" runat="server" Text="Send Announcement" OnClick="btnSend_Click" /><br />
            
            <asp:Button ID="btnBackToDashboard" runat="server" Text="Back to Dashboard" OnClick="btnBackToDashboard_Click" /><br />
            
            <asp:GridView ID="gvAnnouncements" runat="server" CssClass="gridview"></asp:GridView>
        </div>
    </form>
</body>
</html>
