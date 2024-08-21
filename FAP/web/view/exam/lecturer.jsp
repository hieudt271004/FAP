<%-- 
    Document   : lecturer
    Created on : Jul 3, 2024, 11:18:13 PM
    Author     : ai
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Exam Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        h1, h2 {
            text-align: center;
        }
        form {
            margin: 20px 0;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        select, input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
        }
        input[type="checkbox"] {
            margin-right: 10px;
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

    <c:if test="${requestScope.exams eq null}">
        <c:if test="${requestScope.courses.size() > 0}">
            <h2>Select a Course</h2>
            <form action="lecturer" method="POST">
                <input type="hidden" name="lid" value="${param.lid}"/>
                <label for="cid">Course:</label>
                <select name="cid" id="cid">
                    <c:forEach items="${requestScope.courses}" var="c">
                        <option value="${c.id}">${c.name}</option>
                    </c:forEach>
                </select>
                <input type="submit" value="View"/>
            </form>
        </c:if>
    </c:if>
    
    <c:if test="${requestScope.exams ne null}">
        <h2>Take an Exam</h2>
        <form action="take" method="GET">
            <input type="hidden" name="cid" value="${param.cid}"/>
            <c:forEach items="${requestScope.exams}" var="e">
                <label>
                    <input type="checkbox" name="eid" value="${e.id}" />
                    ${e.assessment.name} - (${e.from}: ${e.assessment.weight}%)
                </label><br/>
            </c:forEach>
            <input type="submit" value="Take Exam"/>
        </form>
    </c:if>
</body>
</html>
