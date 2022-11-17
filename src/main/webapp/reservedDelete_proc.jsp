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
String[] bi =request.getParameter("BI").split("/",2);
int bo_num =Integer.parseInt(bi[0]);
Dao_manager dm  = new Dao_manager();
dm.delete_Booking(bo_num);

%>

<script>
location.href='reservedCheck.jsp?id=<%=bi[1]%>'; 
</script> 
</body>
</html>