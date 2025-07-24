<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="CampusConnect.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CampusConnect Home</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            background-image: linear-gradient(to right, #4a90e2, #56ccf2);
            color: #333;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .main-container {
            width: 100%;
            max-width: 1400px;
            padding: 30px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            height: 90%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .logo {
            width: 150px;
            display: block;
            margin: 0 auto;
        }

        .header {
            text-align: center;
            margin-bottom: 20px;
        }

        .header h1 {
            font-size: 2.2em;
            color: #007bff;
            margin-bottom: 10px;
        }

        .header p {
            color: #555;
            font-size: 1.1em;
        }

        .content {
            flex: 1;
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
        }

        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            margin: 15px;
            flex: 1;
            max-width: 280px;
            text-align: center;
            background-color: #f7f7f7;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
        }

        .card-body {
            padding: 30px;
        }

        .icon-large {
            font-size: 50px;
            color: #007bff;
            margin-bottom: 15px;
        }

        .btn-custom {
            background-color: #007bff;
            color: white;
            border-radius: 25px;
            padding: 10px 20px;
            font-size: 1em;
        }

        .btn-custom:hover {
            background-color: #0056b3;
            color: #fff;
        }

        .footer {
            text-align: center;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border-radius: 0 0 10px 10px;
        }

        .about-section {
            background-color: #007bff;
            color: white;
            border-radius: 10px;
            padding: 15px;
            text-align: center;
            margin-top: 20px;
        }

        .contact-section {
            text-align: center;
            padding: 15px;
            background-color: #f7f7f7;
            border-radius: 10px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="main-container">
            <div class="header">
                <img src="https://www.icicicareers.com/campusconnect/images/logo.png" alt="CampusConnect Logo" class="logo">
                <h1>Welcome to CampusConnect</h1>
                <p>Your portal for managing all academic and administrative tasks.</p>
                <p>Empowering your educational experience!</p>
            </div>

            <div class="content">
                <div class="card">
                    <div class="card-body">
                        <i class="fas fa-sign-in-alt icon-large"></i>
                        <h5 class="card-title">Login</h5>
                        <p class="card-text">Already have an account? Login to access your dashboard.</p>
                        <a href="WebForm3.aspx" class="btn btn-custom">Login</a>
                    </div>
                </div>

                <div class="card">
                    <div class="card-body">
                        <i class="fas fa-user-graduate icon-large"></i>
                        <h5 class="card-title">Student Registration</h5>
                        <p class="card-text">New student? Register here to start your academic journey with us.</p>
                        <a href="WebForm4.aspx" class="btn btn-custom">Register as Student</a>
                    </div>
                </div>

                <div class="card">
                    <div class="card-body">
                        <i class="fas fa-chalkboard-teacher icon-large"></i>
                        <h5 class="card-title">Lecturer Registration</h5>
                        <p class="card-text">New lecturer? Register here to manage your courses and students.</p>
                        <a href="WebForm5.aspx" class="btn btn-custom">Register as Lecturer</a>
                    </div>
                </div>

                <div class="card">
                    <div class="card-body">
                        <i class="fas fa-user-shield icon-large"></i>
                        <h5 class="card-title">Admin Login</h5>
                        <p class="card-text">Admins, log in here to manage the CampusConnect platform.</p>
                        <a href="WebForm2.aspx" class="btn btn-custom">Admin Login</a>
                    </div>
                </div>

                <div class="card">
                    <div class="card-body">
                        <i class="fas fa-question-circle icon-large"></i>
                        <h5 class="card-title">Help</h5>
                        <p class="card-text">Need assistance? Click here for help and support.</p>
                        <a href="HelpPage.aspx" class="btn btn-custom">Help</a>
                    </div>
                </div>

               
                <div class="card">
                    <div class="card-body">
                        <i class="fas fa-code icon-large"></i>
                        <h5 class="card-title">Developer Info</h5>
                        <p class="card-text">Learn more about the developers of CampusConnect.</p>
                        <a href="WebForm14.aspx" class="btn btn-custom">Meet the Developers</a>
                    </div>
                </div>
            </div>

            <div class="about-section">
                <h5>About CampusConnect</h5>
                <p>
                    CampusConnect is an integrated platform designed to streamline the academic experience for students and lecturers. 
                    Manage courses and academic records efficiently and securely. With features such as real-time module registration, 
                    comprehensive mark management, and intuitive report generation, CampusConnect ensures that both students and 
                    lecturers have access to the tools they need for academic success. 
                    <strong>Students</strong> can easily track their academic progress, edit their details and deregister 
                    while <strong>lecturers</strong> can maintain module marks, communicate effectively with students, and manage 
                    course materials seamlessly. Our commitment to data security guarantees that all personal and academic information 
                    remains protected, providing peace of mind for users. 
                </p>
            </div>

            <div class="contact-section">
                <h5>Contact us</h5>
                <p>If you have any queries, feel free to reach out to us at <a href="mailto:CampusCoonect@nwu.ac.za">CampusCoonect@nwu.ac.za</a>.</p>
            </div>

            <div class="footer">
                <p>&copy; 2025 CampusConnect. All rights reserved.</p>
            </div>
        </div>
    </form>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
