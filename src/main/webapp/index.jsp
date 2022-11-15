<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>JejuEottae</title>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<link rel="stylesheet" href="./index.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
</head>

<body>
	<!-- header 및 nav 영역-->
	<header>
		<%@ include file="navBar.jsp"%>
		<div class="mainImg">
			<p class="mainStr">JejuEottae</p>
		</div>
	</header>

	<!-- section 영역 -->
	<section>
		<form name="reservationForm">
			<div class="formgrid">
				<!--지역 선택 자리-->
				<div class="gridItemLocation">
					<label for="location">지역</label> <select class="form-select" aria-label="Default select example">
						<option value="1" selected>제주시</option>
						<option value="2">서귀포시</option>
					</select>
				</div>
				<!--숙소선택-->
				<div class="gridItemCheckBerth">
					<label for="berthType">숙소 유형</label> <select class="form-select"
						aria-label="Default select example">
						<option value="1">호텔</option>
						<option value="2">리조트</option>
					</select>
				</div>
				<!--날짜선택-->
				<div class="gridItemDate">
					<label for="reservationDate">체크인</label> <input id="startDate" type="date" class="form-control">
				</div>
				<div class="gridItemDate">
					<label for="reservationDate">체크아웃</label> <input id="endDate" type="date" class="form-control">
				</div>
				<!--인원선택-->
				<div class="gridItemPersonCnt">
					<label for="personCnt">인원</label> <select class="form-select" aria-label="Default select example">
						<% for (int i = 1; i<=10; i++) { %>
							<option value="1"><%=i%></option>
						<%}; %>
					</select>
				</div>

				<!--검색버튼-->
				<button type="button" class="btn btn-primary gridItemBtn">검색</button>
			</div>
		</form>

		<div class="container">
			<!--지도 API 들어갈 자리-->
			<div class="mapBox">지도 API 들어갈 자리</div>


			<!--호텔리스트-->
			<div class="gridItemHotelList">
				<h2 style="margin-bottom: 30px; text-align: center;">숙소 검색 결과</h2>

				<div class="accordion" id="accordionPanelsStayOpenExample">
					<%@ include file="getHotelResultItem.jsp"%>
				</div>
			</div>

			<!--관광지 리스트-->
			<div class="gridItemTourList">
				<h2 style="margin-bottom: 30px; text-align: center;">추천 관광지</h2>
				<div class="row row-cols-1 row-cols-md-3 g-4">
					<%@ include file ="getTourResultItem.jsp" %>
				</div>
			</div>

			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
				crossorigin="anonymous">
			</script>
</body>

</html>