<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.Tour"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>JejuEottae</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<link rel="stylesheet" href="./index.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap"
	rel="stylesheet">
</head>

<body>

<%--
tour_list 테이블 만들고 insert 하는 dao
 	<% Tour tour = new Tour();
	 	tour.create_data_table();
	 	tour.all_data_to_table();
	%>
--%>

	<!-- header 및 nav 영역-->
	<header>
		<%@ include file="navBar.jsp"%>

		<div class="mainImg">
			<p class="mainStr">JejuEottae</p>
		</div>
	</header>

	<!-- section 영역 -->
	<section>
		<!-- 검색 영역 -->
		<%@ include file="formSearch.jsp"%>

		<div class="container">

			<!--지도 API 들어갈 자리-->
			<div class="mapBox">지도 API 들어갈 자리</div>


			<!--호텔리스트-->
			<%@include file="showHotelList.jsp"%>

			<!--관광지 리스트-->
			<%@include file="showTourList.jsp"%>

		</div>
	</section>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous">
	</script>
</body>

</html>