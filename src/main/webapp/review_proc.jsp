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

 dm.save_review(id,Integer.parseInt(request.getParameter("bo_num")),request.getParameter("comment"),Integer.parseInt(request.getParameter("rating")));// 쿼리스트링 자체에 sysdate 하기
%>
<script>
location.href='reservedCheck.jsp'; 
</script> 

</body>
</html>