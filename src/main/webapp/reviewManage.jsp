<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@page import="dao.Dao_manager"%>
 <%@ page import="dao.Review" %>
 <%@ page import="java.util.*" %>
        <%@ page import="java.sql.DriverManager" %>
          <%@ page import="java.sql.Connection" %>
   
    <%@ page import="java.sql.ResultSet" %>
        <%@ page import="java.sql.SQLException" %>
                <%@ page import="java.sql.PreparedStatement" %>
        
    
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

<<<<<<< HEAD
		String cpi = request.getParameter("CPI");
		String[] cpi_divide = null;

		if(cpi != null)
		{
		     cpi_divide = cpi.split("/");
		}
		String id = "test"; 
		if(request.getParameter("id")!=null)
		{

			  id = request.getParameter("id");
		}
		else if(cpi!=null)
		{

      		 id =cpi_divide[2];

		}

		Dao_manager rvDao = new Dao_manager();
		List<Review> reviewList = rvDao.selectReviewList();
		%>
		
	<header style="margin:0px">
=======
String cpi = request.getParameter("CPI");
String[] cpi_divide = null;

if(cpi != null)
{
     cpi_divide = cpi.split("/");
}
String id = "test"; 
if(request.getParameter("id")!=null)
{

	  id = request.getParameter("id");
}
else if(cpi!=null)
{

       id =cpi_divide[2];

}

Dao_manager dm  = new Dao_manager();
ResultSet rs=null;
if(cpi!=null)
{
	   rs = dm.selectReviewList_F(cpi_divide[0],cpi_divide[1],id);
}
else
{
    rs = dm.selectReviewList(id);// 

}
	
		%>
		
              

>>>>>>> ce01169da4b3b20dec374aad45335b12e60e802f
        <!-- NavBar -->
        <nav class="navbar navbar-expand-lg bg-light">
          <div class="container-fluid">
              <a class="navbar-brand" href="/JejuEottae/index.jsp">제주어때🍊</a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
              <div class="navbar-nav">
                  <a class="nav-link active" aria-current="page" href="./Main.jsp?id=<%=id%>">Home</a>
                  <a class="nav-link" href="./mypage.jsp?id=<%=id%>">My page</a>
              </div>
              </div>
          </div>
      </nav>

      <nav class="myNavBar">
        <div class="container-fluid">
          <span class="navbar-brand mb-0 h1">REVIEW</span>
        </div>
      </nav>
<!-- 
      <div class="choice"> 
        <div class="container text-center">
              <form name="serch_review_form">
        <div class="row">
          <div class="col">
             <select class="form-select" aria-label="Default select example" name="category" >
                <option selected value="0">카테고리</option>
                <option value="1">호텔</option>
                <option value="2">리조트</option>
             </select>
          </div>
          <div class="col">
             <select class="form-select" aria-label="Default select example" name = "period">
                <option selected value="0">전체</option>
                <option value="3">최근 3개월</option>
                <option value="6">최근 6개월</option>
                <option value="9">최근 9개월</option>
             </select>
    
            </div>
            <div class="col">
                              <input type="hidden" name="id" value=<%=id%>>
            
<<<<<<< HEAD
      </div>  -->
=======
            			<button type="button" class="btn btn-success" id="serch_review">검색</button>
            
           
             </div>
             
            
          </div>
                  
          
 		   </form>
 		     </div>
 		     </div> 
          
                    
