<%-- 
    Document   : home
    Created on : Jul 9, 2024, 7:59:00 PM
    Author     : ai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <title>FPT University Academic Portal</title>
    <style>
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 20px;
        }
        .logout-button {
            background-color: #28a745; /* Màu xanh lá cây */
            color: white;
            border: none;
            padding: 4px 8px;
        }
        .logout-button:hover {
            background-color: #218838; /* Màu xanh lá cây đậm hơn khi hover */
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>FPT University Academic Portal</h1>
            <form action="/fap/logout" method="POST">
                <button type="submit" class="logout-button btn btn-sm">Log Out</button>
            </form>
        </div>
        
        <div class="row mt-4">
            <!-- Cột 1 -->
            <div class="col-md-6">
                <h3>Reports (Báo cáo)</h3>
                <div>
                    <a href="/fap/GradeReport" class="btn btn-primary">
                        Mark Report (Báo cáo điểm)
                    </a>
                </div>
            </div>

            <!-- Cột 2 -->
            <div class="col-md-6">
                <h3>Information Access (Tra cứu thông tin)</h3>
                <div>
                    <a href="/fap/viewapp" class="btn btn-secondary mb-2">
                        View Application
                    </a><br>
                    <a href="/fap/sendapp" class="btn btn-secondary mb-2">
                        Send application
                    </a><br>
                    <a href="/fap/viewprofile" class="btn btn-secondary mb-2">
                        Student Profile
                    </a><br>
                    <a href="/fap/updateprofile" class="btn btn-secondary mb-2">
                        Update Profile
                    </a><br>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

