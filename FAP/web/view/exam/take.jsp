<%-- 
    Document   : take
    Created on : Jul 3, 2024, 11:18:37 PM
    Author     : ai
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Grade Input Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f9f9f9;
        }
        h1, h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        input[type="text"] {
            width: 100%;
            padding: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            padding: 10px 20px;
            margin-top: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            display: block;
            width: 100%;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
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
    
    <h2>Input Student Grades</h2>
    <form action="take" method="POST">
        <table>
            <tr>
                <td></td>
                <c:forEach items="${requestScope.exams}" var="e">
                    <td>
                        ${e.assessment.name} (${e.assessment.weight}) <br/>
                        ${e.from}
                    </td>
                </c:forEach>
            </tr>
            <c:forEach items="${requestScope.students}" var="s">
                <tr>
                    <td>${s.name}</td>
                    <c:forEach items="${requestScope.exams}" var="e">
                        <td>
                            <input type="text" name="score${s.id}_${e.id}"
                                   <c:forEach items="${requestScope.grades}" var="g">
                                       <c:if test="${e.id eq g.exam.id and s.id eq g.student.id}">
                                           value="${g.score}"
                                       </c:if>
                                   </c:forEach>
                            />
                            <input type="hidden" name="gradeid" value="${s.id}_${e.id}"/>
                        </td>
                    </c:forEach>
                </tr>
            </c:forEach>    
        </table>
        <input type="hidden" name="cid" value="${param.cid}" />
        <input type="submit" value="Save"/>
    </form>
</body>
</html>

