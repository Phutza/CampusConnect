<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="CampusConnect.AdminDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard - CampusConnect</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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

        .card-body {
            padding: 20px;
        }

        .btn-custom {
            background-color: #007bff;
            color: #fff;
            border-radius: 25px;
            padding: 12px 24px;
            font-size: 1em;
            text-decoration: none;
            display: inline-block;
            margin: 5px;
            transition: background-color 0.3s, transform 0.2s;
        }

        .btn-custom:hover {
            background-color: #0056b3;
            text-decoration: none;
            transform: scale(1.05);
        }

        .btn-custom:focus {
            outline: none;
        }

        h1 {
            color: #007bff;
            font-size: 2.5em;
            margin-bottom: 40px;
            font-weight: 700;
            text-align: center;
        }

        .additional-links {
            text-align: center;
            margin-top: 20px;
        }

        .additional-links a {
            color: #007bff;
            font-size: 0.9em;
            text-decoration: none;
            margin: 0 10px;
        }

        .additional-links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Admin Dashboard</h1>
            <div class="card">
                <div class="card-header">
                    Manage Lecturers
                </div>
                <div class="card-body">
                    <a href="AddLecturer.aspx" class="btn btn-custom">Add Lecturer</a>
                    <a href="DeleteLecturer.aspx" class="btn btn-custom">Delete Lecturer</a>
                </div>
            </div>
            <div class="card">
                <div class="card-header">
                    Manage Students
                </div>
                <div class="card-body">
                    <a href="AddStudent.aspx" class="btn btn-custom">Add Student</a>
                    <a href="DeleteStudent.aspx" class="btn btn-custom">Delete Student</a>
                    <a href="EditStudentDetails.aspx" class="btn btn-custom">Edit Student Details</a>
                </div>
            </div>
            <div class="card">
                <div class="card-header">
                    Announcements
                </div>
                <div class="card-body">
                    <a href="SendAnnouncement.aspx" class="btn btn-custom">Send Announcement</a>
                    <a href="ViewAnnouncements.aspx" class="btn btn-custom">View Announcements</a>
                    <a href="ClearAnnouncements.aspx" class="btn btn-custom">Clear Announcements</a>
                </div>
            </div>
            <div class="card">
                <div class="card-header">
                    Reports
                </div>
                <div class="card-body">
                    <a href="StudentReport.aspx" class="btn btn-custom">Request Student Reports</a>
                    <a href="LecturerReport.aspx" class="btn btn-custom">Request Lecturer Reports</a>
                </div>
            </div>
            <div class="card">
                <div class="card-header">
                    Actions
                </div>
                <div class="card-body">
                    <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-custom" OnClick="btnLogout_Click" />
                </div>
            </div>
            <div class="additional-links">
                <a href="HelpPage.aspx">Need Help?</a>
            </div>
        </div>
    </form>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
