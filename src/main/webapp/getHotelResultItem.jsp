<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
</body>
</html>