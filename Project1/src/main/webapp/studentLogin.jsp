<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>학생 로그인</title>
    <link rel="stylesheet" href="css/button.css">
    <link rel="stylesheet" href="css/input.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
        #container {
            margin: 180px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div id="container">
        <form method="post" action="studentLoginAction.jsp">
            <img src="images/HYU_main.png" width="360px" style="margin: 20px;" alt="한양대학교 로고" onclick="location.href='index.jsp'">
            <h1 style="color: darkblue; margin: 20px; font-family: 'Jua', sans-serif">학생 로그인</h1>
            <div>
                <div >
                    <input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
                </div>
                <div>
                    <input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
                </div>
                <input type="submit" class="button" value="로그인">
            </div>
        </form>
    </div>
</body>
<footer style="position : fixed; bottom: 0; width: 100%; background-color: white">
    <h5 style="color: darkblue; text-align: center"><%="Cho Yune / 2022 Fall Semester - Database System"%></h5>
</footer>
</html>
