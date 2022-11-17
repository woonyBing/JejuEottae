<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="dao.Dao_manager" %>
       <%@ page import="java.sql.DriverManager" %>
          <%@ page import="java.sql.Connection" %>
   
    <%@ page import="java.sql.ResultSet" %>
        <%@ page import="java.sql.SQLException" %>
                <%@ page import="java.sql.PreparedStatement" %>
        
    
   
    
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
<% 
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
				  out.println("id="+id);

				  Dao_manager dm  = new Dao_manager();
                  ResultSet rs=null;
                  if(cpi!=null)
                  {
               	   rs = dm.get_booking_datas_F(cpi_divide[0],cpi_divide[1],id);
                  }
                  else
                  {
                      rs = dm.get_booking_datas(id);// 카테고리랑 기간으로 필터링 기간 부등호 카테고리는 =

                  }
                  //
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
          <span class="navbar-brand mb-0 h1">RESERVED</span>
        </div>
      </nav>


    <div class="choice"> 
      <div class="container text-center">
      <form name="serch_reserved_form">
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
            
            			<button type="button" class="btn btn-success" id="serch_reserved">검색</button>
            
           
             </div>
             
            
<!--서브밋 추가 필요 -->
          </div>
 		   </form>
           </div>
      </div>
      
      <div class="accordion" id="accordionExample">
        
                  
                  <%
                 

                  if(rs!=null)
                  { 
              		  int count =0;
                	  while(rs.next())
                      {
                		  count++;

                		  out.println("<div class=\"accordion-item\"><h2 class=\"accordion-header\" id=\"heading"+count+"\"><button class=\"accordion-button\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#collapse"+ count +"\" aria-expanded=\"true\" aria-controls=\"collapse"+count+"\"><div> "+rs.getString("HOTEL_NAME")+" </div></button></h2><div id=\"collapse"+count+"\" class=\"accordion-collapse collapse show\" aria-labelledby=\"heading"+count+"\" data-bs-parent=\"#accordionExample\"><div class=\"accordion-body\"><strong>예약일자</strong><br/><div class=\"review\"><table class=\"table\"><thead><tr><th scope=\"col\" style=\"width: 20%\">예약호텔</th><th scope=\"col\" style=\"width: 30%\">숙박기간</th><th scope=\"col\" style=\"width: 20%\">예약자 성함</th><th scope=\"col\" style=\"width: 10%\">인원</th><th scope=\"col\" style=\"width: 20%\">결제금액</th></tr></thead><thead>");
                		  if(count>0)
                		  {
                    		  out.println("<table class=\"table\"><thead>");
                		  }
                		
                    	  out.println("<tr>");
                    	  out.print("<th scope=\"col\" style=\"width: 20%\">");
                    	  out.print(rs.getString("HOTEL_NAME"));
                    	  out.println("</th>");
                   
                    	  out.print("<th scope=\"col\" style=\"width: 30%\">");
                    	  out.print(rs.getString("CHECKIN")+"~"+rs.getString("CHECKOUT"));
                    	  out.println("</th>");
                    	  
     					  out.print("<th scope=\"col\" style=\"width: 20%\">");
                    	  out.print(rs.getString("NAME"));
                    	  out.println("</th>");
                    	  
     					  out.print("<th scope=\"col\" style=\"width: 10%\">");
                    	  out.print(rs.getInt("PERSON")+"");
                    	  out.println("</th>");
                    	  
     					  out.print("<th scope=\"col\" style=\"width: 20%\">");
                    	  out.print(rs.getInt("PAYMENT")+"");
                    	  out.println("</th>");
                    	  
                    	  out.println("</tr> ");

                    	   out.println("</thead></table><div class=\"booking_button\">"
                                  +"<button type=\"button\" class=\"btn btn-danger\">예약취소</button>"
                                  +"</div>"
                                  +"<div class=\"booking_button\">"
                                    +"<button type=\"button\" class=\"btn btn-warning\">문의하기</button>"
                                  +"</div>"
                                  +"<div class=\"booking_button\" data-bs-toggle=\"modal\" data-bs-target=\"#Modal"+count+"\">"
                                  +"<button type=\"button\" class=\"btn btn-primary\">숙소평가</button>"
                                  +"</div></div> </div> </div>");
                    	   
                    	   out.println("   <div class=\"modal fade\" id=\"Modal"+count+"\" tabindex=\"-1\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">\r\n"
                    				+ "        <div class=\"modal-dialog\">\r\n"
                    				+ "          <div class=\"modal-content\">\r\n"
                    				+ "            <div class=\"modal-header\">\r\n"
                    				+ "              <h1 class=\"modal-title fs-5\" id=\"exampleModalLabel\">숙소는 어떠셨나요?</h1>\r\n"
                    				+ "              <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>\r\n"
                    				+ "            </div>\r\n"
                    				+ "          <div class=\"modal-body\">\r\n"
                    				+ "        <!-- 코멘트 -->\r\n"
                    				+ "           \r\n"
                    				+ "\r\n"
                    				+ "            <form name=\"myform\" id=\"myform\" method=\"post\" >\r\n"
                    				+ "              <legend>후기를 남겨주세요</legend>\r\n"
                    				+ "              <textarea class=\"form-control\" placeholder=\"무분별한 비방, 폭력적인 욕설 사용은 통보없이 삭제될 수 있습니다.\" id=\"floatingTextarea\" name=\"comment\"\r\n"
                    				+ "              style=\"height: 100px;\"></textarea>\r\n"
                    				+ "              <fieldset>\r\n"
                    				+ "               \r\n"
                    				+ "                  <legend>별점</legend>\r\n"
                    				+ "                  <input type=\"radio\" name=\"rating\" value=\"5\" id=\"rate1\"><label for=\"rate1\">⭐</label>\r\n"
                    				+ "                  <input type=\"radio\" name=\"rating\" value=\"4\" id=\"rate2\"><label for=\"rate2\">⭐</label>\r\n"
                    				+ "                  <input type=\"radio\" name=\"rating\" value=\"3\" id=\"rate3\"><label for=\"rate3\">⭐</label>\r\n"
                    				+ "                  <input type=\"radio\" name=\"rating\" value=\"2\" id=\"rate4\"><label for=\"rate4\">⭐</label>\r\n"
                    				+ "                  <input type=\"radio\" name=\"rating\" value=\"1\" id=\"rate5\"><label for=\"rate5\">⭐</label>\r\n"
                    				+ "                  <input type=\"hidden\" name=\"id\" value="+id+">\r\n"
                    				+ "                 \r\n"
                    				+ "                  <input type=\"hidden\" name=\"bo_num\" value="+rs.getString("BO_NUM")+">\r\n"
                    				+ "                  \r\n"
                    				+ "              </fieldset>\r\n"
                    				+ "              <div>솔직한 평가 부탁드립니다.</div>\r\n"
                    				+ "          </form>\r\n"
                    				+ "\r\n"
                    				+ "        </div>\r\n"
                    				+ "        <div class=\"modal-footer\">\r\n"
                    				+ "          <button type=\"button\" id=\"reserve_up\" class=\"btn btn-primary\" >평가하기</button>\r\n"
                    				+ "          <button type=\"button\"  class=\"btn btn-secondary\" data-bs-dismiss=\"modal\">다음에 평가하기</button>\r\n"
                    				+ "        </div>\r\n"
                    				+ "      </div>\r\n"
                    				+ "      </div>\r\n"
                    				+ "      </div>");                	 
                      }
                    
                     
                  }
                  dm.disconnect();
                  %>
                    
               
                  
                    	  
         
          
          
        </div>
       

        <!-- Modal -->
   
      
      
    

    <!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script>
document.getElementById('reserve_up').addEventListener('click', (e)=>{
	e.preventDefault();
	let form = document.myform;
	form.action="review_proc.jsp"
	form.submit();

});
</script>

<script>
	document.getElementById('serch_reserved').addEventListener('click', (e)=>{
	e.preventDefault();
	let form = document.serch_reserved_form;
	form.action="serch_reserved_proc.jsp"
	form.submit();
}); 
</script>
</body>
</html>