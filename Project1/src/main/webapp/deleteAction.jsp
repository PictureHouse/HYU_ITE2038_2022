<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="Project1.ClassList" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
  <title>관리자-강좌 삭제 액션</title>
</head>
<%--삭제할 강좌의 정보를 전달받아 delete() method를 수행한 후 리턴 값에 따라 해당하는 메시지를 출력한 후 다음 화면으로 이동--%>
<body>
<%
  try {
    String classID = request.getParameter("classID");

    ClassList classList = new ClassList();

    int result = classList.delete(classID);

    if (result == 1) {
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('강좌가 삭제되었습니다.')");
      script.println("location.href = 'editClass.jsp'");
      script.println("</script>");
    } else if (result == 0) {
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('데이터베이스 오류가 발생했습니다.')");
      script.println("history.back()");
      script.println("</script>");
    }
  } catch (Exception e) {
    e.printStackTrace();
  }
%>
</body>
</html>