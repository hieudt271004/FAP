<%-- 
    Document   : sendApplication
    Created on : Jul 15, 2024, 9:12:29 PM
    Author     : ai
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- result.jsp -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Application Result</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f8f9fa;
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
        .logout-container {
            text-align: right; /* Align logout button to the right */
            margin-bottom: 20px;
        }
        .submit-button {
            background-color: #4CAF50; /* Green color */
            color: white;
            padding: 4px 8px; /* Smaller padding */
            border: none;
            cursor: pointer;
        }
        input[type="text"] {
            width: 100%; /* Độ rộng đầy đủ */
            max-width: 500px; /* Độ dài tối đa */
            height: 100px; /* Chiều cao */
            padding: 10px; /* Padding */
            box-sizing: border-box; /* Đảm bảo padding không làm tăng kích thước */
            margin-bottom: 20px; /* Khoảng cách dưới ô input */
        }
        button[type="submit"] {
            padding: 4px 8px; /* Padding nhỏ */
            background-color: #4CAF50; /* Màu xanh lá cây */
            color: white;
            border: none;
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
    <h2>Send Application</h2>
    <form action="sendapp" method="post">
        <input type="text" id="sendApp" name="send" placeholder="Enter your application here...">
        <button type="submit" class="submit-button">Send</button>
    </form>
</body>
</html>
