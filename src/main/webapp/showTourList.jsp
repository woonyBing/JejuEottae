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
			<%

			for (int i = 0; i < 6; i++) {
			%>
			<div class="col">
				<div class="card h-100">
					<img
						src="https://www.newsje.com/news/photo/202111/247691_238275_81.png"
						class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">관광지명</h5>
						<p class="card-text">주소</p>
					</div>
				</div>
			</div>
			<%
			}
			;
			%>
		</div>
	</div>
</body>
</html>