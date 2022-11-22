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
 
String id= (String)session.getAttribute("userID");

 Dao_manager dm  = new Dao_manager();
 dm.delete_review(Integer.parseInt(request.getParameter("rev_num"))); 

%>
<script>
location.href='reviewManage.jsp'; 
</script> 

</body>
</html>