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
			<div class="mapBox">
				<div class="mapBox">
					<%
					request.getParameter("id");
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
					<%@include file="showHotelList.jsp"%>
				</div>

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