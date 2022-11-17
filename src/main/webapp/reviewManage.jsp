<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@page import="dao.Dao_manager"%>
 <%@ page import="dao.Review" %>
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
		Dao_manager Dao = new Dao_manager();
		List<Review> reviewList = Dao.selectReviewList();
		
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
					int i=0;
					for (Review rv : reviewList) {
						i++;
						
	%>
	<tbody>
          <tr>
              <td><%=rv.getRevNum()%></td>
              <td ><%=rv.getRevDate() %></td>
              <td><%=rv.getBoNum() %></td>
              <td><%=rv.getContent() %></td>
              <td> <%=rv.getScore()%></td>
              
              <td>
             
             <!-- 값이 안넘어감!, 삭제버튼이 첫번째것만 작동됨 -->
<!--              <form name="reviewDeleteButton" id='reviewDeleteForm'> -->
               <div class="review_button">
<!--                 <button id="deleteBtn" type="submit" class="btn btn-danger" -->
<%--                  name="rev_num" value=<%=rv.getRevNum()%>>삭제</button> --%>
                 <button name="deleteBtn" class="btn btn-danger"
                 	onclick="actionDeleteReview(<%=rv.getRevNum()%>)">삭제</button>
<%--                   	value=<%=rv.getRevNum()%>>삭제</button> --%>
  				</div>
              <div class="review_button">
                <button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#reviewModal">수정</button>
              </div>
              
<!--               </form> -->
          <%
					}
				}
			%>
	<script>
		function actionDeleteReview(rev_num){
			if(confirm('정말로 삭제하시겠습니까?')){
				location.href = 'deleteReview.jsp?rev_num='+rev_num;
			}
		}
// 		document.getElementById('deleteBtn').addEventListener('click', (e)=>{
// 			e.preventDefault();
// 			let form = document.getElementById('reviewDeleteForm'); 
// 				//document.reviewDeleteButton;
// 			alert(document.getElementById('deleteBtn').value);
// 			if(confirm('정말로 삭제하시겠습니까?')){
// 				form.action = "deleteReview.jsp";
// 				form.submit();
// 			}
// 		});
	</script>
              
              
              
               <!-- Modal -->
     <div class="modal fade" id="reviewModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="exampleModalLabel">숙소는 어떠셨나요?</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
          <div class="modal-body">
        <!-- 코멘트 -->
           

            <form name="myform" id="myform" method="post" >
              <legend>후기를 남겨주세요</legend>
              <textarea class="form-control" placeholder="무분별한 비방, 폭력적인 욕설 사용은 통보없이 삭제될 수 있습니다." 
              id="floatingTextarea" name="comment"
              style="height: 100px;"></textarea>
              <fieldset>
               
                  <legend>별점</legend>
                  <input type="radio" name="rating" value="5" id="rate1"><label for="rate1">⭐</label>
                  <input type="radio" name="rating" value="4" id="rate2"><label for="rate2">⭐</label>
                  <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
                  <input type="radio" name="rating" value="2" id="rate4"><label for="rate4">⭐</label>
                  <input type="radio" name="rating" value="1" id="rate5"><label for="rate5">⭐</label>
                  <input type="hidden" name="userEmail" value="ab@naver.com">

              </fieldset>
              <div>솔직한 평가 부탁드립니다.</div>
          </form>

        </div>
        <div class="modal-footer">
          <button type="button" id="updateBtn" class="btn btn-primary" >평가하기</button>
          <button type="button"  class="btn btn-secondary" data-bs-dismiss="modal">다음에 평가하기</button>
        </div>
      </div>
      </div>
      </div>
              </td>
             </tr>  
              </tbody> 

        </table>
        
	<script>
		document.getElementById('updateBtn').addEventListener('click', (e)=>{
			e.preventDefault();
			let form = document.myform;
			if(form.comment.value == ""){ //이름이 없는 경우
				alert('내용은 필수입니다.');
				form.comment.focus();
				return false;
			}
			else { //이름이 있는 경우
				if(confirm('수정하시겠습니까?')){
					form.action = "updateReview.jsp";
					form.submit();
				}
			}
		});
	</script>
	
	
         <!-- footer 부분 -->
         <%@ include file="footer.jsp" %>
        
      <!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" 
crossorigin="anonymous"></script>
    </body>
</html>
              
              