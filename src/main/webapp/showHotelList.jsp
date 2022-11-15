<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="gridItemHotelList">
		<h2 style="margin-bottom: 30px; text-align: center;">숙소 검색 결과</h2>

		<div class="accordion" id="accordionPanelsStayOpenExample">
			<%@ include file="getHotelResultItem.jsp"%>
		</div>
	</div>
</body>
</html>