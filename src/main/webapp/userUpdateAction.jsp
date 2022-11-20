<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.UserDAO" %> <!-- login 함수를 사용하여 로그인 처리를 하기 위해 user패키지의 UserDAO를 불러온다 -->
<%@ page import="dto.User" %>
<%@ page import="java.io.PrintWriter" %> <!-- 자바 스크립트 문장을 작성하기 위해 사용-->
<% request.setCharacterEncoding("UTF-8"); %> <!-- 건너오는 모든 데이터를 UTF-8으로 받을 수 있도록 함 -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Web Site</title>
</head> 
<body>
<%
	String password = request.getParameter("userPassword");
	String id = request.getParameter("userID");
	String email = request.getParameter("userEmail");
	String tel = request.getParameter("userTel");

	User user = new User();
	user.setUserPassword(password);
	user.setUserID(id);
	user.setUserEmail(email);
	user.setUserTel(tel);

	UserDAO userDao = new UserDAO();
	int result = userDao.update(user);
	
	out.println(id+password+email+tel);
// 	out.println(user);
	out.println(user.getUserID());

	if (result > 0) {
	%>
	<script>
		alert('수정되었습니다.')
		location.href = "myInfo.jsp";
	</script>
	<%
	} else {
	%>
	<script>
		alert('수정 실패')
		locaion.href = "userUpdate.jsp";
	</script>
	<%
	}
	%>
</body>
</html>