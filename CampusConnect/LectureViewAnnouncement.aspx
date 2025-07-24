<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LectureViewAnnouncement.aspx.cs" Inherits="CampusConnect.LectureViewAnnouncement" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>View Announcements</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
        }
        .grid-view {
            width: 100%;
            border-collapse: collapse;
        }
        .grid-view th, .grid-view td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        .grid-view th {
            background-color: #007BFF;
            color: white;
        }
        .view-button {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
        }
        .view-button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>View Announcements</h2>
            <asp:GridView ID="gvAnnouncements" runat="server" AutoGenerateColumns="False" CssClass="grid-view">
                <Columns>
                    <asp:BoundField DataField="Title" HeaderText="Title" />
                    <asp:BoundField DataField="PostedBy" HeaderText="Posted By" />
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:Button ID="btnView" runat="server" Text="View" CommandArgument='<%# Eval("ID") %>' OnClick="btnView_Click" CssClass="view-button" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
