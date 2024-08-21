<%-- 
    Document   : gradeReport
    Created on : Jul 10, 2024, 4:35:01 PM
    Author     : ai
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Grade Report</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f8f9fa;
        }
        h1, h2 {
            color: #343a40;
        }
        h1 {
            text-align: center;
            margin-bottom: 40px;
        }
        h2 {
            margin-top: 20px;
            margin-bottom: 10px;
        }
        p {
            margin: 5px 0;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 40px;
        }
        table, th, td {
            border: 1px solid #dee2e6;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #e9ecef;
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
            background-color: #4CAF50; /* Green color */
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
    
    <form action="GradeReport" method="POST">
        <h1>Grade Report for ${student.name}</h1>
        <c:forEach var="course" items="${student.courses}">
            <div class="course-info">
                <h2>Course: ${course.name}</h2>
                <p><strong>Lecturer:</strong> ${course.lecturer.name}</p>
                <p><strong>Subject:</strong> ${course.subject.name}</p>
                <p><strong>Semester:</strong> ${course.semester.year} - ${course.semester.season}</p>
                <table>
                    <tr>
                        <th>Exam ID</th>
                        <th>Date</th>
                        <th>Score</th>
                    </tr>
                    <c:forEach var="exam" items="${course.exams}">
                        <tr>
                            <td>${exam.id}</td>
                            <td>${exam.from}</td>
                            <td>
                                <c:forEach var="grade" items="${exam.grades}">
                                    <c:if test="${grade.student.id == student.id}">
                                        ${grade.score}
                                    </c:if>
                                </c:forEach>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </c:forEach>
    </form>
</body>
</html>


