<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AcademicRecords.aspx.cs" Inherits="CampusConnect.AcademicRecords" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Academic Records</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .info {
            margin-bottom: 20px;
            font-size: 16px;
        }
        .details-grid {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .details-grid th, .details-grid td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        .details-grid th {
            background-color: #f2f2f2;
        }
        .summary {
            margin-top: 20px;
            font-weight: bold;
        }
        .feedback {
            margin-top: 20px;
            padding: 15px;
            background-color: #e7f4e4;
            border-left: 5px solid #4caf50;
            font-size: 14px;
        }
        .issued-info {
            margin-top: 30px;
            padding: 15px;
            background-color: #f4f4f4;
            border-left: 5px solid #007bff;
            font-size: 14px;
        }
        .download-btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 15px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
        }
        .download-btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Academic Records</h1>
            <div class="info">
                <asp:Label ID="lblStudentInfo" runat="server" Text=""></asp:Label><br />
                <asp:Label ID="lblDateTime" runat="server" Text=""></asp:Label>
            </div>
            
            <asp:GridView ID="gvAcademicRecords" runat="server" AutoGenerateColumns="False" CssClass="details-grid">
                <Columns>
                    <asp:BoundField DataField="Module" HeaderText="Module" />
                    <asp:BoundField DataField="Marks" HeaderText="Marks" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />
                </Columns>
            </asp:GridView>

            <div class="summary">
                <asp:Label ID="lblTotalModules" runat="server" Text=""></asp:Label><br />
                <asp:Label ID="lblPassedModules" runat="server" Text=""></asp:Label><br />
                <asp:Label ID="lblFailedModules" runat="server" Text=""></asp:Label><br />
                <asp:Label ID="lblDistinctions" runat="server" Text=""></asp:Label><br />
                <asp:Label ID="lblOverallStatus" runat="server" Text=""></asp:Label>
            </div>

            <div class="feedback">
                <asp:Label ID="lblFeedback" runat="server" Text=""></asp:Label>
            </div>

            <div class="issued-info">
                <p>Issued by: <strong>CampusConnect Administration</strong></p>
                <p>If you have any queries, please contact <strong>admin@campusconnect.edu</strong> or call <strong>+123 456 7890</strong>.</p>
            </div>

            <a class="download-btn" href="#" onclick="DownloadAcademicRecord(); return false;">Download Academic Record (PDF)</a>
            <asp:Button ID="btnDownload" runat="server" OnClick="btnDownload_Click" Style="display:none;" />
        </div>
    </form>

    <script type="text/javascript">
        function DownloadAcademicRecord() {
            document.getElementById('<%= btnDownload.ClientID %>').click();
        }
    </script>
</body>
</html>
