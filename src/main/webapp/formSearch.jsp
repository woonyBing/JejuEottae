<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="searchForm" action="index.jsp">
		<div class="formgrid">
			<!--지역 선택 자리-->
			<div class="gridItemLocation">
				<label for="location">지역</label>
				<select class="form-select"
					aria-label="Default select example" name="location">
					<option value="Jeju" selected>제주시</option>
					<option value="Seogwipo">서귀포시</option>
				</select>
			</div>
			<!--숙소선택-->
			<div class="gridItemCheckBerth">
				<label for="lodgingType">숙소 유형</label>
				<select class="form-select"
					aria-label="Default select example" name="lodgingType">
					<option value="Hotel">호텔</option>
					<option value="Resort">리조트</option>
				</select>
			</div>
			<!--검색버튼-->
			<button type="submit" class="btn btn-primary gridItemBtn">검색</button>
		</div>
	</form>
</body>
</html>