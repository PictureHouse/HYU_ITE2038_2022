<%--수강신청 페이지에 접속하면 가장 먼저 보게되는 화면, 한양대학교 로고가 배치되어 있고 관리자와 학생 중 어느 모드로 로그인할지 선택할 수 있다.--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
    <title>한양대학교 수강신청</title>
    <link rel="stylesheet" href="css/button.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
        #container {
            margin: 0 auto;
            text-align: center;
        }
    </style>
</head>
<body style="margin-bottom: 60px">
    <div id="container">
        <img src="images/HYU_main.png" width="360px" style="margin: 20px" alt="메인로고" onclick="location.href='index.jsp'">
        <h1 style="color: darkblue; margin: 20px; font-family: 'Jua', sans-serif"><%= "한양대학교 수강신청" %>
        </h1>
        <div style="margin-bottom: 220px">
            <input type="button" class="button" value="관리자 로그인" onclick="location.href='adminLogin.jsp'">
            <input type="button" class="button" value="학생 로그인" onclick="location.href='studentLogin.jsp'">
        </div>
    </div>
</body>
<footer style="position : fixed; bottom: 0; width: 100%; background-color: white">
    <h5 style="color: darkblue; text-align: center"><%="Cho Yune / 2022 Fall Semester - Database System"%></h5>
</footer>
</html>