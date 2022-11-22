<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ page import="dao.Dao_manager" %>
    <% request.setCharacterEncoding("UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 

int bo_num =Integer.parseInt(request.getParameter("bo_num"));
Dao_manager dm  = new Dao_manager();
dm.delete_Booking(bo_num);
%>

<script>
location.href='reservedCheck.jsp'; 
</script> 
</body>
</html>