<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>학생 로그인</title>
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
    <form method="post" action="studentLoginAction.jsp">
        <img src="images/HYU_main.png" width="360px" style="margin: 20px;" alt="로고">
        <h1 style="color: darkblue; margin: 20px">학생 로그인</h1>
        <div class="">
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
</html>
