<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="dto.HotelInfo"%>
<%@ page import="dto.Rooms"%>
<%@ page import="dao.Booking"%>
<%@ page import="dao.HotelDAO"%>
<%@ page import="dao.RoomsDao"%>
<%@ page import="java.sql.Date"%>
<%@ page import="java.util.*"%>
<%
request.setCharacterEncoding("UTF-8");
%>
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
	String hotelId = request.getParameter("hotelId");
	String qryStrN = request.getParameter("qryStrN");
	
	//호텔 이름 가져오기
	int numHotelId = Integer.parseInt(hotelId);
	HotelDAO hotelDao = new HotelDAO();
	RoomsDao roomsDao = new RoomsDao();
	
	List<HotelInfo> hotelList = hotelDao.selectHotelInfoListById(numHotelId);
	List<Rooms> roomList = roomsDao.selectRoomsByRoNumPay(numHotelId);
	
	if (checkinStr == null || checkinStr == "" || checkoutStr == null || checkinStr == "") {
	%>	
		<script>
			alert('날짜를 선택해주세요');
			location.href="./LoginMain.jsp?<%=qryStrN%>";dkdk
		</script>
	<% } else {
		Booking booking = new Booking();
		int personCnt = Integer.parseInt(personCntStr);
		Date checkin = Date.valueOf(checkinStr);
		Date checkout = Date.valueOf(checkoutStr);
		
		booking.all_setter(roomList.get(0).getRo_num(), hotelList.get(0).getNAME(), roomList.get(0).getRo_price(), checkin, checkout, personCnt, userID);
 		booking.add_booking();
 		
 		Cookie revCk = new Cookie("revModal","Y");
 		response.addCookie(revCk);
 	%>
 	<script>
 		location.href="./LoginMain.jsp?<%=qryStrN%>";
	</script>
	<%
	}
	%>
<script>
document.getElementById("rsv_btn").style.display="none";
document.getElementById("rsv_btn").click();
</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous">
		
	</script>
</body>
</html>