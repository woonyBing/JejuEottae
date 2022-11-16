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
    <title>JejuEottae_reservedCheck</title>
    <link rel="stylesheet" href="./mypage.css">
</head>
<body>
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
          <span class="navbar-brand mb-0 h1">RESERVED</span>
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
          
      
      <!-- for문 필요 버튼 기능 필요-->
      <div class="accordion" id="accordionExample">
      
        <div class="accordion-item">
          <h2 class="accordion-header" id="headingOne">
            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
              <div> 호텔이름 </div>
            </button>
          </h2>
          <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
            <div class="accordion-body">
              <strong>예약일자</strong>
              <br/>
              <div class="review">
                <table class="table">
                  <thead>
                      <tr>
                          <th scope="col" style="width: 20%">예약호텔</th>
                          <th scope="col" style="width: 20%">숙박기간</th>
                          <th scope="col" style="width: 20%">예약자 성함</th>
                          <th scope="col" style="width: 20%">인원</th>
                          <th scope="col" style="width: 20%">결제수단</th>
                      </tr>
                  </thead>
                  <thead>
                    <tr>
                      <th scope="col" style="width: 20%">hotelname</th>
                      <th scope="col" style="width: 20%">checkIn,checkOut</th>
                      <th scope="col" style="width: 20%">userName</th>
                      <th scope="col" style="width: 20%">person</th>
                      <th scope="col" style="width: 20%">payment</th>
                    </tr>
                  </thead>
                </table>
              </div>
              
              <div class="booking_button">
                <button type="button" class="btn btn-danger">예약취소</button>
              </div>
              <div class="booking_button">
                <button type="button" class="btn btn-warning">예약문의</button>
              </div>
              <div class="booking_button" data-bs-toggle="modal" data-bs-target="#exampleModal">
                <button type="button" class="btn btn-primary">숙소평가</button>
                </div>
          </div>
          </div>
        
        </div>
       

        <!-- Modal -->
      <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="exampleModalLabel">숙소는 어떠셨나요?</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
          <div class="modal-body">
        <!-- 코멘트 -->
            <div class="form-floating2">
              <legend>후기를 남겨주세요</legend>

              <textarea class="form-control" placeholder="무분별한 비방, 폭력적인 욕설 사용은 통보없이 삭제될 수 있습니다." id="floatingTextarea"
              style="height: 100px;"></textarea>
              
            </div>

            <form name="myform" id="myform" method="post" action="./save">
              <fieldset>
                  <legend>별점</legend>
                  <input type="radio" name="rating" value="5" id="rate1"><label for="rate1">⭐</label>
                  <input type="radio" name="rating" value="4" id="rate2"><label for="rate2">⭐</label>
                  <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
                  <input type="radio" name="rating" value="2" id="rate4"><label for="rate4">⭐</label>
                  <input type="radio" name="rating" value="1" id="rate5"><label for="rate5">⭐</label>
              </fieldset>
              <div>솔직한 평가 부탁드립니다.</div>
          </form>

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary">평가하기</button>
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">다음에 평가하기</button>
        </div>
      </div>
      </div>
      </div>
         </div>
        </div>


    </div>
    
     <!-- footer 부분 -->
         <%@ include file="footer.jsp" %>

    <!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

</body>
</html>