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
String id = request.getParameter("id");
Dao_manager dm  = new Dao_manager();
dm.updateReview(Integer.parseInt(request.getParameter("rev_num")), Integer.parseInt(request.getParameter("rating")), request.getParameter("comment"));

%>
<script>
location.href='reviewManage.jsp?id=<%=id%>'; 
</script> 

</body>
</html>