>>>>>>> ce01169da4b3b20dec374aad45335b12e60e802f
		
        <!-- for문 필요 혹시 없으면 안뜨게도 가능한지... -->
		<div class="reviewTable">
        <table class="table">
          <thead>
            <tr>
              <th scope="col" style="width: 10%">#</th>
              <th scope="col" style="width: 25%">리뷰 작성일</th>
              <th scope="col" style="width: 10%">예약 번호</th>
              <th scope="col" style="width: 20%">리뷰 내용</th>
              <th scope="col" style="width: 10%">평점</th>
              <th scope="col" style="width: 20%"></th>
            </tr>
          </thead>

    <%
    if(rs!=null)
    {
        int count =0;

    	while(rs.next())		
		{
    		if(count !=0)
    		{
    			out.println("<table  class=\"reviewTable\">");
    		}
    		count++;
			out.println("<tbody>"
		    +"<tr>"
		    +"<td style=\"width: 10%\">"+rs.getInt("Rev_Num")+"</td>"
		    +"<td style=\"width: 25%\">"+rs.getString("Rev_Date")+"</td>"
		    +"<td style=\"width: 10%\">"+rs.getInt("Bo_Num")+"</td>"
		    +"<td style=\"width: 20%\">"+rs.getString("Content")+"</td>"
		    +"<td style=\"width: 10%\">"+rs.getInt("Score")+"</td>"
		    +"<td style=\"width: 20%\">"
		    +"<div class=\"review_button\">"
		    +"<button type=\"button\" class=\"btn btn-danger\" id=\"delete_btn"+count+"\">삭제</button>"
		    +"</div>"
		    +"<div class=\"review_button\" data-bs-toggle=\"modal\" data-bs-target=\"#Modal"+count+"\">"
		    +"<button type=\"button\" class=\"btn btn-warning\">수정</button>"
		    +"</div>"
		    +"</td>"
		    +"</tr>"
		    +"</tbody></table>"
		 
					);
	    
			
<<<<<<< HEAD
            
<%
				if (reviewList != null && reviewList.size()>0) {					
					int i=0;
					for (Review rv : reviewList) {
						i++;
						
	%>
	<tbody>
          <tr>
              <td><%=rv.getRevNum()%></td>
              <td><%=rv.getRevDate() %></td>
              <td><%=rv.getBoNum() %></td>
              <td><%=rv.getContent() %></td>
              <td> <%=rv.getScore()%></td> 
              <td>
             
               <div class="review_button">
                 <button name="deleteBtn" class="btn btn-danger"
                 	onclick="actionDeleteReview(<%=rv.getRevNum()%>)">삭제</button>
  				</div>
              <div class="review_button">
                <button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#reviewModal">수정</button>
              </div>
          <%
					}
				}
			%>
              
              
              
              <!--1번만 수정되는 오류 수정 필요  -->
               <!-- Modal -->
     <div class="modal fade" id="reviewModal" tabindex="-1"
      aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="exampleModalLabel">숙소는 어떠셨나요?</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" 
              aria-label="Close"></button>
            </div>
          <div class="modal-body">
        <!-- 코멘트 -->
           

            <form name="myform" id="myform" method="post" >
              <legend>후기를 남겨주세요</legend>
              <textarea class="form-control" 
              placeholder="무분별한 비방, 폭력적인 욕설 사용은 통보없이 삭제될 수 있습니다." 
              id="floatingTextarea" name="comment"
              style="height: 100px;"></textarea>
              <fieldset>
               
                  <legend>별점</legend>
                  <input type="radio" name="rating" value="5" id="rate1"><label for="rate1">⭐</label>
                  <input type="radio" name="rating" value="4" id="rate2"><label for="rate2">⭐</label>
                  <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
                  <input type="radio" name="rating" value="2" id="rate4"><label for="rate4">⭐</label>
                  <input type="radio" name="rating" value="1" id="rate5"><label for="rate5">⭐</label>
                 <%--  <input type="hidden" name="userEmail" value=<%=rv.getUserEmail() %>>
                   <input type="hidden" name="boNum" value=<%=rv.getBoNum() %>>
--%>
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
            </div>  
=======
			
			out.println("   <div class=\"modal fade\" id=\"Modal"+count+"\" tabindex=\"-1\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">\r\n"
    				+ "        <div class=\"modal-dialog\">\r\n"
    				+ "          <div class=\"modal-content\">\r\n"
    				+ "            <div class=\"modal-header\">\r\n"
    				+ "              <h1 class=\"modal-title fs-5\" id=\"exampleModalLabel\">숙소는 어떠셨나요?</h1>\r\n"
    				+ "              <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>\r\n"
    				+ "            </div>\r\n"
    				+ "          <div class=\"modal-body\">\r\n"
    				+ "            <form name=\"myform"+count+"\" id=\"myform\" method=\"post\" >\r\n"
    				+ "              <legend>후기를 남겨주세요</legend>\r\n"
    				+ "              <textarea class=\"form-control\" placeholder=\"무분별한 비방, 폭력적인 욕설 사용은 통보없이 삭제될 수 있습니다.\" id=\"floatingTextarea\" name=\"comment\"\r\n"
    				+ "              style=\"height: 100px;\"></textarea>\r\n"
    				+ "              <fieldset>\r\n"
    				+ "                  <legend>별점</legend>\r\n"
    				+ "                  <input type=\"radio\" name=\"rating\" value=\"5\" id=\"rate1\"><label for=\"rate1\">⭐</label>\r\n"
    				+ "                  <input type=\"radio\" name=\"rating\" value=\"4\" id=\"rate2\"><label for=\"rate2\">⭐</label>\r\n"
    				+ "                  <input type=\"radio\" name=\"rating\" value=\"3\" id=\"rate3\"><label for=\"rate3\">⭐</label>\r\n"
    				+ "                  <input type=\"radio\" name=\"rating\" value=\"2\" id=\"rate4\"><label for=\"rate4\">⭐</label>\r\n"
    				+ "                  <input type=\"radio\" name=\"rating\" value=\"1\" id=\"rate5\"><label for=\"rate5\">⭐</label>\r\n"
    				+ "                  <input type=\"hidden\" name=\"id\" value="+id+">\r\n"
    				+ "                  <input type=\"hidden\" name=\"rev_num\" value="+rs.getInt("Rev_Num")+">\r\n"
    				+ "              </fieldset>\r\n"
    				+ "              <div>솔직한 평가 부탁드립니다.</div>\r\n"
    				+ "          </form>\r\n"
    				+ "        </div>\r\n"
    				+ "        <div class=\"modal-footer\">\r\n"
    				+ "          <button type=\"button\" id=\"Edit_up"+count+"\" class=\"btn btn-primary\" >평가하기</button>\r\n"
    				+ "          <button type=\"button\"  class=\"btn btn-secondary\" data-bs-dismiss=\"modal\">다음에 평가하기</button>\r\n"
    				+ "        </div>\r\n"
    				+ "      </div>\r\n"
    				+ "      </div></div></div>"); 
			
			  out.println("<script>\r\n"
      				+ "document.getElementById('delete_btn"+count+"').addEventListener('click', (e)=>{"
      				+ "	e.preventDefault();"
      				+ "	location.href='reviewDelete_proc.jsp?ri="+rs.getInt("Rev_Num")+"/"+id+"';"
      				+ "});"
      				+ "document.getElementById('Edit_up"+count+"').addEventListener('click', (e)=>{"
      				+ "	e.preventDefault();"
            				+ "	let form = document.myform"+count+";\r\n"

      						+ "	form.action=\"reviewEdit_proc.jsp\"\r\n"
            				+ "	form.submit();\r\n"
      				+ "});"
			  +"</script>");
			  
			 
	
		}
    	
    }
    else
    {
        out.println("</table>");

    }
	dm.disconnect();

		%>
          
           
			

           
          
>>>>>>> ce01169da4b3b20dec374aad45335b12e60e802f
        
        
        
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
	
	
         <!-- footer 부분 -->
         <%@ include file="footer.jsp" %>
        
      <!-- JavaScript Bundle with Popper -->
<<<<<<< HEAD
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" 
crossorigin="anonymous"></script>
=======
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <script>
    
    document.getElementById('serch_review').addEventListener('click', (e)=>{
    	e.preventDefault();
    	let form = document.serch_review_form;
    	form.action="serch_review_proc.jsp"
    	form.submit();
    	
   
    }); 
    </script>
>>>>>>> ce01169da4b3b20dec374aad45335b12e60e802f
    </body>
</html>
              
              