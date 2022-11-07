<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>학생-수강 신청 과목</title>
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
            <img src="images/HYU_hyu.png" onclick="location.href='studentMain.jsp'" alt="한양대학교 로고" style="height: 50px">
        </div>
        <nav>
            <ul id="top-menu">
                <li><a href="studentMain.jsp">수강 편람</a></li>
                <li><a href="wishlist.jsp">희망 수업 목록</a></li>
                <li><a href="enrolment.jsp" style="color: dodgerblue">수강 신청 과목</a></li>
                <li><a href="timetable.jsp">수업시간표</a></li>
                <li><a href="logoutAction.jsp">로그아웃</a></li>
            </ul>
        </nav>
    </div>
</header>
<body style="margin-bottom: 60px">
    <div style="text-align: center">
        <img src="images/error.jpg" alt="서비스 불가" style="width: 70%">
    </div>
</body>
<footer style="position : fixed; bottom: 0; width: 100%; background-color: white">
    <h5 style="color: darkblue; text-align: center"><%="Cho Yune / 2022 Fall Semester - Database System"%></h5>
</footer>
</html>
