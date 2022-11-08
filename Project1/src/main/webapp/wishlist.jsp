<%@ page import="Project1.ClassList" %>
<%@ page import="Project1.Course" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>학생-희망 수업 목록</title>
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
            <img src="images/HYU_hyu.png" onclick="location.href='studentMain.jsp'" alt="한양대학교 로고" style="height: 50px">
        </div>
        <nav>
            <ul id="top-menu">
                <li><a href="studentMain.jsp">수강 편람</a></li>
                <li><a href="wishlist.jsp" style="color: dodgerblue">희망 수업 목록</a></li>
                <li><a href="enrolment.jsp">수강 신청 과목</a></li>
                <li><a href="timetable.jsp">수업시간표</a></li>
                <li><a href="logoutAction.jsp">로그아웃</a></li>
            </ul>
        </nav>
    </div>
</header>
<%--희망 수업 목록에 있는 데이터들을 wishlist() method를 통해 list로 가져온 후 for 문을 순차적으로 돌면서 테이블에 출력하도록 하였음--%>
<body style="margin-bottom: 60px">
    <div class="frame">
        <div class="row">
            <table>
                <thead>
                <tr>
                    <th>희망취소</th>
                    <th>수강신청</th>
                    <th>수업번호</th>
                    <th>학수번호</th>
                    <th>교과목명</th>
                    <th>교강사명</th>
                    <th>요일</th>
                    <th>시작시간</th>
                    <th>종료시간</th>
                    <th>수강정원</th>
                    <th>강의동</th>
                    <th>강의실</th>
                </tr>
                </thead>
                <tbody>
                <%
                    try {
                        ClassList classList = new ClassList();
                        ArrayList<Course> list = classList.wishlist();
                        for(int i = 0; i < list.size(); i++) {
                %>
                <tr>
                    <td><input type="submit" class="button" value="제거"></td>
                    <td><input type="submit" class="button" value="신청"></td>
                    <td><%= list.get(i).getClassNo()%></td>
                    <td><%= list.get(i).getCourseID()%></td>
                    <td><%= list.get(i).getName()%></td>
                    <td><%= list.get(i).getLecturerName()%></td>
                    <td><%= list.get(i).getDay()%></td>
                    <td><%= list.get(i).getBegin()%></td>
                    <td><%= list.get(i).getEnd()%></td>
                    <td><%= list.get(i).getMaxPerson()%></td>
                    <td><%= list.get(i).getBuilding()%></td>
                    <td><%= list.get(i).getRoom()%></td>
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

    <div style="text-align: center">
        <img src="images/error.jpg" alt="서비스 불가" style="width: 70%">
    </div>
</body>
<footer style="position : fixed; bottom: 0; width: 100%; background-color: white">
    <h5 style="color: darkblue; text-align: center"><%="Cho Yune / 2022 Fall Semester - Database System"%></h5>
</footer>
</html>
