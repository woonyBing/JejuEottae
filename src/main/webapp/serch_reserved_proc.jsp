<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String CP = request.getParameter("category")+"/"+request.getParameter("period");
%>
<script>
location.href='reservedCheck.jsp?CP=<%=CP%>'; 

</script> 
</body>
</html>