<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.HotelDAO"%>
<%@ page import="dto.HotelInfo"%>
<%@ page import="dto.ImgPath"%>
<%@ page import="dao.Tour"%>
<%@ page import="dao.TourImgDao"%>
<%@ page import="dto.TourImg"%>
<%@ page import="java.util.*"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>제주어때🍊</title>

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

	<!-- header 및 nav 영역-->
	<header>
		<%@ include file="navBarLogined.jsp"%>

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
			<div id="mapBox" class="mapBox">
				<div class="mapBox">
					<%
					//action으로 주소, 숙소타입 받아서 리스트에 저장하는 부분
					String hAddress = request.getParameter("location");
					String hType = request.getParameter("lodgingType");

					HotelDAO hotelDao = new HotelDAO();
					List<HotelInfo> searchHotelInfoList = hotelDao.selectHotelInfoListByaddNtype(hAddress, hType);
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
						defer></script>

					<script>							
						var locations = [];
				</script>

					<%
					//submit 받은 정보들이 제대로 List에 저장 되었는지 확인하고 실행
					if (searchHotelInfoList != null && searchHotelInfoList.size() > 0) {
						//List에 저장된 호텔 정보 꺼내기
						for (HotelInfo hotelInfo : searchHotelInfoList) {
					%>


					<script>
					//배열로 그려지는? 지도 영역
					locations = [...locations, ['<div><h3>'+'<%=hotelInfo.getNAME()%>'+'</h3><p><%=hotelInfo.getRATING()%> 성</p><p>주소: <%=hotelInfo.getADDRESS()%></p><p>전화번호: <%=hotelInfo.getTEL()%></p><p><button id= "mapBtn" class="btn btn-secondary" type="button" onClick="showLodging(<%=hotelInfo.getID()%>)">자세히 알아보기</button></p></div>', <%=hotelInfo.getX()%>, <%=hotelInfo.getY()%>]];
					
					//지도에서 '자세히 보기' 눌렀을 때 실행되는 함수
					//hotelInfo객체의 id값을 매개변수로 받아
					//그에 해당하는 숙소 결과로 스크롤이 이동함
					function showLodging(hotelInfoId){
						var access = document.getElementById(hotelInfoId);
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
				
				<div id="resultsLodging" class="gridItemHotelList">
				<h2 id="titleHotel">숙소 검색 결과</h2>
				<%
				for (HotelInfo hotelInfo : searchHotelInfoList) {
					List<ImgPath> imgPathList = hotelDao.selectHotelInfoListByHotelId(hotelInfo.getID());
				%>
				<!--호텔리스트
				 	-->
				<div id="<%=hotelInfo.getID()%>">
					<div id="showHotel">
						<div class="accordion" id="accordionPanelsStayOpenExample">
							<div class="accordion-item">
								<h2 class="accordion-header" id="panels<%=hotelInfo.getID()%>">
									<button id="wrapButton" class="accordion-button" type="button"
										data-bs-toggle="collapse"
										data-bs-target="#panelsStayOpen-collapse<%=hotelInfo.getID()%>"
										aria-expanded="true"
										aria-controls="panelsStayOpen-collapse<%=hotelInfo.getID()%>">
										<%=hotelInfo.getNAME()%></button>
								</h2>
								<div id="panelsStayOpen-collapse<%=hotelInfo.getID()%>"
									class="accordion-collapse collapse show"
									aria-labelledby="panels<%=hotelInfo.getID()%>">
									<div class="accordion-body">
										<div id="carouselExampleControls" class="carousel slide"
											data-bs-ride="carousel">
											<div class="carousel-inner">
												<div class="carousel-item active">
													<img src=<%=imgPathList.get(0).getImg_url()%>
														class="d-block w-100" alt="호텔외관이미지">
												</div>
												<div class="carousel-item">
													<img
														src="https://cdn.loewshotels.com/loewshotels.com-2466770763/cms/cache/v2/5f5a6e0d12749.jpg/1920x1080/fit/80/86e685af18659ee9ecca35c465603812.jpg"
														class="d-block w-100" alt="룸이미지1">
												</div>
												<div class="carousel-item">
													<img
														src="https://www.gannett-cdn.com/-mm-/05b227ad5b8ad4e9dcb53af4f31d7fbdb7fa901b/c=0-64-2119-1259/local/-/media/USATODAY/USATODAY/2014/08/13/1407953244000-177513283.jpg"
														class="d-block w-100" alt="룸이미지2">
												</div>
												<div class="carousel-item">
													<img
														src="https://media.cntraveler.com/photos/624a1faa56ae3ba9ee4281e3/master/w_1920%2Cc_limit/Soho%2520House%2520Rome_Copyright%2520Soho%2520House%2520Rome%2520003.jpg"
														class="d-block w-100" alt="룸이미지3">
												</div>
											</div>
<!--분명 디자인 전체가 for문 도는데 슬라이드 넘어가는 버튼이 두번째 아코디언부터 안 먹힘
애들하고 얘기해보기 -->
<!-- 											<button class="carousel-control-prev" type="button" -->
<!-- 												data-bs-target="#carouselExampleControls" -->
<!-- 												data-bs-slide="prev"> -->
<!-- 												<span class="carousel-control-prev-icon" aria-hidden="true"></span> -->
<!-- 												<span class="visually-hidden">Previous</span> -->
<!-- 											</button> -->
<!-- 											<button class="carousel-control-next" type="button" -->
<!-- 												data-bs-target="#carouselExampleControls" -->
<!-- 												data-bs-slide="next"> -->
<!-- 												<span class="carousel-control-next-icon" aria-hidden="true"></span> -->
<!-- 												<span class="visually-hidden">Next</span> -->
<!-- 											</button> -->
										</div>
										<table class="table" style="margin-bottom: 100px;">
											<thead>
												<tr id="tableTitle">
													<th scope="col" style="width: 20%">NAME</th>
													<th style="width: 40%">ADRESS</th>
													<th style="width: 20%">TEL</th>
													<th style="width: 20%">GRADE</th>
												</tr>
											</thead>
											<tbody>
												<tr id="tableValue">
													<!--여기 들어갈 내용은 db에서 가져와 넣기-->
													<th scope="row" style="width: 20%"><%=hotelInfo.getNAME()%></th>
													<td style="width: 40%"><%=hotelInfo.getADDRESS()%></td>
													<td style="width: 20%"><%=hotelInfo.getTEL()%></td>
													<td style="width: 20%"><%=hotelInfo.getRATING()%></td>
												</tr>
											</tbody>
										</table>

										<table class="table" style="margin-bottom: 100px;">
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
												<label for="reservationDate">체크인</label> <input
													id="startDate" type="date" class="form-control"
													name="startDate">
											</div>
											<div class="inputDate">
												<label for="reservationDate">체크아웃</label> <input
													id="endDate" type="date" class="form-control"
													name="endDate">
											</div>
										</div>

										<!--인원선택-->
										<div class="gridItemPersonCnt" style="margin-bottom: 100px;">
											<label for="personCnt">인원</label> <select class="form-select"
												aria-label="Default select example" name="personCnt">
												<%
												for (int i = 1; i < 11; i++) {
												%>
												<option id="<%=i%>" value="<%=i%>"><%=i%></option>
												<%
												}
												%>
											</select>
										</div>


										<button type="button" class="btn btn-primary"
											data-bs-toggle="modal" data-bs-target="#exampleModal">예약하기</button>
										<div class="modal fade" id="exampleModal" tabindex="-1"
											aria-labelledby="exampleModalLabel" aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<h1 class="modal-title fs-5" id="exampleModalLabel">예약
															완료!</h1>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">자세한 내역은 my page에서 확인해주세요 :)</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-primary"
															onclick="location.href='./mypage.jsp'">My page</button>
														<button type="button" class="btn btn-secondary"
															data-bs-dismiss="modal">Close</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>
			<!--관광지 리스트
						 -->
			<div id="resultsTour" class="gridItemTourList">
				<h2 id="titleTour">추천 관광지</h2>
				<div class="row row-cols-1 row-cols-md-3 g-4">

					<%
					TourImgDao tourImgDao = new TourImgDao();
					List<TourImg> tourImgList = tourImgDao.selectTourImgListByAddress(hAddress);
					for (TourImg tImg : tourImgList) {
					%>
					<div class="col">
						<div class="card h-100">
							<img src="<%=tImg.getImg_url()%>" class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title"><%=tImg.getTour_name()%></h5>
								<p class="card-text"><%=tImg.getAddress()%></p>
							</div>
						</div>
					</div>
					<%
					}
					%>
				</div>
			</div>
		</div>
	</section>
	<script>
		let mapBox = document.getElementById('mapBox');
		let resultsLodging = document.getElementById('resultsLodging');
		let resultsTour = document.getElementById('resultsTour');
		<%if (searchHotelInfoList != null && searchHotelInfoList.size() > 0) {%>
	
		mapBox.style.display = 'block';
		resultsLodging.style.display = 'block';
		resultsTour.style.display = 'block';
		<%}%>
		
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