<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>

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
						<!--여기서 반복문 시작-->
						<option value="1">1</option>
						<option value="2">2</option>
						<!--여기까지-->
					</select>
				</div>

				<!--검색버튼-->
				<button type="button" class="btn btn-primary gridItemBtn">검색</button>
			</div>
		</form>

		<div class="container">
			<!--지도 API 들어갈 자리-->
			<div class="mapBox">
				
					<style type="text/css">
#bound {
	height: 100%;
	width: 100%;
}
/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
#map {
	height: 100%;
}

/* Optional: Makes the sample page fill the window. */
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}
</style>
				<script
					src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
				<script
					src="https://maps.googleapis.com/maps/api/js?AIzaSyBjn-80evCQ7YDKFJR0fLXyBe-oKRhOWQw&callback=initMap&libraries=&v=weekly"
					defer>
					
				</script>

				<script>
					function initMap() {
						const myLatLng = { //기본 좌표 값: 한라산
							lat : 33.360139,
							lng : 126.534247
						};

						var locations = [ [
										'<div>'
										+ '<<h3>그랜드하얏트제주</h3>'
										+ '<img src="https://cdn.pixabay.com/photo/2014/08/17/23/45/hotel-420260_960_720.jpg" width="40px" height="50%"></img>'
										+ '</div>', 33.484759, 126.482115 ],
										
						];

						var map = new google.maps.Map(document
								.getElementById('map'), {
							zoom : 11,
							center : myLatLng,
						});

						var infowindow = new google.maps.InfoWindow();

						var marker, i;

						for (i = 0; i < locations.length; i++) {
							marker = new google.maps.Marker({
								position : new google.maps.LatLng(
										locations[i][1], locations[i][2]),
								map : map
							});

							google.maps.event
									.addListener(
											marker,
											'click',
											(function(marker, i) {
												return function() {
													infowindow
															.setContent(locations[i][0]);
													infowindow
															.open(map, marker);
												}
											})(marker, i));
						}
					}
				</script>

				<div id="bound">
					<div id="map"></div>
				</div>
			</div>


			<!--호텔리스트-->
			<div class="gridItemHotelList">
				<h2 style="margin-bottom: 30px; text-align: center;">숙소 검색 결과</h2>

				<div class="accordion" id="accordionPanelsStayOpenExample">
					<!--
						여기서부터
				
				
					-->
					<div class="accordion-item">
							<h2 class="accordion-header" id="panelsStayOpen-headingOne">
								<button class="accordion-button" type="button" data-bs-toggle="collapse"
									data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true"
									aria-controls="panelsStayOpen-collapseOne">호텔 1
								</button>
							</h2>
							<div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
      							<div class="accordion-body">
									<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
										<div class="carousel-inner">
											<div class="carousel-item active">
												<img src="https://images.unsplash.com/photo-1595737335975-2160c924caf2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80"
													class="d-block w-100" alt="...">
											</div>
											<div class="carousel-item">
												<img src="https://images.unsplash.com/photo-1596941248238-0d49dcaa4263?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80"
													class="d-block w-100" alt="...">
											</div>
										</div>
										<button class="carousel-control-prev" type="button"
											data-bs-target="#carouselExampleControls" data-bs-slide="prev">
											<span class="carousel-control-prev-icon" aria-hidden="true"></span>
											<span class="visually-hidden">Previous</span>
										</button>
										<button class="carousel-control-next" type="button"
											data-bs-target="#carouselExampleControls" data-bs-slide="next">
											<span class="carousel-control-next-icon" aria-hidden="true"></span>
											<span class="visually-hidden">Next</span>
										</button>
									</div>
									<table class="table" style="margin-bottom: 100px;">
										<thead>
											<tr>
												<th scope="col" style="width: 20%">NAME</th>
												<th style="width: 40%">ADRESS</th>
												<th style="width: 20%">TEL</th>
												<th style="width: 20%">GRADE</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<!--여기 들어갈 내용은 db에서 가져와 넣기-->
												<th scope="row" style="width: 20%">HotelJeju</th>
												<td style="width: 40%">제주도 제주시 도령로 27</td>
												<td style="width: 20%">123)456-7890</td>
												<td style="width: 20%">스탠다드</td>
											</tr>
										</tbody>
									</table>


									<table class="table">
										<thead>
											<tr>
												<th scope="col" colspan="4">REVIEW</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<!--여기 들어갈 내용은 db에서 가져와 넣기-->
												<td scope="row" style="width: 20%">?/5</td>
												<td style="width: 70%">리뷰코멘트</td>
											</tr>
										</tbody>
									</table>
									<!-- style="display: none;"  -->
									<button type="button" class="btn btn-primary" data-bs-toggle="modal"
										data-bs-target="#exampleModal">
										예약하기
									</button>
									<div class="modal fade" id="exampleModal" tabindex="-1"
										aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h1 class="modal-title fs-5" id="exampleModalLabel">예약 실패</h1>
													<button type="button" class="btn-close" data-bs-dismiss="modal"
														aria-label="Close"></button>
												</div>
												<div class="modal-body">
													로그인 후 이용해주세요.
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-primary"
														onclick="location.href='./login.jsp'">Login 하러가기</button>
													<button type="button" class="btn btn-secondary"
														data-bs-dismiss="modal">Close</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!--
						여기까지 반복문 돌릴 위치
				
						
					-->
				</div>
			</div>

			<!--관광지 리스트-->
			<div class="gridItemTourList">
				<h2 style="margin-bottom: 30px; text-align: center;">추천 관광지</h2>
				<div class="row row-cols-1 row-cols-md-3 g-4">

					<!--
                        여기서부터


                    -->
					<div class="col">
						<div class="card h-100">
							<img src="..." class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title">관광지명</h5>
								<p class="card-text">주소</p>
							</div>
						</div>
					</div>
					<!--
                        여기까지 반복문 돌릴 위치


                    -->
					<div class="col">
						<div class="card h-100">
							<img src="..." class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title">반복문 돌리면 지워질 애들</h5>
								<p class="card-text">주소</p>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card h-100">
							<img src="..." class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title">반복문 돌리면 지워질 애들</h5>
								<p class="card-text">주소</p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
				crossorigin="anonymous">
			</script>
</body>

</html>