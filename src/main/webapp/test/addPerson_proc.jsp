<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sample.dao.PersonDao"%>
<%@ page import="sample.dto.PersonInfo"%>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
// 		addPerson.jsp 안에 From 태그로 만들어진 양식이 있다
// 		그 안에 "name"이라는 태그가 들어있는데,
// 		Form양식에서 무슨 값인지 인식하는게 name이다.
// 		버튼으로 submit 하면 action으로 addPerson_proc.jsp로 요청이 간다. action="addPerson_proc.jsp"
// 		그 요청은 request에 담겨서 온다
// 		request => 내장객체
		String name = request.getParameter("personName");
		PersonDao personDao = new PersonDao();
		int result = personDao.insertPersonInfo(name);
		
		if(result > 0) {
	%>
		<script>alert('추가되었습니다.')</script>
	<%
		} else {	
	%>
		<script>alert('추가에 실패하였습니다.')</script>
	<%
		}
	%>
		<script>location.href = "index.jsp"</script>
</body>
</html>