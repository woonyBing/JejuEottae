<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="dto.User" %>
<%@ page import="dao.UserDAO" %>
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
<%
	String userID = (String) session.getAttribute("userID");
	String userPW = (String) session.getAttribute("userPW");
	
	User user = new User();
	UserDAO userDao = new UserDAO();
	%>
	
	<script>
	function check() {
		if (document.updatefr.userPassword.value == "" || document.updatefr.userEmail.value == "" || document.updatefr.userTel.value == "") {
			alert("입력 안 된 사항이 있습니다.")
			document.updatefr.userPassword.focus();
			return false;
		}
	}
</script>

<body>
    <section>
        <div id="login-form-wrap" >
            <h2>회원정보 수정</h2>
            <form id="login-form" action="userUpdateAction.jsp" name="updatefr" onsubmit="return check();">
                <p>
                    <input type="text" id="userID" name="userID" value="<%=userID%>" readonly="readonly"><i class="validation"><span></span><span></span></i>
                </p>
                <p>
                    <input type="password" id="userPassword" name="userPassword" placeholder="*비밀번호 재설정"><i class="validation"><span></span><span></span></i>
                </p>
                <p>
                    <input type="text" id="userEmail" name="userEmail" placeholder="*이메일 재설정" ><i class="validation"><span></span><span></span></i>
                </p>
                <p>
                    <input type="text" id="userTel" name="userTel" placeholder="*전화번호 재설정" ><i class="validation"><span></span><span></span></i>
                </p>
                <p>
                    <input type="submit" id="login" value="회원정보수정" >
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