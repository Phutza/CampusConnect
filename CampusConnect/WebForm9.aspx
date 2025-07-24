<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm9.aspx.cs" Inherits="CampusConnect.WebForm9" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Module Report</title>
    <style>
        .report-container {
            width: 90%;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .grid-view {
            margin-top: 20px;
        }
        .chart-container {
            margin-top: 40px;
        }
        canvas {
            width: 100% !important;
            height: 400px !important;
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="report-container">
     
            <asp:Label ID="lblSelectModule" runat="server" Text="Select Module:" Font-Bold="true"></asp:Label>
            <asp:DropDownList ID="ddlModules" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlModules_SelectedIndexChanged">
             
            </asp:DropDownList>
            <asp:Button ID="btnGenerateReport" runat="server" Text="Generate Report" OnClick="btnGenerateReport_Click" />

            
            <asp:GridView ID="gvStudentReport" runat="server" AutoGenerateColumns="False" CssClass="grid-view" Width="100%" 
                          GridLines="Both" BorderStyle="Solid" BorderWidth="1px" CellPadding="10">
                <Columns>
                    <asp:BoundField DataField="StudentName" HeaderText="Student Name" />
                    <asp:BoundField DataField="StudentNumber" HeaderText="Student Number" />
                    <asp:BoundField DataField="Module" HeaderText="Module" />
                    <asp:BoundField DataField="Marks" HeaderText="Marks" />
                    <asp:BoundField DataField="Result" HeaderText="Pass/Fail" />
                </Columns>
            </asp:GridView>

            <div class="chart-container">
                <canvas id="marksChart"></canvas>
            </div>

           
            <script type="text/javascript">
                function generateChart(labels, data) {
                    var ctx = document.getElementById('marksChart').getContext('2d');
                    new Chart(ctx, {
                        type: 'bar',
                        data: {
                            labels: labels,
                            datasets: [{
                                label: 'Number of Students',
                                data: data,
                                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                                borderColor: 'rgba(75, 192, 192, 1)',
                                borderWidth: 1
                            }]
                        },
                        options: {
                            scales: {
                                y: {
                                    beginAtZero: true
                                }
                            }
                        }
                    });
                }

               
                function loadChartData() {
                    var module = document.getElementById('<%= ddlModules.ClientID %>').value;
                    fetch(`WebForm9.aspx/GetChartData?module=${module}`)
                        .then(response => response.json())
                        .then(data => {
                            var labels = data.map(item => item.MarksRange);
                            var values = data.map(item => item.StudentCount);
                            generateChart(labels, values);
                        });
                }

                document.getElementById('<%= btnGenerateReport.ClientID %>').addEventListener('click', loadChartData);
            </script>
        </div>
    </form>
</body>
</html>
