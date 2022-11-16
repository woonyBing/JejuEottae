<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="gridItemTourList">
		<h2 style="margin-bottom: 30px; text-align: center;">추천 관광지</h2>
		<div class="row row-cols-1 row-cols-md-3 g-4">
			<%@ include file="getTourResultItem.jsp"%>
		</div>
	</div>
</body>
</html>