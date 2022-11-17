<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@page import="dao.Dao_manager"%>
 <%@ page import="dto.Review" %>
 <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <title>JejuEottae_reviewManage</title>
    <link rel="stylesheet" href="./mypage.css">
</head>

<body>
<%
		Dao_manager rvDao = new Dao_manager();
		List<Review> reviewList = rvDao.selectReviewList();
		%>
		
              

	<header style="margin:0px">
        <!-- NavBar -->
        <nav class="navbar navbar-expand-lg bg-light">
          <div class="container-fluid">
              <a class="navbar-brand" href="/JejuEottae/index.jsp">제주어때🍊</a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
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
          <span class="navbar-brand mb-0 h1">REVIEW</span>
        </div>
      </nav>

      <div class="choice"> 
        <div class="container text-center">
          <div class="row">
            <div class="col">
              
               <select class="form-select" aria-label="Default select example">
                  <option selected>카테고리</option>
                  <option value="1">호텔</option>
                  <option value="2">리조트</option>
               </select>
            </div>
            <div class="col">
               <select class="form-select" aria-label="Default select example">
                  <option selected>전체</option>
                  <option value="1">최근 3개월</option>
                  <option value="2">최근 6개월</option>
                  <option value="3">최근 9개월</option>
               </select>
      
              </div>
            </div>
        </div>
            
      </div> 
		
        <!-- for문 필요 혹시 없으면 안뜨게도 가능한지... -->
		
        <table class="reviewTable">
          <thead>
            <tr>
              <th scope="col" style="width: 10%">#</th>
              <th scope="col" style="width: 20%">리뷰 작성일</th>
              <th scope="col" style="width: 10%">예약 번호</th>
              <th scope="col" style="width: 30%">리뷰 내용</th>
              <th scope="col" style="width: 10%">평점</th>
            </tr>
          </thead>

    
			
            
<%
				if (reviewList != null && reviewList.size()>0) {					
					for (Review rv : reviewList) {
	%>
	<tbody>
          <tr>
              <td><%=rv.getRevNum()%></td>
              <td ><%=rv.getRevDate() %></td>
              <td><%=rv.getBoNum() %></td>
              <td><%=rv.getContent() %></td>
              <td> <%=rv.getScore()%></td>
              
              <td>
              <div class="review_button">
                <button type="button" class="btn btn-danger">삭제</button>
              </div>
              <div class="review_button">
                <button type="button" class="btn btn-warning">수정</button>
              </div>
              </td>
             </tr>  
              </tbody> 
              
          <%
					}
				}
			%>
          
           
          
        </table>
        
        
        
      <!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    </body>
</html>
              
              