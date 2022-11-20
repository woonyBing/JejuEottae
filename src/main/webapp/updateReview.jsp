<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.Dao_manager"%>
<%@ page import="dao.Review"%>
<%@ page import="java.util.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String content = request.getParameter("comment");
		int score = Integer.parseInt(request.getParameter("rating"));
		String email = request.getParameter("userEmail");
		Review review = new Review();
		review.setContent(content);
		review.setScore(score);
		review.setUserEmail(email);
		
		Dao_manager dao = new Dao_manager();
		int result = dao.updateReview(review);
		
		if(result > 0 ){
	%>
	
			<script>
				alert('수정되었습니다.');
				location.href = "reviewManage.jsp";
			</script>
			
			
	<%
		} else {
	%>
			
			<script>
				alert('수정에 실패하였습니다.');
				location.href='reviewManage.jsp';
			</script>
			
	<%
		}
	%>
</body>
</html>