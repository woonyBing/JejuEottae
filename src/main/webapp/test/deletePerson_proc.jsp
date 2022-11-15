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
		int id = Integer.parseInt(request.getParameter("id"));
		
		PersonDao personDao = new PersonDao();
		int result = personDao.deletePersonInfo(id);
		
		if(result > 0) {
	%>
		<script>
			alert('삭제되었습니다.');
			location.href = 'index.jsp';
		</script>
	<%
		} else {	
	%>
		<script>
			alert('삭제에 실패하였습니다.');
			location.href = 'personinfoDetail.jsp?id=<%=id%>';
		</script>
	<%
		}
	%>
</body>
</html>