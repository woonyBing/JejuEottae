<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.Dao_manager" %>
<%@ page import="dao.Review" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int revNum = Integer.parseInt(request.getParameter("rev_num"));
	
	Dao_manager dao = new Dao_manager();
	int result = dao.deleteReview(revNum);
	if(result>0){
%>
	<script>
			alert('삭제되었습니다.');
			location.href = 'reviewManage.jsp';
		</script>
	<%
		} else {	
	%>
		<script>
			alert('삭제에 실패하였습니다.');
			 location.href = 'reviewManage.jsp'; 
			/* 로그인하면 아이디가 넘어오는 폼을 사용해야함 */
		</script>
	<%
		}
	%>

</body>
</html>