<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,java.sql.*,java.net.*,website.*,java.util.Date,java.util.Calendar,java.text.SimpleDateFormat" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CS425 project-Medicare</title>


  <!-- CSS  -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/><title>CS425 project-Medicare</title>
    <script type = "text/javascript"
         src = "https://code.jquery.com/jquery-2.1.1.min.js"></script>           
      <script>
         $(document).ready(function() {
            $('select').material_select();
         });
      </script>

    <!--  
    <link rel="stylesheet" type="text/css" href="styles.css">  
    -->  
    

</head>
<body>
<%    
    String h="";
    try{  
          if(request.getParameter("errNo1")!=null)  
         	h = "Unknow error happened, please try again later.";
    }catch(Exception e){  
        e.printStackTrace();  
    }  
   %>  
  <% 
  try{
  String id = request.getParameter("id");
  String patient_id =  request.getParameter("group1");
  Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); 
  String connectionString =  
  "jdbc:sqlserver://huangsk100.database.windows.net:1433;database=huangsk100;user=huangsk100@huangsk100;password=*PASSWORD*;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;";  
  Connection conn = DriverManager.getConnection(connectionString); 
  //Connect to database
  PreparedStatement pStmt1 = conn.prepareStatement("select * from dbo.Employee where id = '" + id + "' and jobtype = '" + "Medical Staff" +"'");  
  ResultSet rs1 = pStmt1.executeQuery();
  if(rs1.next()){
  String name = rs1.getString("First_Name");
  PreparedStatement pStmt2 = conn.prepareStatement("select * from dbo.patient where id = '" + patient_id +"'");  
  ResultSet rs2 = pStmt2.executeQuery();
  if(rs2.next()){
  %>
  <nav class="Maroon" role="navigation">
    <div class="nav-wrapper container">
      <a id="logo-container" href="#" class="brand-logo middle">CS425 project-Medicare</a>
      <ul class="right hide-on-med-and-down">
        <li><a class="material-icons prefix">account_circle</a><a class="waves-effect waves-light"><%=name %></a><a class="waves-effect waves-light btn blue" href="logoff.jsp?id=<%=id %>">Log off</a></li>
      </ul>

      <ul id="nav-mobile" class="side-nav">
        <li><a class="material-icons prefix">account_circle</a><a class="waves-effect waves-light"><%=name %></a><a class="waves-effect waves-light btn blue" href="logoff.jsp?id=<%=id %>">Log off</a></li>
   
      </ul>
      <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons"><span class="white-text">menu</span></i></a>
    </div>
  </nav>
  
<div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1; y-index:-1; margin:0 auto;">    
<img src="https://cucasa.bn1303.livefilestore.com/y4mNbTHNDQW3AydVQPVsvR2LAPdsIgH5mxnK10dezNoPuy1beb2wrWLFn58FVNAUeT3R8sO29f2xrgNdRjuGGDHH-EEk2j3Shvpqp4yAGP4JJVy9nnSH67Y78DmmXTcVEImIC1Ma91_Jlcel7RydVWyuomdYn9uTRPmNnUvoWk8NNNh7LJqks5ufxZR_m2eBcagmSadcegRJZSNtDLeJQN5uA?width=1400&height=425&cropmode=none" height="50%" width="100%"/>    
</div> 
  
  
  
<p>&nbsp;&nbsp;&nbsp;</p>
    
    
    
<div class="container">
<h2 class="blue-text">Hello, <%=name %></h2>
</div>
<br></br>


 <form action = "orderCh1.jsp" method = "post" onsubmit = "return validate()">  
<div class="row">
           <div class="col s1 m2 l2 left">
      <p>&nbsp;&nbsp;&nbsp;</p>
      </div>
        <div class="col s10 m8 l8">
          <div class="card white z-depth-3">
            <div class="card-content black-text">
              <span class="card-title"><i class="material-icons prefix">create</i>Choose diagnostic or create a new</span>
              <span class="red-text"><%=h%></span>      
          </div>
      <div class="card-action">
      
   <div class="input-field col s12">
        <i class="material-icons prefix">perm_identity</i> 
    <select name="diagnostic">
      <optgroup label="Choose from exist diagnostic">
	<% PreparedStatement pStmt3 = conn.prepareStatement("select * from dbo.Diagnostic");  
 	   ResultSet rs3 = pStmt3.executeQuery();
		int hs=0;
		while(rs3.next()){
		%>
		
		<option value=<%=rs3.getInt(1) %>><%="ID:"+rs3.getInt(1)+" Cost:"+rs3.getString(2)+" Category_Type:"+rs3.getString(3)  %></option>
		
		<%} %>
		
        <option value="-1">Create a new</option>
      </optgroup>
    </select>
    <label>diagnostic</label>
  </div>
        
        <input id="id" type="hidden" name="id" class="validate" value=<%=id %>>
        
        <input id="patient_id" type="hidden" name="patient_id" class="validate" value=<%=patient_id %>>
          
  <a class="waves-effect waves-light btn blue" href="medicalStaff.jsp?id=<%=id %>"><i class="material-icons prefix">arrow_back</i>Go back</a>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <button class="waves-effect waves-light btn" id="submit"><i class="material-icons prefix">arrow_forward</i>Submit</button>

</div>
        </div>
            </div>
            </div>

</form>

<br></br>


<%

rs1.close();
pStmt1.close();
conn.close();
  }else{
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
  }}else{
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
  
  } catch(Exception e){  
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
                

<footer class="page-footer Maroon">
    <div class="container">
      <div class="row">
        <div class="col l6 s12">
          <h5 class="white-text">About us</h5>
          <p class="grey-text text-lighten-4">This is the group project for CS425 medicare
		  </p>


        </div>
        <div class="col l3 s12">
          <h5 class="white-text">Contact us</h5>
          <ul>
            <li><a class="white-text" href="mailto:sjiang27@hawk.iit.edu">Shaokang Jiang</a></li>
			
          </ul>
        </div>
        <div class="col l3 s12">
          <h5 class="white-text">Connect</h5>
          <ul>
       Via email.
          </ul>
        </div>
      </div>
    </div>
    <div class="footer-copyright">
      <div class="container">
      </div>
    </div>
  </footer>
  

  
  <!--  Scripts-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.js"></script>
  <script src="js/init.js"></script>
<div id="fb-root"></div>
    </body>
</html>  