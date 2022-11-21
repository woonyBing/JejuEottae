<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="dto.User" %>
<%@ page import="dao.UserDAO" %>
<%@ page import="java.util.*"%>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="./login.css">
    
</head>
<script>
	function check() {
		if (document.deletefr.userPassword.value == "") {
			alert("비밀번호를 입력하세요.")
			document.deletefr.userPassword.focus();
			return false;
		}
	}
</script>
<%
	String userID = (String) session.getAttribute("userID");
	String userPW = (String) session.getAttribute("userPW");
	
	User user = new User();
	UserDAO userDao = new UserDAO();
	%>

<body>
    <section>
        <div id="login-form-wrap" >
            <h2>회원 탈퇴</h2>
            <form id="login-form" action="userDeleteAction.jsp" name="deletefr" onsubmit="return check();">
                <p>
                    <input type="text" id="userID" name="userID" value="<%=userID%>" readonly="readonly"><i class="validation"><span></span><span></span></i>
                </p>
                <p>
                    <input type="password" id="userPassword" name="userPassword" placeholder="*비밀번호"><i class="validation"><span></span><span></span></i>
                </p>
                <p>
                    <input type="submit" value="탈퇴하기" >
                </p>
            </form>
            <div id="create-account-wrap">
                 <p><a href="myInfo.jsp">mypage 바로가기</a></p>
            </div>
        </div>
    </section>
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</body>
</html>