<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.Tour"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<<<<<<< HEAD
=======

<head>
<meta charset="UTF-8">
<title>JejuEottae</title>
>>>>>>> dd596f8051ab9a69b1dc12d34dc3cae6e61e8403

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="./index.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
</head>

<body>
<<<<<<< HEAD
<<<<<<< HEAD
    <!-- header 및 nav 영역-->
    <header>
        <%@ include file="navBar.jsp" %>
        <div class="mainImg">
            <p class="mainStr">JejuEottae</p>
        </div>
    </header>

    <!-- section 영역 -->
    <section>
        <form name="reservationForm">
            <div class="formgrid">
                <!--지역 선택 자리-->
                <div class="gridItemLocation">
                    <label for="location">지역</label>
                    <select class="form-select" aria-label="Default select example">
                        <option value="1" selected>제주시</option>
                        <option value="2">서귀포시</option>
                    </select>
                </div>
                <!--숙소선택-->
                <div class="gridItemCheckBerth">
                    <label for="berthType">숙소 유형</label>
                    <select class="form-select" aria-label="Default select example">
                        <option value="1">호텔</option>
                        <option value="2">리조트</option>
                    </select>
                </div>
                <!--날짜선택-->
                <div class="gridItemDate">
                    <label for="reservationDate">체크인</label>
                    <input id="startDate" type="date" class="form-control">
                </div>
                <div class="gridItemDate">
                    <label for="reservationDate">체크아웃</label>
                    <input id="endDate" type="date" class="form-control">
                </div>
                <!--인원선택-->
                <div class="gridItemPersonCnt">
                    <label for="personCnt">인원</label>
                    <select class="form-select" aria-label="Default select example">
                        <!--여기서 반복문 시작-->
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <!--여기까지-->
                    </select>
                </div>

                <!--검색버튼-->
                <button type="button" class="btn btn-primary gridItemBtn">검색</button>
            </div>
        </form>
=======
=======
<%--
tour_list 테이블 만들고 insert 하는 dao
 	<% Tour tour = new Tour();
	 	tour.create_data_table();
	 	tour.all_data_to_table();
	%>
--%>
>>>>>>> 87a7bb50ce3c3e01b4774a8cc2e7d48e81eaa671
	<!-- header 및 nav 영역-->
	<header>
		<%@ include file="navBar.jsp"%>

		<div class="mainImg">
			<p class="mainStr">JejuEottae</p>
		</div>
	</header>

	<!-- section 영역 -->
	<section>
		<!-- 검색 영역 -->
		<%@ include file="formSearch.jsp"%>
>>>>>>> dd596f8051ab9a69b1dc12d34dc3cae6e61e8403

		<div class="container">

			<!--지도 API 들어갈 자리-->
			<div class="mapBox">지도 API 들어갈 자리</div>


			<!--호텔리스트-->
			<%@include file="showHotelList.jsp"%>

			<!--관광지 리스트-->
			<%@include file="showTourList.jsp"%>

<<<<<<< HEAD
                    -->
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingOne">
                            <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                호텔 #1
                            </button>
                        </h2>
                        <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne"
                            data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                                    <div class="carousel-inner">
                                        <div class="carousel-item active">
                                            <img src="https://images.unsplash.com/photo-1595737335975-2160c924caf2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80"
                                                class="d-block w-100" alt="...">
                                        </div>
                                        <div class="carousel-item">
                                            <img src="https://images.unsplash.com/photo-1596941248238-0d49dcaa4263?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80"
                                                class="d-block w-100" alt="...">
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


                                <table class="table">
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
                                <button type="button" class="btn btn-primary">예약하기</button>
                            </div>
                        </div>
                    </div>
                    <!--
                        여기까지 반복문 돌릴 위치

                        
                    -->
                </div>
            </div>
        </div>

        <!--관광지 리스트-->
        <div class="gridItemTourList">
            <h2 style="margin-bottom: 30px; text-align: center;">추천 관광지</h2>
            <div class="row row-cols-1 row-cols-md-3 g-4">

                <!--
                        여기서부터


                    -->
                <div class="col">
                    <div class="card h-100">
                        <img src="..." class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">관광지명</h5>
                            <p class="card-text">주소</p>
                        </div>
                    </div>
                </div>
                <!--
                        여기까지 반복문 돌릴 위치


                    -->
                <div class="col">
                    <div class="card h-100">
                        <img src="..." class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">반복문 돌리면 지워질 애들</h5>
                            <p class="card-text">주소</p>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card h-100">
                        <img src="..." class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">반복문 돌리면 지워질 애들</h5>
                            <p class="card-text">주소</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous">
    </script>
=======
		</div>
	</section>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous">
			</script>
>>>>>>> dd596f8051ab9a69b1dc12d34dc3cae6e61e8403
</body>

</html>