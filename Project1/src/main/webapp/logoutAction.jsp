<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
    <title>로그아웃 액션</title>
</head>
<%--세션 종료 후 로그인 모드를 선택하는 첫 화면으로 이동--%>
<body>
    <%
        session.invalidate();
    %>
    <script>
        location.href = 'index.jsp';
    </script>
</body>
</html>