<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="sample.dao.PersonDao"%>
<%@ page import="sample.dto.PersonInfo"%>
<%@ page import="java.util.*" %>
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
	<!--
		중복되는 코드는 jsp파일 따로 만들어서 넣는게 좋다!
		navBar.jsp 따로 만들어서 넣기
	-->
	<%@ include file="navBar.jsp" %>

	<%
		PersonDao personDao = new PersonDao();
		List<PersonInfo> personInfoList = personDao.selectPersonInfoList();
	%>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">ID</th>
				<th scope="col">NAME</th>
			</tr>
		</thead>
		<tbody>
		
			<!--
				JAVA 코드 안에 HTML 태그를 만드는 방법
			-->
			<%
// 				if(personInfoList != null && personInfoList.size() > 0) {
// 					for (PersonInfo info : personInfoList) {
// 						out.println("이름 : " + info.getName() + "<br/>");
// 						out.println("<tr>");
// 						out.println("<td>" + info.getId() + "</td>");
// 						out.println("<td>" + info.getName() + "</td>");
// 						out.println("</tr>");
// 					}
// 				}
			%>


			<!--
				HTML 소스 안에 JAVA 코드를 연결 시키는 방법
			-->
			<%
				if (personInfoList != null && personInfoList.size() > 0) {
					for (PersonInfo info : personInfoList) {
			%>
				<tr>
					<td><%=info.getId()%></td>
					<td><a href="personinfoDetail.jsp?id=<%=info.getId()%>"><%=info.getName()%></a></td>
				</tr>
			<%
					}
				}
			%>
			
		</tbody>
	</table>


	<!--
	Index.jsp 파일입니다.
	<br /> 화면작업
	<br /> 화면작업
	<br /> 화면작업
	<br /> 화면작업
	<br /> 화면작업
	<br /> 화면작업
	<div style="color: red">ㅇㅇ</div>
	-->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
</body>
</html>