<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.Dao_manager"%>
<%@ page import="dao.HotelInfo"%>
<%@ page import="dao.ImgPath"%>
<%@ page import="java.util.*"%>
<%-- <%@ page import="dao.Tour"%> --%>
<%
request.setCharacterEncoding("UTF-8");
%>
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
	<header style="margin:0px">
		<%String id = request.getParameter("id");%>
	
	<nav class="navbar navbar-expand-lg bg-light">
          <div class="container-fluid">
              <a class="navbar-brand" href="Main.jsp">제주어때🍊</a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
              <div class="navbar-nav">
                  <a class="nav-link active" aria-current="page" href="./index.jsp">Logout</a>
                  <a class="nav-link " href="./mypage.jsp?id=<%=id%>">My page</a>
              </div>
              </div>
          </div>
      </nav>



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
			<div class="mapBox">
				<div class="mapBox">
					<%
					Dao_manager hotelDao = new Dao_manager();
					List<HotelInfo> hotelInfoList = hotelDao.selectHotelInfoList();
					List<ImgPath> imgPathList = hotelDao.selectImgPath();
					%>
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
						var locations = [];
				</script>

					<%
					if (hotelInfoList != null && hotelInfoList.size() > 0) {
						for (HotelInfo info : hotelInfoList) {
					%>


					<script>
						locations = [...locations, ['<div><h3>'+'<%=info.getNAME()%>'+'</h3><p><%=info.getRATING()%> 성</p><p>주소: <%=info.getADDRESS()%></p><p>전화번호: <%=info.getTEL()%></p><p><button class="btn btn-secondary" onclick= "scrolltoId()">자세히 알아보기</button></p></div>', <%=info.getX()%>, <%=info.getY()%>]];
					
						function scrolltoId(){
							var access = document.getElementById("id1");
							access.scrollIntoView();
							}
				</script>


					<%
					}
					}
					%>
					<div id="bound">
						<div id="map"></div>
					</div>


				</div>


				<!--호텔리스트
				 -->
				<div id="id1">
	<div class="gridItemHotelList">
		<h2 style="margin-bottom: 30px; text-align: center;">숙소 검색 결과</h2>

		<div class="accordion" id="accordionPanelsStayOpenExample">
			<%
			// 	form 양식 가져오는 부분
				String name = request.getParameter("location");
				String name2 = request.getParameter("lodgingType");
				
			%>
				<div class="accordion-item">
					<h2 class="accordion-header" id="panels1">
						<button class="accordion-button" type="button"
							data-bs-toggle="collapse"
							data-bs-target="#panelsStayOpen-collapse1" aria-expanded="true"
							aria-controls="panelsStayOpen-collapse1">호텔 1</button>
					</h2>
					<div id="panelsStayOpen-collapse1"
						class="accordion-collapse collapse show"
						aria-labelledby="panels1>">
						<div class="accordion-body">
							<div id="carouselExampleControls" class="carousel slide"
								data-bs-ride="carousel">
								<div class="carousel-inner">
									<div class="carousel-item active">
										<img
											src="https://images.unsplash.com/photo-1595737335975-2160c924caf2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80"
											class="d-block w-100" alt="호텔이미지1">
									</div>
									<div class="carousel-item">
										<img
											src="https://images.unsplash.com/photo-1596941248238-0d49dcaa4263?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80"
											class="d-block w-100" alt="호텔이미지2">
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
							
							<table class="table"  style="margin-bottom:100px;">
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
							
							
			
				
							<!--날짜선택-->
							<div class="inputGrid">
								<div class="inputDate">
									<label for="reservationDate">체크인</label>
									<input id="startDate"
										type="date" class="form-control" name="startDate">
								</div>
								<div class="inputDate">
									<label for="reservationDate">체크아웃</label>
									<input id="endDate"
										type="date" class="form-control" name="endDate">
								</div>
							</div>
			
							<!--인원선택-->
							<div class="gridItemPersonCnt" style="margin-bottom:100px;">
								<label for="personCnt">인원</label>
								<select class="form-select"
									aria-label="Default select example" name="personCnt">
									<%
										for (int i = 1; i <= 10; i++) {
									%>
										<option id="<%=i%>" value="<%=i%>"><%=i%></option>
									<%
										};
									%>
								</select>
							</div>
							
							
							<button type="button" class="btn btn-primary" data-bs-toggle="modal"
								data-bs-target="#exampleModal">예약하기</button>
							<div class="modal fade" id="exampleModal" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h1 class="modal-title fs-5" id="exampleModalLabel">예약 완료!</h1>
											<button type="button" class="btn-close" data-bs-dismiss="modal"
												aria-label="Close"></button>
										</div>
										<div class="modal-body">자세한 내역은 my page에서 확인해주세요 :)</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-primary"
												onclick="location.href='./mypage.jsp?id=<%=id%>'">My page</button>
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">Close</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>		</div>
	</div>				</div>

				<!--관광지 리스트
				 -->
				<%@include file="showTourList.jsp"%>


			</div>
	</section>
	<script>
				function initMap() {
					const myLatLng = { //기본 좌표 값: 한라산
						lat : 33.360139,
						lng : 126.534247
					};

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
									locations[i][1],
									locations[i][2]
									),
							map : map
						});

						google.maps.event.addListener(marker, 'click',
								(function(marker, i) {
									return function() {
										infowindow.setContent(locations[i][0]);
										infowindow.open(map, marker);
									}
								})(marker, i));
					}
				}
			</script>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous">
		
	</script>
</body>

</html>