<%-- 
    Document   : viewProfile
    Created on : Jul 16, 2024, 12:21:44 PM
    Author     : ai
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Profile and Academic</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f8f9fa;
        }
        h1 {
            text-align: center;
            color: #343a40;
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
        .logout-container {
            display: flex;
            justify-content: flex-end;
            margin-bottom: 20px;
        }
        .logout-container div {
            margin-left: 10px;
        }
        table {
            width: 45%;
            border-collapse: collapse;
            margin: 10px;
            float: left; /* Căn bảng bên trái */
        }
        table, th, td {
            border: 1px solid #dee2e6;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .submit-button {
            background-color: #4CAF50;
            color: white;
            padding: 4px 8px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>FPT University Academic Portal</h1>
    </div>
    <div class="logout-container">
        <div>
            <form action="/fap/logout" method="POST">
                <button type="submit" class="submit-button">Log Out</button>
            </form>
        </div>
        <div>
            <form action="updateprofile" method="GET">
                <button type="submit" class="submit-button">Update</button>
            </form>
        </div>
    </div>
    
    <h1>Student Profile</h1>
    <table>
        <tr>
            <td>Profile ID</td>
            <td>${profile.profileID}</td>
        </tr>
        <tr>
            <td>Full Name</td>
            <td>${profile.fullName}</td>
        </tr>
        <tr>
            <td>Date of Birth</td>
            <td>${profile.dob}</td>
        </tr>
        <tr>
            <td>Gender</td>
            <td>${profile.isGenger() ? 'Male' : 'Female'}</td>
        </tr>
        <tr>
            <td>ID Card</td>
            <td>${profile.idCard}</td>
        </tr>
        <tr>
            <td>Address</td>
            <td>${profile.address}</td>
        </tr>
        <tr>
            <td>Phone Number</td>
            <td>${profile.phoneNumber}</td>
        </tr>
        <tr>
            <td>Email</td>
            <td>${profile.email}</td>
        </tr>
        <tr>
            <td>Date of Issue</td>
            <td>${profile.issueDate}</td>
        </tr>
        <tr>
            <td>Place of Issue</td>
            <td>${profile.issuePlace}</td>
        </tr>
    </table>

    <h1>Student Academic</h1>
    <table>
        <tr>
            <td>Academic ID</td>
            <td>${academic.academicID}</td>
        </tr>
        <tr>
            <td>Roll Number</td>
            <td>${academic.rollNumber}</td>
        </tr>
        <tr>
            <td>Old Number</td>
            <td>${academic.oldNumber}</td>
        </tr>
        <tr>
            <td>Enroll Date</td>
            <td>${academic.enrollDate}</td>
        </tr>
        <tr>
            <td>Mode</td>
            <td>${academic.mode}</td>
        </tr>
        <tr>
            <td>Student Status</td>
            <td>${academic.studentStatus ? 'Active' : 'Inactive'}</td>
        </tr>
        <tr>
            <td>Current Term</td>
            <td>${academic.currentTerm}</td>
        </tr>
        <tr>
            <td>Major</td>
            <td>${academic.major}</td>
        </tr>
        <tr>
            <td>Curriculum</td>
            <td>${academic.curriculumn}</td>
        </tr>
        <tr>
            <td>Capstone</td>
            <td>${academic.capstone}</td>
        </tr>
    </table>
</body>
</html>

