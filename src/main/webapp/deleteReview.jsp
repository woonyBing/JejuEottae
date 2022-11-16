<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.reviewDao" %>
<%@ page import="dto.Review" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int revNum = Integer.parseInt(request.getParameter("rev_num"));
	reviewDao dao = new reviewDao();
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
			location.href = 'reviewDelete.jsp?revNum=<%=revNum%>';
		</script>
	<%
		}
	%>

</body>
</html>