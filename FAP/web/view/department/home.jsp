<%-- 
    Document   : home
    Created on : Jul 15, 2024, 10:00:06 PM
    Author     : ai
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <title>FPT University Academic Portal</title>
</head>
<body>
    <div class="container">
        <div class="header text-left mt-4">
            <h1>FPT University Academic Portal</h1>
        </div>
        <div class="text-right mb-3">
            <form action="/fap/logout" method="POST">
                <button type="submit" class="btn btn-secondary btn-sm">Log Out</button>
            </form>
        </div>

        <h3 class="text-center mt-5">Registration/Application (Thủ tục/đơn từ)</h3>
        <div class="row justify-content-center mt-4">
            <!-- Cột 1 -->
            <div class="col-md-6">
                <div>
                    <a href="/fap/feedback" class="btn btn-primary mb-2">
                        Send Application (Gửi đơn)
                    </a><br>
                    <a href="/fap/allfeedback" class="btn btn-secondary">
                        View Application (Xem đơn)
                    </a>
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


