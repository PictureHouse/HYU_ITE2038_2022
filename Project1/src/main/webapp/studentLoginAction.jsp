<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="Project1.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="Project1.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
  <title>학생 로그인 액션</title>
</head>
<%--studentLogin.jsp로부터 값을 받은 후 login() method를 수행하여 로그인 과정을 수행한 후 login() method의 리턴 값에 따라 해당하는 메시지를 출력한 후 다음 화면으로 이동--%>
<body>
  <%
    String userID = null;
    if (session.getAttribute("userID") != null) {
      userID = (String) session.getAttribute("userID");
    }
    if (userID != null) {
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('이미 로그인이 되어있습니다.')");
      script.println("location.href = 'studentMain.jsp'");
      script.println("</script>");
    }

    UserDAO userDAO = new UserDAO();

    int result = userDAO.login(user.getUserID(), user.getUserPassword());

    if (result == 1) {
      session.setAttribute("userID", user.getUserID());
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("location.href = 'studentMain.jsp'");
      script.println("</script>");
    } else if (result == 0) {
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('비밀번호가 틀립니다.')");
      script.println("history.back()");
      script.println("</script>");
    } else if (result == -1) {
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('존재하지 않는 아이디입니다.')");
      script.println("history.back()");
      script.println("</script>");
    } else if (result == -2) {
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('데이터베이스 오류가 발생했습니다.')");
      script.println("history.back()");
      script.println("</script>");
    }
  %>
</body>
</html>