<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.Dao_manager" %>
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
Dao_manager dao = new Dao_manager();
	int result = dao.deleteReview(revNum);
	
	if(result>0){
%>
	<script>
			alert('삭제되었습니다.');
			location.href = 'index.jsp';
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
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">리뷰 삭제</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        정말로 삭제하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger">네</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>