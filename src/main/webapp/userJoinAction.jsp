<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.Dao_manager" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="dto.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />	
<jsp:setProperty name="user" property="userEmail" /> 
<jsp:setProperty name="user" property="userName" /> 
<jsp:setProperty name="user" property="userTel" /> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%	// ---> 2.
		if (user.getUserID() == null || user.getUserPassword() == null || user.getUserEmail() == null
			|| user.getUserName() == null || user.getUserTel() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {  // ---> 3.
			Dao_manager userDAO = new Dao_manager();
			int result = userDAO.join(user);
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else  {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('환영합니다.')");
				script.println("location.href = 'userLogin.jsp'");
				script.println("</script>");
			}	
		}
	%>
</body>
</html>