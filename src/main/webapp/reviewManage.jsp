<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@page import="dao.Dao_manager"%>
 <%@ page import="dto.Review" %>
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

String id= (String)session.getAttribute("userID");

String cp = request.getParameter("CP");
String[] cpi_divide = null;

if(cp != null)
{
     cpi_divide = cp.split("/");
}


Dao_manager dm  = new Dao_manager();
ResultSet rs=null;
if(cp!=null)
{
	   rs = dm.selectReviewList_F(cpi_divide[0],cpi_divide[1],id);
}
else
{
    rs = dm.selectReviewList(id);// 

}
	
		%>
		
              

        <!-- NavBar -->
        <nav class="navbar navbar-expand-lg bg-light">
          <div class="container-fluid">
              <a class="navbar-brand" href="/JejuEottae/LoginMain.jsp">μ μ£Όμ΄λπ</a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
              <div class="navbar-nav">
                  <a class="nav-link active" aria-current="page" href="./LoginMain.jsp">Home</a>
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
              <form name="serch_review_form">
        <div class="row">
          <div class="col">
             <select class="form-select" aria-label="Default select example" name="category" >
                <option selected value="0">μΉ΄νκ³ λ¦¬</option>
                <option value="1">νΈν</option>
                <option value="2">λ¦¬μ‘°νΈ</option>
             </select>
          </div>
          <div class="col">
             <select class="form-select" aria-label="Default select example" name = "period">
                <option selected value="0">μ μ²΄</option>
                <option value="3">μ΅κ·Ό 3κ°μ</option>
                <option value="6">μ΅κ·Ό 6κ°μ</option>
                <option value="9">μ΅κ·Ό 9κ°μ</option>
             </select>
    
            </div>
            <div class="col">
                              <input type="hidden" name="id" value=<%=id%>>
            
            			<button type="button" class="btn btn-success" id="serch_review">κ²μ</button>
            
           
             </div>
             
            
          </div>
                  
          
 		   </form>
 		     </div>
 		     </div> 
          
                    
		
        <!-- forλ¬Έ νμ νΉμ μμΌλ©΄ μλ¨κ²λ κ°λ₯νμ§... -->
		<div class="reviewTable">
        <table class="table">
          <thead>
            <tr>
              <th scope="col" style="width: 10%">#</th>
              <th scope="col" style="width: 25%">λ¦¬λ·° μμ±μΌ</th>
              <th scope="col" style="width: 10%">μμ½ λ²νΈ</th>
              <th scope="col" style="width: 20%">λ¦¬λ·° λ΄μ©</th>
              <th scope="col" style="width: 10%">νμ </th>
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
		    +"<button type=\"button\" class=\"btn btn-danger\" id=\"delete_btn"+count+"\">μ­μ </button>"
		    +"</div>"
		    +"<div class=\"review_button\" data-bs-toggle=\"modal\" data-bs-target=\"#Modal"+count+"\">"
		    +"<button type=\"button\" class=\"btn btn-warning\">μμ </button>"
		    +"</div>"
		    +"</td>"
		    +"</tr>"
		    +"</tbody></table>"
		 
					);
	    
			
			
			out.println("   <div class=\"modal fade\" id=\"Modal"+count+"\" tabindex=\"-1\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">\r\n"
    				+ "        <div class=\"modal-dialog\">\r\n"
    				+ "          <div class=\"modal-content\">\r\n"
    				+ "            <div class=\"modal-header\">\r\n"
    				+ "              <h1 class=\"modal-title fs-5\" id=\"exampleModalLabel\">μμλ μ΄λ μ¨λμ?</h1>\r\n"
    				+ "              <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>\r\n"
    				+ "            </div>\r\n"
    				+ "          <div class=\"modal-body\">\r\n"
    				+ "            <form name=\"myform"+count+"\" id=\"myform\" method=\"post\" >\r\n"
    				+ "              <legend>νκΈ°λ₯Ό λ¨κ²¨μ£ΌμΈμ</legend>\r\n"
    				+ "              <textarea class=\"form-control\" placeholder=\"λ¬΄λΆλ³ν λΉλ°©, ν­λ ₯μ μΈ μμ€ μ¬μ©μ ν΅λ³΄μμ΄ μ­μ λ  μ μμ΅λλ€.\" id=\"floatingTextarea\" name=\"comment\"\r\n"
    				+ "              style=\"height: 100px;\"></textarea>\r\n"
    				+ "              <fieldset>\r\n"
    				+ "                  <legend>λ³μ </legend>\r\n"
    				+ "                  <input type=\"radio\" name=\"rating\" value=\"5\" id=\"rate1\"><label for=\"rate1\">β­</label>\r\n"
    				+ "                  <input type=\"radio\" name=\"rating\" value=\"4\" id=\"rate2\"><label for=\"rate2\">β­</label>\r\n"
    				+ "                  <input type=\"radio\" name=\"rating\" value=\"3\" id=\"rate3\"><label for=\"rate3\">β­</label>\r\n"
    				+ "                  <input type=\"radio\" name=\"rating\" value=\"2\" id=\"rate4\"><label for=\"rate4\">β­</label>\r\n"
    				+ "                  <input type=\"radio\" name=\"rating\" value=\"1\" id=\"rate5\"><label for=\"rate5\">β­</label>\r\n"
    				+ "                  <input type=\"hidden\" name=\"id\" value="+id+">\r\n"
    				+ "                  <input type=\"hidden\" name=\"rev_num\" value="+rs.getInt("Rev_Num")+">\r\n"
    				+ "              </fieldset>\r\n"
    				+ "              <div>μμ§ν νκ° λΆνλλ¦½λλ€.</div>\r\n"
    				+ "          </form>\r\n"
    				+ "        </div>\r\n"
    				+ "        <div class=\"modal-footer\">\r\n"
    				+ "          <button type=\"button\" id=\"Edit_up"+count+"\" class=\"btn btn-primary\" >νκ°νκΈ°</button>\r\n"
    				+ "          <button type=\"button\"  class=\"btn btn-secondary\" data-bs-dismiss=\"modal\">λ€μμ νκ°νκΈ°</button>\r\n"
    				+ "        </div>\r\n"
    				+ "      </div>\r\n"
    				+ "      </div></div></div>"); 
			
			  out.println("<script>\r\n"
      				+ "document.getElementById('delete_btn"+count+"').addEventListener('click', (e)=>{"
      				+ "	e.preventDefault();"
      				+ "	location.href='reviewDelete_proc.jsp?rev_num="+rs.getInt("Rev_Num")+"';"
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
          
           
			

           
          
        
	<script>
		document.getElementById('updateBtn').addEventListener('click', (e)=>{
			e.preventDefault();
			let form = document.myform;
			if(form.comment.value == ""){ //μ΄λ¦μ΄ μλ κ²½μ°
				alert('λ΄μ©μ νμμλλ€.');
				form.comment.focus();
				return false;
			}
			else { //μ΄λ¦μ΄ μλ κ²½μ°
				if(confirm('μμ νμκ² μ΅λκΉ?')){
					form.action = "updateReview.jsp";
					form.submit();
				}
			}
		});
	</script>
	
	
         <!-- footer λΆλΆ -->
        
      <!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <script>
    
    document.getElementById('serch_review').addEventListener('click', (e)=>{
    	e.preventDefault();
    	let form = document.serch_review_form;
    	form.action="serch_review_proc.jsp"
    	form.submit();
    	
   
    }); 
    </script>
    
    </body>
</html>