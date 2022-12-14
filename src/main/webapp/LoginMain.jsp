<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.HotelDAO"%>
<%@ page import="dto.HotelInfo"%>
<%@ page import="dto.ImgPath"%>
<%@ page import="dao.Tour"%>
<%@ page import="dao.TourImgDao"%>
<%@ page import="dto.TourImg"%>
<%@ page import="dao.UserDAO"%>
<%@ page import="dao.Booking"%>
<%@ page import="dao.Dao_manager"%>
<%@ page import="java.sql.Date"%>
<%@ page import="java.util.*"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>μ μ£Όμ΄λπ</title>

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
	<!-- header λ° nav μμ­-->
	<header>
		<%@ include file="navBarLogined.jsp"%>

		<div class="mainImg">
			<p class="mainStr">JejuEottae</p>
		</div>
	</header>

	<!-- section μμ­ -->
	<section>

		<!-- κ²μ μμ­ -->
		<form name="searchForm" action="LoginMain.jsp">
			<div class="formgrid">
				<!--μ§μ­ μ ν μλ¦¬-->
				<div class="gridItemLocation">
					<label for="location">μ§μ­</label> <select class="form-select"
						aria-label="Default select example" name="location">
						<option value="μ μ£Όμ" selected>μ μ£Όμ</option>
						<option value="μκ·ν¬μ">μκ·ν¬μ</option>
					</select>
				</div>
				<!--μμμ ν-->
				<div class="gridItemCheckBerth">
					<label for="lodgingType">μμ μ ν</label> <select class="form-select"
						aria-label="Default select example" name="lodgingType">
						<option value="Hotel">νΈν</option>
						<option value="Resort">λ¦¬μ‘°νΈ</option>
					</select>
				</div>

				<!--κ²μλ²νΌ-->
				<button id="Search" type="submit"
					class="btn btn-primary gridItemBtn" name="search">κ²μ</button>
			</div>
		</form>



		<div class="container">

			<!--μ§λ API λ€μ΄κ° μλ¦¬-->
			<div id="mapBox" class="mapBox">
				<div class="mapBox">
					<%
					//actionμΌλ‘ μ£Όμ, μμνμ λ°μμ λ¦¬μ€νΈμ μ μ₯νλ λΆλΆ
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
					//submit λ°μ μ λ³΄λ€μ΄ μ λλ‘ Listμ μ μ₯ λμλμ§ νμΈνκ³  μ€ν
					if (searchHotelInfoList != null && searchHotelInfoList.size() > 0) {
						//Listμ μ μ₯λ νΈν μ λ³΄ κΊΌλ΄κΈ°
						for (HotelInfo hotelInfo : searchHotelInfoList) {
					%>


					<script>
					//λ°°μ΄λ‘ κ·Έλ €μ§λ? μ§λ μμ­
					locations = [...locations, ['<div><h3>'+'<%=hotelInfo.getNAME()%>'+'</h3><p><%=hotelInfo.getRATING()%> μ±</p><p>μ£Όμ: <%=hotelInfo.getADDRESS()%></p><p>μ νλ²νΈ: <%=hotelInfo.getTEL()%></p><p><button id= "mapBtn" class="btn btn-secondary" type="button" onClick="showLodging(<%=hotelInfo.getID()%>)">μμΈν μμλ³΄κΈ°</button></p></div>', <%=hotelInfo.getX()%>, <%=hotelInfo.getY()%>]];
					
					//μ§λμμ 'μμΈν λ³΄κΈ°' λλ μ λ μ€νλλ ν¨μ
					//hotelInfoκ°μ²΄μ idκ°μ λ§€κ°λ³μλ‘ λ°μ
					//κ·Έμ ν΄λΉνλ μμ κ²°κ³Όλ‘ μ€ν¬λ‘€μ΄ μ΄λν¨
					function showLodging(hotelInfoId){
						var access = document.getElementById(hotelInfoId);
						console.log(access);
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
					<h2 id="titleHotel">μμ κ²μ κ²°κ³Ό</h2>
					<%
					int idx = 0;
					for (HotelInfo hotelInfo : searchHotelInfoList) {
						List<ImgPath> imgPathList = hotelDao.selectHotelInfoListByHotelId(hotelInfo.getID());
						Dao_manager reviewDao = new Dao_manager();
						List<String> commentsList = reviewDao.comments_by_hotelname(hotelInfo.getNAME());
						if (commentsList.size() > 0) {
							String comment = commentsList.get(idx);
							idx++;
							int avgCnt = reviewDao.score_avg_by_hotelname(hotelInfo.getNAME());
					%>

					<!--νΈνλ¦¬μ€νΈ
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
															class="d-block w-100" alt="νΈνμΈκ΄μ΄λ―Έμ§">
													</div>
													<div class="carousel-item">
														<img
															src="https://cdn.loewshotels.com/loewshotels.com-2466770763/cms/cache/v2/5f5a6e0d12749.jpg/1920x1080/fit/80/86e685af18659ee9ecca35c465603812.jpg"
															class="d-block w-100" alt="λ£Έμ΄λ―Έμ§1">
													</div>
													<div class="carousel-item">
														<img
															src="https://www.gannett-cdn.com/-mm-/05b227ad5b8ad4e9dcb53af4f31d7fbdb7fa901b/c=0-64-2119-1259/local/-/media/USATODAY/USATODAY/2014/08/13/1407953244000-177513283.jpg"
															class="d-block w-100" alt="λ£Έμ΄λ―Έμ§2">
													</div>
													<div class="carousel-item">
														<img
															src="https://media.cntraveler.com/photos/624a1faa56ae3ba9ee4281e3/master/w_1920%2Cc_limit/Soho%2520House%2520Rome_Copyright%2520Soho%2520House%2520Rome%2520003.jpg"
															class="d-block w-100" alt="λ£Έμ΄λ―Έμ§3">
													</div>
												</div>
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
														<!--μ¬κΈ° λ€μ΄κ° λ΄μ©μ dbμμ κ°μ Έμ λ£κΈ°-->
														<th scope="row" style="width: 20%"><%=hotelInfo.getNAME()%></th>
														<td style="width: 40%"><%=hotelInfo.getADDRESS()%></td>
														<td style="width: 20%"><%=hotelInfo.getTEL()%></td>
														<td style="width: 20%"><%=hotelInfo.getRATING()%></td>
													</tr>
												</tbody>
											</table>

											<table id="reviewTable" class="table"
												style="margin-bottom: 100px;">
												<thead>
													<tr>
														<th scope="col" colspan="4">REVIEW</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<!--μ¬κΈ° λ€μ΄κ° λ΄μ©μ dbμμ κ°μ Έμ λ£κΈ°-->
														<td scope="row" style="width: 20%">
														<%for(int z=1; z<=avgCnt; z++) {
															out.print("β­");
														}%>
														</td>
<%-- 														<td scope="row" style="width: 20%"><%=reviewDao.score_avg_by_hotelname(hotelInfo.getNAME()) + "/5"%></td> --%>
														<td style="width: 70%"><%=comment%></td>
													</tr>
												</tbody>
											</table>



											<%
											String qryStr = "location=" + hAddress + "&lodgingType=" + hType;
											%>
											<!--λ μ§μ ν-->
											<form id="bookingDateForm" action="bookingAction.jsp"
												method="post" class="revForms">
												<div class="inputGrid">
													<div class="inputDate">
														<label for="checkInDate">μ²΄ν¬μΈ</label> <input type="hidden"
															name="hotelId" value=<%=hotelInfo.getID()%>>
														<%-- 													<input type="hidden" name="qryStr" value=<%=qryStr%>> --%>
														<input type="hidden" name="qryStrN"
															value=<%=request.getQueryString()%>> <input
															id="checkInDate" type="date"
															class="form-control checkInDates" name="checkInDate"
															required>
													</div>
													<div class="inputDate">
														<label for="checkOutDate">μ²΄ν¬μμ</label> <input
															id="checkOutDate" type="date"
															class="form-control checkOutDates" name="checkOutDate"
															required>
													</div>
												</div>

												<!--μΈμμ ν-->
												<div class="gridItemPersonCnt" style="margin-bottom: 100px;">
													<label for="personCnt">μΈμ</label> <select
														class="form-select" aria-label="Default select example"
														name="personCnt" required>
														<%
														for (int i = 1; i < 11; i++) {
														%>
														<option id=<%="personCnt"+i%> value="<%=i%>"><%=i%></option>
														<%
														}
														%>
													</select>
												</div>

												<button type="submit" class="btn btn-primary"
													name="reserveBtn" data-bs-toggle="" data-bs-target="">μμ½νκΈ°</button>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<%
					} else {
					%>

					<!--νΈνλ¦¬μ€νΈ
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
															class="d-block w-100" alt="νΈνμΈκ΄μ΄λ―Έμ§">
													</div>
													<div class="carousel-item">
														<img
															src="https://cdn.loewshotels.com/loewshotels.com-2466770763/cms/cache/v2/5f5a6e0d12749.jpg/1920x1080/fit/80/86e685af18659ee9ecca35c465603812.jpg"
															class="d-block w-100" alt="λ£Έμ΄λ―Έμ§1">
													</div>
													<div class="carousel-item">
														<img
															src="https://www.gannett-cdn.com/-mm-/05b227ad5b8ad4e9dcb53af4f31d7fbdb7fa901b/c=0-64-2119-1259/local/-/media/USATODAY/USATODAY/2014/08/13/1407953244000-177513283.jpg"
															class="d-block w-100" alt="λ£Έμ΄λ―Έμ§2">
													</div>
													<div class="carousel-item">
														<img
															src="https://media.cntraveler.com/photos/624a1faa56ae3ba9ee4281e3/master/w_1920%2Cc_limit/Soho%2520House%2520Rome_Copyright%2520Soho%2520House%2520Rome%2520003.jpg"
															class="d-block w-100" alt="λ£Έμ΄λ―Έμ§3">
													</div>
												</div>
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
														<!--μ¬κΈ° λ€μ΄κ° λ΄μ©μ dbμμ κ°μ Έμ λ£κΈ°-->
														<th scope="row" style="width: 20%"><%=hotelInfo.getNAME()%></th>
														<td style="width: 40%"><%=hotelInfo.getADDRESS()%></td>
														<td style="width: 20%"><%=hotelInfo.getTEL()%></td>
														<td style="width: 20%"><%=hotelInfo.getRATING()%></td>
													</tr>
												</tbody>
											</table>

											<%
											String qryStr = "location=" + hAddress + "&lodgingType=" + hType;
											%>
											<!--λ μ§μ ν-->
											<form id="bookingDateForm" action="bookingAction.jsp"
												method="post" class="revForms">
												<div class="inputGrid">
													<div class="inputDate">
														<label for="checkInDate">μ²΄ν¬μΈ</label> <input type="hidden"
															name="hotelId" value=<%=hotelInfo.getID()%>>
														<%-- 													<input type="hidden" name="qryStr" value=<%=qryStr%>> --%>
														<input type="hidden" name="qryStrN"
															value=<%=request.getQueryString()%>> <input
															id="checkInDate" type="date"
															class="form-control checkInDates" name="checkInDate"
															required>
													</div>
													<div class="inputDate">
														<label for="checkOutDate">μ²΄ν¬μμ</label> <input
															id="checkOutDate" type="date"
															class="form-control checkOutDates" name="checkOutDate"
															required>
													</div>
												</div>

												<!--μΈμμ ν-->
												<div class="gridItemPersonCnt" style="margin-bottom: 100px;">
													<label for="personCnt">μΈμ</label> <select
														class="form-select" aria-label="Default select example"
														name="personCnt" required>
														<%
														for (int i = 1; i < 11; i++) {
														%>
														<option id=<%="personCnt"+i%> value="<%=i%>"><%=i%></option>
														<%
														}
														%>
													</select>
												</div>

												<button type="submit" class="btn btn-primary"
													name="reserveBtn" data-bs-toggle="" data-bs-target="">μμ½νκΈ°</button>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<%
					}
					}
					%>
				</div>
				<!--κ΄κ΄μ§ λ¦¬μ€νΈ
						 -->
				<div id="resultsTour" class="gridItemTourList">
					<h2 id="titleTour">μΆμ² κ΄κ΄μ§</h2>
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
		</div>
	</section>

	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">μμ½ μλ£!</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">μμΈν λ΄μ­μ μμ½ λ΄μ­ νμ΄μ§μμ νμΈν΄μ£ΌμΈμ :)</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						onclick="location.href='./reservedCheck.jsp'">μμ½λ΄μ­ νμΈνλ¬
						κ°κΈ°</button>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

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
			const myLatLng = { //κΈ°λ³Έ μ’ν κ°: νλΌμ°
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

	<script>
		let reserveBtns = document.querySelectorAll('[name="reserveBtn"]');
		let checkInDates = document.querySelectorAll('.checkInDates');
		let checkOutDates = document.querySelectorAll('.checkOutDates');
		let revForms = document.querySelectorAll('.revForms');
		console.log(reserveBtns);

		for(let revBtnIdx=0; revBtnIdx < reserveBtns.length; revBtnIdx++){
			reserveBtns[revBtnIdx].addEventListener('click', (e)=>{
				console.log('μμ½λ²νΌ click');
				e.preventDefault();
				let checkInDate = checkInDates[revBtnIdx].value;
				let checkOutDate = checkOutDates[revBtnIdx].value;
				console.log(checkInDate);
				console.log(checkOutDate);
				if(checkInDate != null && checkInDate != '' && checkOutDate != null && checkOutDate != ''){
					console.log('data-bs-target click');
					reserveBtns[revBtnIdx].setAttribute('data-bs-target', '#exampleModal');
					reserveBtns[revBtnIdx].setAttribute('data-bs-toggle', 'modal');
					console.log('data-bs-target end');
					revForms[revBtnIdx].submit();
				} else {
					alert('μ²΄ν¬μΈ, μ²΄ν¬μμ λ μ§λ₯Ό νμΈνμΈμ.');	
				}
			});
		}
		
		//μΏ ν€μ­μ 
		function deleteCookie(name) {
			document.cookie = name + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
		}
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous">
		
	</script>


	<%
	Cookie cookie = null;
	Cookie[] cookies = null;

	// Get an array of Cookies associated with the this domain
	cookies = request.getCookies();

	if (cookies != null) {
		// 	       out.println("<h2> Found Cookies Name and Value</h2>");

		for (int i = 0; i < cookies.length; i++) {
			cookie = cookies[i];
			if (cookie.getName().equals("revModal") && cookie.getValue().equals("Y")) {
	%>
	<script>
// 					document.getElementById('showModalBtn').click();
					var myModal = new bootstrap.Modal(document.getElementById('exampleModal'), {
						  keyboard: false
						})
					myModal.show();
					deleteCookie('revModal');
				</script>
	<%	        	  
	          }
	       }
	    } 
	%>

</body>

</html>