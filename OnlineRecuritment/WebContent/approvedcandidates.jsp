<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ include file="companyside.html" %>  
<%@ include file="companynav.html" %>  
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
if(session.getAttribute("usernamec")==null){
	response.sendRedirect("index.html");
}
%>

<html lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    

    <title>Approved Candidates</title>

    <!-- Bootstrap core CSS -->
    <link href="./dashboard%20files/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="./dashboard%20files/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="./dashboard%20files/dashboard.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="./dashboard%20files/ie-emulation-modes-warning.js.download"></script>

	<!-- custom css for side bar -->
	<link rel="stylesheet" href="dashboard%20files/sidebar.css">

  </head>

  <body>
            <!-- Main Dashboard -->
            
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">Approved Candidates</h1>

          </div>
          <!--  Database Connection -->
       <%! String url="jdbc:oracle:thin:@localhost:1521:xe";
       String id="hr";
       String pass="abc";
       String company_name;%>
      <%   
    try{
    	
  	  company_name=(String)session.getAttribute("company_name");
  	  System.out.println(company_name);
    	Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection(url,id,pass);
			PreparedStatement ps=con.prepareStatement("select * from approval where company_name=? and status='Approved'");
            ps.setString(1,company_name);
            ResultSet rs=ps.executeQuery();
    %>
      
              
 <div class="col-md-10 col-md-offset-2">
  <table class="table">
     <tr>
    <th>Username</th>
    <th>B.tech</th>
    <th>12th</th>
   <th>10th</th> 
   <th>Skills</th>
   <th>Status</th>
   
    </tr>
   <% 
        while(rs.next()){
      %>  	
        	<tr>
        	<td><%= rs.getString("test_given_by")%></td>
        	<td><%=rs.getString("btech")%></td>
        	<td><%=rs.getString("twelth")%></td>
        	<td><%=rs.getString("tenth")%></td>
        	<td><%=rs.getString("skills")%></td>
        	<td><%=rs.getString("status")%></td>
        	</tr>
   
   <%  
} 

				 }
catch(Exception e){
                   out.println(e);
                  }				 
%>
 </table>
</div>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="./dashboard%20files/jquery.min.js.download"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="./dashboard%20files/bootstrap.min.js.download"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="./dashboard%20files/holder.min.js.download"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="./dashboard%20files/ie10-viewport-bug-workaround.js.download"></script>
  

</body></html>