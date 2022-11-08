<%@ page import="Project1.ClassList" %>
<%@ page import="Project1.Course" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>관리자-통계 기능(OLAP)</title>
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
        .frame {
            font-family: 'Jua', sans-serif;
            border: 1px solid darkblue;
            text-align: center;
            margin-left: 200px;
            margin-right: 200px;
            padding: 20px;
        }
        table {
            text-align: center;
            margin-left: auto;
            margin-right: auto;
        }
        th, td {
            padding: 5px;
        }
        th {
            color: darkblue;
        }
    </style>
</head>
<%--상단 로고 및 메뉴, 로고를 클릭하면 수강편람 화면으로 이동할 수 있음, 메뉴 중 현재 보고 있는 화면은 글자 색이 하늘색으로 표시되고 커서를 메뉴 위로 가져가면 글자 색이 노란색으로 바뀜--%>
<header>
    <div>
        <div style="text-align: center">
            <img src="images/HYU_hyu.png" onclick="location.href='adminMain.jsp'" alt="한양대학교 로고" style="height: 50px">
        </div>
        <nav>
            <ul id="top-menu">
                <li><a href="adminMain.jsp">수강 편람</a></li>
                <li><a href="editClass.jsp">수강 개설 및 삭제</a></li>
                <li><a href="manageStudent.jsp">학생 조회 및 변경</a></li>
                <li><a href="manageClass.jsp">과목 조회 및 변경</a></li>
                <li><a href="OLAP.jsp" style="color: dodgerblue">통계 기능(OLAP)</a></li>
                <li><a href="logoutAction.jsp">로그아웃</a></li>
            </ul>
        </nav>
    </div>
</header>
<%--OLAP결과를 프레임에 담아서 출력되도록 하였음--%>
<body style="margin-bottom: 60px">
    <%--olap() method를 수행한 후 결과로 리턴된 list를 for 문을 순차적으로 돌면서 테이블에 출력--%>
    <div class="frame">
        <div class="row">
            <h2 style="color: darkblue">평점 평균과 특정 과목의 학점 간 차이가 가장 큰 TOP10 과목</h2>
            <table>
                <thead>
                <tr>
                    <th>학수번호</th>
                    <th>교과목명</th>
                    <th>평점평균-과목학점</th>
                </tr>
                </thead>
                <tbody>
                <%
                    try {
                        ClassList classList = new ClassList();
                        ArrayList<Course> list = classList.olap();
                        for(int i = 0; i < list.size(); i++) {
                %>
                <tr>
                    <td><%= list.get(i).getCourseID()%></td>
                    <td><%= list.get(i).getName()%></td>
                    <td><%= list.get(i).getDifference()%></td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</body>
<footer style="position : fixed; bottom: 0; width: 100%; background-color: white">
    <h5 style="color: darkblue; text-align: center"><%="Cho Yune / 2022 Fall Semester - Database System"%></h5>
</footer>
</html>
