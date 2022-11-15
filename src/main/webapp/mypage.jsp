<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <title>JejuEottae_Mypage</title>
    <link rel="stylesheet" href="./mypage.css">
</head>
<body>
     <!-- header 및 nav 영역-->
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
          <span class="navbar-brand mb-0 h1">MYPAGE</span>
        </div>
      </nav>

          <!-- 카드 부분 -->
        <div class="row row-cols-1 row-cols-md-3" >
            <div class="col">
              <a href="./reservedCheck.jsp">
              <div class="card" >
                <!-- 링크작업 필요 -->
                
                <img src="https://cdn.pixabay.com/photo/2015/08/25/03/27/resort-906102_960_720.jpg"
                 class="card-img-top" width="200px" height="300px"
                  >
                <div class="card-body">
                </a>
                  <h5 class="card-title">예약 내역</h5>
                </div>
              </div>
            </div>
            <div class="col">
              <a href="./myInfo.jsp">
                <div class="card">    
                <img src="https://cdn.pixabay.com/photo/2018/11/13/21/43/avatar-3814049_960_720.png" 
                class="card-img-top" width="200px" height="300px" >
                <div class="card-body">
                </a>
                  <h5 class="card-title">내정보</h5>
                  </div>
              </div>
            </div>
            <div class="col">
              <a href="./reviewManage.jsp">
              <div class="card">
                <img src="https://cdn.pixabay.com/photo/2022/01/11/21/48/talk-6931551_960_720.png"
                class="card-img-top"  width="200px" height="300px">
                <div class="card-body">
                </a>
                  <h5 class="card-title">내 리뷰 관리</h5>
                </div>
              </div>
            </div>
            
          </div>

          <!-- footer 부분 -->
          <div class="footer">
            <h5>footer 부분입니당</h5>
          </div>
</body>
</html>