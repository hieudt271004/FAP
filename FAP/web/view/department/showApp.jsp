<%-- 
    Document   : showApp
    Created on : Jul 16, 2024, 12:43:18 AM
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
            textarea {
                width: 100%;
                height: 100px;
                resize: none;
            }
            .header {
                text-align: left; /* Align header to the left */
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
            .feedback-title {
                text-align: left; /* Align Feedback List to the left */
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
                <th>Action</th>
            </tr>
            <c:forEach var="app" items="${app}">
                <form action="feedback" method="post">
                    <input hidden name="app_id" value="${app.id}">
                    <tr>
                        <td>${app.send}</td>
                        <td>${app.sendAt}</td>
                        <td>
                            <textarea name="feedback${app.id}">${app.feedback}</textarea>
                        </td>
                        <td>
                            <button type="submit" name="sendAt" value="${app.sendAt}" class="submit-button">Send</button>
                        </td>
                    </tr>
                </form>
            </c:forEach>
        </table>

    </body>
</html>

