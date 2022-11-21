<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.User"%>
<%@ page import="dao.UserDAO"%>
<%@ page import="java.util.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		
	    String id = request.getParameter("userID");
	    String password = request.getParameter("userPassword");
		UserDAO userDao = new UserDAO();
		int result = userDao.delete(id,password);
		
		if(result > 0 ){
	%>
			<script>
			alert('회원탈퇴 완료');
			location.href = "index.jsp";
			</script>
	<%
		} else {
	%>
			<script>
			alert('비밀번호를 다시 확인해주세요.');
			location.href="userDelete.jsp";
			</script>
	<%
		}
	%>
</body>
</html>