<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="sample.dao.PersonDao"%>
<%@ page import="sample.dto.PersonInfo"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
</head>
<body>
	<%@ include file="navBar.jsp"%>

	<%
		int id = Integer.parseInt(request.getParameter("id"));
		PersonDao personDao = new PersonDao();
		PersonInfo personInfo = personDao.selectPersonInfoById(id);
	%>
	
	<div>
		<h2>정보상세</h2>
		
		<form name="personDetailForm" class="row g-3" method="post">
			<div class="col-auto">
				<label for="name">이름</label>
				<input type="text" id="name" name="personName" value="<%=personInfo.getName()%>" required>
				<input type="hidden" name="id" value="<%=personInfo.getId()%>">
			</div>
				<div class="col-auto">
					<button id="updateBtn" type="button" class="btn btn-warning mb-3">수정</button>
				</div>
				<div id="deleteBtn" class="col-auto">
					<button type="button" class="btn btn-danger mb-3">삭제</button>
				</div>
		</form>
	</div>

	<script>
		document.getElementById('updateBtn').addEventListener('click',(e)=>{
			e.preventDefault();
			let form = document.personDetailForm;
			if(form.personName.value == ""){ //이름이 없는 경우
				alert('이름은 필수입니다.');
				form.personName.focus();
				return false;
			} else { //이름이 있는 경우
				if(confirm('수정하시겠습니까?')) {
					form.action = "updatePerson_proc.jsp";
					form.submit();
				}
			}
		});
		
		document.getElementById('deleteBtn').addEventListener('click',(e)=>{
			e.preventDefault();
			let form = document.personDetailForm;
			if(confirm('삭제하시겠습니까?')) {
				form.action = "deletePerson_proc.jsp";
				form.submit();
			}
		});
	</script>
</body>
</html>