<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="searchForm">
		<div class="formgrid">
			<!--지역 선택 자리-->
			<div class="gridItemLocation">
				<label for="location">지역</label> <select class="form-select"
					aria-label="Default select example">
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
				<label for="reservationDate">체크인</label> <input id="startDate"
					type="date" class="form-control">
			</div>
			<div class="gridItemDate">
				<label for="reservationDate">체크아웃</label> <input id="endDate"
					type="date" class="form-control">
			</div>
			<!--인원선택-->
			<div class="gridItemPersonCnt">
				<label for="personCnt">인원</label> <select class="form-select"
					aria-label="Default select example">
					<%
					for (int i = 1; i <= 10; i++) {
					%>
					<option value="1"><%=i%></option>
					<%
					}
					;
					%>
				</select>
			</div>

			<!--검색버튼-->
			<button type="button" class="btn btn-primary gridItemBtn">검색</button>
		</div>
	</form>
</body>
</html>