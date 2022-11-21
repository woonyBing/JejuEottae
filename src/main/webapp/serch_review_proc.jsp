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
String CPI = request.getParameter("category")+"/"+request.getParameter("period")+"/"+request.getParameter("id");
%>
<script>
location.href='reviewManage.jsp?CPI=<%=CPI%>'; 

</script> 
</body>
</html>