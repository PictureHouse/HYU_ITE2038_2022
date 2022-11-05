<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>관리자 수강 편람</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
        a {
            text-decoration: none;
            color: azure;
            font-family: 'Jua', sans-serif;
        }
        a:hover {
            color: yellow;
        }
        nav ul {
            list-style: none;
            background-color: darkblue;
            padding: 20px;
            text-align: center;
        }
        nav ul li {
            display: inline-block;
            margin-left: 20px;
            margin-right: 20px;
        }
    </style>
</head>
<header>
    <div>
        <div style="text-align: center">
            <img src="images/HYU_hyu.png" onclick="location.href='adminMain.jsp'" alt="한양대학교 로고" style="height: 50px">
        </div>
        <nav>
            <ul id="top-menu">
                <li><a href="adminMain.jsp">수강 편람</a></li>
                <li><a href="#">수강 개설 및 삭제</a></li>
                <li><a href="#">학생 조회 및 변경</a></li>
                <li><a href="#">과목 조회 및 변경</a></li>
                <li><a href="#">통계 기능(OLAP)</a></li>
                <li><a href="adminInfo.jsp">사용자 정보</a></li>
                <li><a href="#">로그아웃</a></li>
            </ul>
        </nav>
    </div>
</header>
<body>

</body>
<footer style="position : fixed; bottom: 0; width: 100%">
    <h5 style="color: darkblue; text-align: center"><%="Cho Yune / 2022 Fall Semester - Database System"%></h5>
</footer>
</html>
