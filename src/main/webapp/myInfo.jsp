<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%@ page import="dto.User"%>
<%@ page import="dao.UserDAO"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<title>JejuEottae_Myinfo</title>
<link rel="stylesheet" href="./mypage.css">
</head>

<body>
	<%
	String userID = (String) session.getAttribute("userID");

	User user = new User();
	UserDAO userDao = new UserDAO();	

	if (userID == null) {
		session.setAttribute("messageType", "오류 메세지");
		session.setAttribute("messageContent", "현재 로그인이 되어 있지 않습니다.");
		response.sendRedirect("index.jsp");
		return;
	}
	%>

	<header style="margin: 0px">
		<!-- NavBar -->
		<nav class="navbar navbar-expand-lg bg-light">
			<div class="container-fluid">
				<a class="navbar-brand" href="Main.jsp">제주어때🍊</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
					aria-controls="navbarNavAltMarkup" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
					<div class="navbar-nav">
						<a class="nav-link active" aria-current="page" href="./index.jsp">Home</a>
						<a class="nav-link" href="./mypage.jsp">My page</a>
					</div>
				</div>
			</div>
		</nav>

		<nav class="myNavBar">
			<div class="container-fluid">
				<span class="navbar-brand mb-0 h1">MYINFO</span>
			</div>
		</nav>

		<form class="info">
			<div class="col-auto">
				<label class="visually-hidden"></label><input
					type="text" readonly class="form-control-plaintext"
					id="staticEmail2" value="아이디: <%=userID%>">
			</div>
	

			<a type="button" class="btn btn-primary"  href="userUpdate.jsp">개인정보
				수정하기</a>	
		    <button >
				<a href="userDelete.jsp">회원 탈퇴하기</a></button>			
		
		</form>
		 
			







		<!-- JavaScript Bundle with Popper -->
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
			crossorigin="anonymous"></script>
</body>

</html>