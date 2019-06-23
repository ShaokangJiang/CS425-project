	<%@ page language="java" import="java.util.*,java.sql.*,java.net.*,website.*" pageEncoding="utf-8"%>  
	<%@ page import="website.*,java.util.Date,java.util.Calendar,java.text.SimpleDateFormat"%>
	<%  
	String path = request.getContextPath();  
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
	%>  
	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
	<html>  
	  <head>  
	    <base href="<%=basePath%>">  
	      
	    <title>My JSP 'Feilong_loginCh.jsp' starting page</title>  
	     <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	  <link href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
	  <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/><title>Insert title here</title>
	 
	    
	      
	    <meta http-equiv="pragma" content="no-cache">  
	    <meta http-equiv="cache-control" content="no-cache">  
	    <meta http-equiv="expires" content="0">      
	    <meta http-equiv="keywords" content="">  
	    <meta http-equiv="description" content="This is my page">  

	  
	  </head>  
	  <body>  
	    <%      
	            try{
	            	  String id = request.getParameter("id");
	            		String patient_id = request.getParameter("patient_id");
	            		String doc_id = request.getParameter("doc_id");
	            		String[] selected =  request.getParameter("group1").split(";");
	            		String date=selected[0]+" "+selected[1];
	            		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.");
	            		java.sql.Timestamp time = new Timestamp(formatter.parse(date).getTime());

	          
	            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); 
	            String connectionString =  
	            "jdbc:sqlserver://huangsk100.database.windows.net:1433;database=huangsk100;user=huangsk100@huangsk100;password=*PASSWORD*;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;";  
	            Connection conn = DriverManager.getConnection(connectionString); 
	            PreparedStatement tmt = conn.prepareStatement("Insert into dbo.calendar values('" + doc_id + "','" + time + "','" + patient_id + "')");  

	        	String web = request.getParameter("web");
	        	int rst = tmt.executeUpdate();  
	        	if(rst!=0){
	            	%>
	            	<jsp:forward page="schedule.jsp">
	            	<jsp:param name="id" value="<%=id %>"/>   
	            	<jsp:param name="appoinment" value="1"/>   
	            	
	            	<jsp:param name="web" value="<%=web %>"/>   
	            </jsp:forward>
	       	<%
	        	}
	        }catch(Exception e){  
	        	e.printStackTrace();  
	        	%>

	        	<br></br>
	        	<br></br>
	        	<br></br>
	        	<div class="row">
	                   <div class="col s1 m2 l4 left">
	              <p>&nbsp;&nbsp;&nbsp;</p>
	              </div>
	                <div class="col s10 m8 l4">
	                  <div class="card white z-depth-3">
	                    <div class="card-content black-text">
	                      <span class="card-title">Sorry!</span>
	                      <p>You visit this page in error.</p>
	                      <p>We will bring you to home page in <span id="mes">5</span> seconds.</p> 
	                      <a href="index.jsp">Click here</a><a class="black-text"> to go to home page immediately.</a><br>
	                      <a class="black-text">if you find this page shows many times, please contact us.</a>
	                  </div>


	              
	              <script language="javascript" type="text/javascript"> 
	        var i = 5; 
	        var intervalid; 
	        intervalid = setInterval("fun()", 1000); 
	        function fun() { 
	        if (i == 0) { 
	        window.location.href = "index.jsp"; 
	        clearInterval(intervalid); 
	        } 
	        document.getElementById("mes").innerHTML = i; 
	        i--; 
	        } 
	        </script> 
	            


	                </div>
	                    </div>
	                    </div>
	                    <br></br>
	                    <br></br>
	                    <br></br>
	        	
	        	<%
	        	} 
	                     
	                    
	                    
	                    %> 
	                    
	                    
	                     
	         <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
	          <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.js"></script>
	          <script src="js/init.js"></script>
	        <div id="fb-root"></div>
	            </body>
	        </html>  