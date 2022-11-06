<%@ page import="Project1.ClassList" %>
<%@ page import="Project1.Course" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
    <title>관리자-수강 편람</title>
    <link rel="stylesheet" href="css/button.css">
    <link rel="stylesheet" href="css/input.css">
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
<header>
    <div>
        <div style="text-align: center">
            <img src="images/HYU_hyu.png" onclick="location.href='adminMain.jsp'" alt="한양대학교 로고" style="height: 50px">
        </div>
        <nav>
            <ul id="top-menu">
                <li><a href="adminMain.jsp" style="color: dodgerblue">수강 편람</a></li>
                <li><a href="editClass.jsp">수강 개설 및 삭제</a></li>
                <li><a href="manageStudent.jsp">학생 조회 및 변경</a></li>
                <li><a href="manageClass.jsp">과목 조회 및 변경</a></li>
                <li><a href="OLAP.jsp">통계 기능(OLAP)</a></li>
                <li><a href="logoutAction.jsp">로그아웃</a></li>
            </ul>
        </nav>
    </div>
</header>
<body>
    <div class="frame">
        <table>
            <tr>
                <td><h3 style="display: inline; color: darkblue; margin: 70px">수업번호로 강의 검색</h3></td>
                <td>
                    <form style="display: inline; margin-right: 50px"; method="post"; action="adminMain.jsp">
                        <input type="text" class="form-control" placeholder="수업번호 전체입력" name="classNo" maxlength="20">
                        <input type="submit" class="button" value="검색">
                    </form>
                </td>
            </tr>
            <tr>
                <td><h3 style="display: inline; color: darkblue; margin: 70px">학수번호로 강의 검색</h3></td>
                <td>
                    <form style="display: inline; margin-right: 50px"; method="post"; action="adminMain.jsp">
                        <input type="text" class="form-control" placeholder="학수번호 전체입력" name="courseID" maxlength="20">
                        <input type="submit" class="button" value="검색">
                    </form>
                </td>
            </tr>
            <tr>
                <td><h3 style="display: inline; color: darkblue; margin: 70px">교과목명으로 강의 검색</h3></td>
                <td>
                    <form style="display: inline; margin-right: 50px"; method="post"; action="adminMain.jsp">
                        <input type="text" class="form-control" placeholder="키워드 입력 가능" name="name" maxlength="30">
                        <input type="submit" class="button" value="검색">
                    </form>
                </td>
            </tr>
        </table>
    </div>
    <div class="frame">
        <div class="row">
            <table>
                <thead>
                <tr>
                    <th>희망수업</th>
                    <th>수강신청</th>
                    <th>수업번호</th>
                    <th>학수번호</th>
                    <th>교과목명</th>
                    <th>교강사명</th>
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
                        ArrayList<Course> list;
                        if (request.getParameter("classNo") != null) {
                            int param1 = Integer.valueOf(request.getParameter("classNo"));
                            list = classList.search1(param1);
                        } else if (request.getParameter("courseID") != null) {
                            String param2 = request.getParameter("courseID");
                            list = classList.search2(param2);
                        } else if (request.getParameter("name") != null) {
                            String param3 = request.getParameter("name");
                            list = classList.search3(param3);
                        } else {
                            list = classList.search2("");
                        }
                        for(int i = 0; i < list.size(); i++) {
                %>
                <tr>
                    <td><input type="submit" class="button" value="추가"></td>
                    <td><input type="submit" class="button" value="신청"></td>
                    <td><%= list.get(i).getClassNo()%></td>
                    <td><%= list.get(i).getCourseID()%></td>
                    <td><%= list.get(i).getName()%></td>
                    <td><%= list.get(i).getLecturerName()%></td>
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
</body>
<footer style="position : fixed; bottom: 0; width: 100%; background-color: white">
    <h5 style="color: darkblue; text-align: center"><%="Cho Yune / 2022 Fall Semester - Database System"%></h5>
</footer>
</html>
