<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="dao.Booking"%>
<%@ page import="java.sql.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
</head>
<body>
<% 

	String userID = (String)session.getAttribute("userID");
	String checkinStr = request.getParameter("checkInDate");
	String checkoutStr = request.getParameter("checkOutDate");
	String personCntStr = request.getParameter("personCnt");
	if (checkinStr == null || checkinStr == "" || checkoutStr == null || checkinStr == "") {
%>
		<script>
// 			e.preventDefault();
			alert('날짜를 선택해주세요');
			location.href='./LoginMain.jsp';
		</script>
	<% } else {
		Booking booking = new Booking();
		int personCnt = Integer.parseInt(personCntStr);
		Date checkin = Date.valueOf(checkinStr);
		Date checkout = Date.valueOf(checkoutStr);
		booking.all_setter(2, "그랜드", 50000, checkin, checkout, personCnt, "honeybye@naver.com");
 		booking.add_booking();
 		out.println("111");
 	%>
 	
<div >
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true" >
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
 	<%
	}
	%>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous">
		
	</script>
</body>
</html>