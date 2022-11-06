<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>관리자-수강 개설 및 삭제</title>
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
        h3 {
            display: inline-block;
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
                <li><a href="adminMain.jsp">수강 편람</a></li>
                <li><a href="editClass.jsp" style="color: dodgerblue">수강 개설 및 삭제</a></li>
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
        <form>
            <table>
                <tr>
                    <th><h3>수업ID</h3></th>
                    <td><input type="text" class="form-control" placeholder="수업ID" name="classID" maxlength="5"></td>
                    <th><h3>수업번호</h3></th>
                    <td><input type="text" class="form-control" placeholder="수업번호" name="classNO" maxlength="5"></td>
                    <th><h3>학수번호</h3></th>
                    <td><input type="text" class="form-control" placeholder="학수번호" name="courseID" maxlength="7"></td>
                </tr>
                <tr>
                    <th><h3>교과목명</h3></th>
                    <td><input type="text" class="form-control" placeholder="교과목명" name="className" maxlength="20"></td>
                    <th><h3>전공번호</h3></th>
                    <td><input type="text" class="form-control" placeholder="전공번호" name="classID" maxlength="2"></td>
                    <th><h3>학년</h3></th>
                    <td><input type="text" class="form-control" placeholder="학년" name="year" maxlength="1"></td>
                </tr>
                <tr>
                    <th><h3>학점</h3></th>
                    <td><input type="text" class="form-control" placeholder="학점" name="credit" maxlength="1"></td>
                    <th><h3>교강사ID</h3></th>
                    <td><input type="text" class="form-control" placeholder="교강사ID" name="lecturerID" maxlength="10"></td>
                    <th><h3>수정원인원</h3></th>
                    <td><input type="text" class="form-control" placeholder="정원인원" name="personMax" maxlength="3"></td>
                </tr>
                <tr>
                    <th><h3>개설년도</h3></th>
                    <td><input type="text" class="form-control" placeholder="개설년도" name="opened" maxlength="4"></td>
                    <th><h3>강의실</h3></th>
                    <td><input type="text" class="form-control" placeholder="강의실" name="roomID" maxlength="3"></td>
                </tr>
            </table>
            <input type="submit" class="button" value="개설" style="text-align: center">
        </form>
    </div>

    <div class="frame">
        <form>
            <table>
                <tr>
                    <th><h3>수업번호</h3></th>
                    <td><input type="text" class="form-control" placeholder="수업번호" name="classNO" maxlength="5"></td>
                    <th><h3>학수번호</h3></th>
                    <td><input type="text" class="form-control" placeholder="학수번호" name="courseID" maxlength="7"></td>
                    <th><h3>교과목명</h3></th>
                    <td><input type="text" class="form-control" placeholder="교과목명" name="className" maxlength="20"></td>
                </tr>
            </table>
            <input type="submit" class="button" value="삭제">
        </form>
    </div>
</body>
<footer style="position : fixed; bottom: 0; width: 100%; background-color: white">
    <h5 style="color: darkblue; text-align: center"><%="Cho Yune / 2022 Fall Semester - Database System"%></h5>
</footer>
</html>
