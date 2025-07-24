<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm5.aspx.cs" Inherits="CampusConnect.WebForm5" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lecturer Registration</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <style>
        body {
            background-image: linear-gradient(to right, #0066ff, #00ccff);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .registration-container {
            width: 100%;
            max-width: 600px;
            padding: 30px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            margin-top: 20px;
        }

        .registration-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .registration-header h2 {
            font-size: 1.8em;
            color: #0066cc;
        }

        .form-control {
            margin-bottom: 15px;
            border-radius: 20px;
        }

        .btn-custom {
            background-color: #0066cc;
            color: white;
            border-radius: 20px;
            padding: 10px;
            width: 100%;
            margin-bottom: 10px;
        }

        .btn-custom:hover {
            background-color: #004d99;
        }

        .btn-back {
            background-color: #f1f1f1;
            color: #333;
            border-radius: 20px;
            padding: 10px;
            width: 100%;
            margin-top: 10px;
            border: 1px solid #ccc;
        }

        .btn-back:hover {
            background-color: #e0e0e0;
        }

        .confirmation-message {
            margin-top: 20px;
            background-color: #e7f3fe;
            padding: 15px;
            border: 1px solid #b3e5fc;
            border-radius: 10px;
            color: #0277bd;
        }

        .error-message {
            margin-top: 20px;
            background-color: #f8d7da;
            padding: 15px;
            border: 1px solid #f5c6cb;
            border-radius: 10px;
            color: #721c24;
        }

        .lecturer-details {
            margin-top: 20px;
            padding: 15px;
            background-color: #f0f8ff;
            border: 1px solid #b0e0e6;
            border-radius: 10px;
            color: #333;
        }

        .lecturer-details h4 {
            color: #0066cc;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
   
        <div class="registration-container">
            
            <div class="registration-header">
                <h2>Lecturer Registration</h2>
            </div>
            
            <div class="form-group">
                <asp:TextBox ID="nameTextBox" runat="server" CssClass="form-control" Placeholder="Name" Required="true" />
            </div>
            <div class="form-group">
                <asp:TextBox ID="surnameTextBox" runat="server" CssClass="form-control" Placeholder="Surname" Required="true" />
            </div>
            <div class="form-group">
                <asp:TextBox ID="idNumberTextBox" runat="server" CssClass="form-control" Placeholder="ID Number" Required="true" />
            </div>
            <div class="form-group">
                <asp:TextBox ID="passwordTextBox" runat="server" CssClass="form-control" Placeholder="Password" TextMode="Password" Required="true" />
            </div>
            <div class="form-group">
                <asp:TextBox ID="phoneNumberTextBox" runat="server" CssClass="form-control" Placeholder="Phone Number" Required="true" />
            </div>
            <div class="form-group">
                <asp:TextBox ID="emailTextBox" runat="server" CssClass="form-control" Placeholder="Email" TextMode="Email" Required="true" />
            </div>
           
            <div class="form-group">
                <label>Select Modules to Lecture (Max 2):</label>
                <div class="form-check">
                    <asp:CheckBox ID="module1CheckBox" runat="server" CssClass="form-check-input module-checkbox" />
                    <label class="form-check-label" for="module1CheckBox">Data Structures</label>
                </div>
                <div class="form-check">
                    <asp:CheckBox ID="module2CheckBox" runat="server" CssClass="form-check-input module-checkbox" />
                    <label class="form-check-label" for="module2CheckBox">Object-Oriented Programming</label>
                </div>
                <div class="form-check">
                    <asp:CheckBox ID="module3CheckBox" runat="server" CssClass="form-check-input module-checkbox" />
                    <label class="form-check-label" for="module3CheckBox">C#</label>
                </div>
                <div class="form-check">
                    <asp:CheckBox ID="module4CheckBox" runat="server" CssClass="form-check-input module-checkbox" />
                    <label class="form-check-label" for="module4CheckBox">System Design</label>
                </div>
            </div>
          
            <asp:Button ID="registerButton" runat="server" CssClass="btn btn-custom" Text="Register" OnClick="RegisterLecturer_Click" />
          
            <button type="button" class="btn btn-back" onclick="history.back();">
                <i class="fas fa-arrow-left"></i> Back
            </button>
        </div>

     
        <asp:Label ID="confirmationMessageLabel" runat="server" CssClass="confirmation-message" Visible="false"></asp:Label>
        <asp:Label ID="errorMessageLabel" runat="server" CssClass="error-message" Visible="false"></asp:Label>

      
        <asp:Panel ID="LecturerDetailsPanel" runat="server" CssClass="lecturer-details" Visible="false">
            <h4>Registered Lecturer Details:</h4>
            <p><strong>Name:</strong> <span id="nameDisplay" runat="server"></span></p>
            <p><strong>Surname:</strong> <span id="surnameDisplay" runat="server"></span></p>
            <p><strong>ID Number:</strong> <span id="idNumberDisplay" runat="server"></span></p>
            <p><strong>Phone:</strong> <span id="phoneDisplay" runat="server"></span></p>
            <p><strong>Email:</strong> <span id="emailDisplay" runat="server"></span></p>
            <p><strong>Staff Number:</strong> <span id="staffNumberDisplay" runat="server"></span></p>
            <p><strong>Module 1:</strong> <span id="module1Display" runat="server"></span></p>
            <p><strong>Module 2:</strong> <span id="module2Display" runat="server"></span></p>
        </asp:Panel>
    </form>

  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- Custom Script to Limit Module Selection -->
    <script type="text/javascript">
        $(document).ready(function () {
            var maxModules = 2;
            $('.module-checkbox').change(function () {
                if ($('.module-checkbox:checked').length > maxModules) {
                    alert('You can only select up to ' + maxModules + ' modules.');
                    $(this).prop('checked', false);
                }
            });
        });
    </script>
</body>
</html>
