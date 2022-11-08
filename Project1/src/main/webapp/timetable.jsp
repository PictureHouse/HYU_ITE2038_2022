<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>학생-수업시간표</title>
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
<%--상단 로고 및 메뉴, 로고를 클릭하면 수강편람 화면으로 이동할 수 있음, 메뉴 중 현재 보고 있는 화면은 글자 색이 하늘색으로 표시되고 커서를 메뉴 위로 가져가면 글자 색이 노란색으로 바뀜--%>
<header>
    <div>
        <div style="text-align: center">
            <img src="images/HYU_hyu.png" onclick="location.href='studentMain.jsp'" alt="한양대학교 로고" style="height: 50px">
        </div>
        <nav>
            <ul id="top-menu">
                <li><a href="studentMain.jsp">수강 편람</a></li>
                <li><a href="wishlist.jsp">희망 수업 목록</a></li>
                <li><a href="enrolment.jsp">수강 신청 과목</a></li>
                <li><a href="timetable.jsp" style="color: dodgerblue">수업시간표</a></li>
                <li><a href="logoutAction.jsp">로그아웃</a></li>
            </ul>
        </nav>
    </div>
</header>
<%--기능 구현을 못했지만 사이트의 원활한 동작 및 UI를 위해 서비스 이용 불가 메시지가 화면에 나타나도록 했음--%>
<body style="margin-bottom: 60px">
    <div style="text-align: center">
        <img src="images/error.jpg" alt="서비스 불가" style="width: 70%">
    </div>
</body>
<footer style="position : fixed; bottom: 0; width: 100%; background-color: white">
    <h5 style="color: darkblue; text-align: center"><%="Cho Yune / 2022 Fall Semester - Database System"%></h5>
</footer>
</html>
