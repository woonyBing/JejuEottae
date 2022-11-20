<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
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
<body>
    <section>
        <div id="login-form-wrap" >
            <h2>Login</h2>
            <form id="login-form" action="userLoginAction.jsp">
                <p>
                    <input type="text" id="userID" name="userID" placeholder="id" required><i class="validation"><span></span><span></span></i>
                </p>
                <p>
                    <input type="password" id="userPassword" name="userPassword" placeholder="Password" required><i class="validation"><span></span><span></span></i>
                </p>
                <p>
                    <input type="submit" id="login" value="Login" >
                </p>
            </form>
            <div id="create-account-wrap">
                <p>회원이 아니신가요? <a href="userJoin.jsp">회원가입하러 가기</a></p>
                 <p><a href="index.jsp">메인화면 가기</a></p>
            </div>
        </div>
    </section>
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</body>
</html>