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
 String[] ri = request.getParameter("ri").split("/");

 Dao_manager dm  = new Dao_manager();
 dm.delete_review(Integer.parseInt(ri[0])); 

%>
<script>
location.href='reviewManage.jsp?id=<%=ri[1]%>'; 
</script> 

</body>
</html>