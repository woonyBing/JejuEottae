<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD
<%@ page import="dao.Dao_manager" %> <!-- login 함수를 사용하여 로그인 처리를 하기 위해 user패키지의 UserDAO를 불러온다 -->
=======
<%@ page import="dao.UserDAO" %> <!-- login 함수를 사용하여 로그인 처리를 하기 위해 user패키지의 UserDAO를 불러온다 -->
>>>>>>> 2ca379f8f06bb4e5da96ab39bfb386bf918e9d1f
<%@ page import="java.io.PrintWriter" %> <!-- 자바 스크립트 문장을 작성하기 위해 사용-->
<% request.setCharacterEncoding("UTF-8"); %> <!-- 건너오는 모든 데이터를 UTF-8으로 받을 수 있도록 함 -->
<jsp:useBean id="user" class="dao.User" scope="page"/> <!-- 한명의 회원 정보를 담는 User클래스를 자바 빈즈로 사용하며 현재 page안에서만 빈즈를 사용 -->
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Web Site</title>
</head> 
<body>
	<%  // 로그인 페이지에서 넘겨준 userID와 userPassword를 받아서 로그인 판별
<<<<<<< HEAD
	Dao_manager userDAO = new Dao_manager();
=======
		UserDAO userDAO = new UserDAO();
>>>>>>> 2ca379f8f06bb4e5da96ab39bfb386bf918e9d1f
		int result = userDAO.login(user.getUserID(), user.getUserPassword());
		if (result == 1){ // 로그인 정보가 맞으면 자바스크립트를 실행하여 페이지를 이동시킴
			PrintWriter script = response.getWriter();
			script.println("<script>");
<<<<<<< HEAD
			script.println("location.href ='Main.jsp?id="+user.getUserID()+"'"); // main 페이지로 사용자를 보냄 
=======
			script.println("location.href ='Main.jsp'"); // main 페이지로 사용자를 보냄 
>>>>>>> 2ca379f8f06bb4e5da96ab39bfb386bf918e9d1f
			script.println("</script>");
		}
		else if (result == 0){ 
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");	
			script.println("history.back()"); // 이전 페이지로 사용자를 돌려 보냄.	
			script.println("</script>");
		}
		else if (result == -2){ 
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다.')");	
			script.println("history.back()");	
			script.println("</script>");
		}
		else if (result == -1){ 
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('아이디 또는 비밀번호가 틀립니다.')");	
			script.println("history.back()");	
			script.println("</script>");
		}
		
	%>
</body>
</html>