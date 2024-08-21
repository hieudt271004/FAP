<%-- 
    Document   : viewFeedback
    Created on : Jul 16, 2024, 12:43:35 AM
    Author     : ai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Feedback</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
        .logout-container {
            text-align: right;
            margin-bottom: 20px;
        }
        .submit-button {
            background-color: #4CAF50;
            color: white;
            padding: 4px 8px;
            border: none;
            cursor: pointer;
        }
        .feedback-title {
            text-align: left;
            margin-bottom: 10px;
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
    <h2 class="feedback-title">Feedback List</h2>
    <table>
        <tr>
            <th>Send Application</th>
            <th>Send At</th>
            <th>Feedback</th>
            <th>Feedback Time</th>
        </tr>
        <c:forEach var="app" items="${app}">
            <tr>
                <td>${app.send}</td>
                <td>${app.sendAt}</td>
                <td>${app.feedback}</td>
                <td>${app.feedbackTime}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>


