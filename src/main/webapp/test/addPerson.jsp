<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<!--
		중복되는 코드는 jsp파일 따로 만들어서 넣는게 좋다!
		navBar.jsp 따로 만들어서 넣기
	-->
	<%@ include file="navBar.jsp"%>

	<div>
		<h2>신규인원추가</h2>
		<!--
			action => 어디로 보낼까!
		 -->
		<form name="addPersonForm" class="row g-3"
			action="addPerson_proc.jsp" method="post">
			<div class="col-auto">
				<label for="name">이름</label>
				<input type="text" id="name" name="personName" value="" required>
																	<!--
																		required => 값을 입력해달라는 문구를 띄워준다
																	 -->
			</div>
			<div class="col-auto">
				<button type="submit" class="btn btn-primary mb-3">추가</button>
			</div>
		</form>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
</body>
</html>