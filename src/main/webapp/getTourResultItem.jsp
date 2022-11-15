<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%for(int i=0; i<6; i++) {%>
	<div class="col">
		<div class="card h-100">
			<img src="..." class="card-img-top" alt="...">
			<div class="card-body">
				<h5 class="card-title">관광지명</h5>
				<p class="card-text">주소</p>
			</div>
		</div>
	</div>
<%}; %>
</body>
</html>