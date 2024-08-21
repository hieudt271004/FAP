<%-- 
    Document   : home
    Created on : Jul 9, 2024, 7:58:31 PM
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

            <h3 class="text-center mt-5">Reports (Báo cáo)</h3>
            <div class="row justify-content-center mt-4">
                <div class="col-md-6 text-center">
                    <a href="../../exam/lecturer" class="btn btn-primary mb-2">
                        Take Mark
                    </a>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>


