<%-- 
    Document   : updateProfile
    Created on : Jul 16, 2024, 12:23:11 PM
    Author     : ai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Student Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f8f9fa;
        }
        h1 {
            text-align: center;
            margin-bottom: 30px;
            color: #343a40;
        }
        form {
            max-width: 600px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #343a40;
        }
        input[type="text"],
        input[type="date"],
        input[type="email"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #dee2e6;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .logout-container {
            text-align: right;
            margin-bottom: 20px;
        }
        .logout-button {
            background-color: #4CAF50; /* Màu xanh lá cây */
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
    </div>
    <h1>Update Student Profile</h1>
    <form action="updateprofile" method="post">
        <input type="hidden" name="sid" value="${profile.profileID}"/>
        
        <label for="fullname">Full Name:</label>
        <input type="text" id="fullname" name="fullname" value="${profile.fullName}" required/>

        <label for="dob">Date of Birth:</label>
        <input type="date" id="dob" name="dob" value="${profile.dob}" required/>

        <label for="idcard">ID Card:</label>
        <input type="text" id="idcard" name="idcard" value="${profile.idCard}" required/>

        <label for="address">Address:</label>
        <input type="text" id="address" name="address" value="${profile.address}" required/>

        <label for="phone">Phone Number:</label>
        <input type="text" id="phone" name="phone" value="${profile.phoneNumber}" required/>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="${profile.email}" required/>

        <label for="dateissue">Date of Issue:</label>
        <input type="date" id="dateissue" name="dateissue" value="${profile.issueDate}" required/>

        <label for="placeissue">Place of Issue:</label>
        <input type="text" id="placeissue" name="placeissue" value="${profile.issuePlace}" required/>

        <input type="submit" value="Update Profile"/>
    </form>
</body>
</html>
