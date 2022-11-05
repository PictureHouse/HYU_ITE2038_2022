<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
    <title>한양대학교 수강신청</title>
    <link rel="stylesheet" href="css/button.css">
    <style>
        #container {
            margin: 180px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div id="container">
        <img src="images/HYU_main.png" width="360px" style="margin: 20px" alt="메인로고">
        <h1 style="color: darkblue; margin: 20px"><%= "한양대학교 수강신청" %>
        </h1>
        <div>
            <input type="button" class="button" value="관리자 로그인" onclick="location.href='adminLogin.jsp'">
            <input type="button" class="button" value="학생 로그인" onclick="location.href='studentLogin.jsp'">
        </div>
    </div>

</body>
</html>