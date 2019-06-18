<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>  
<%@ page import="website.*,java.util.Date,java.util.Calendar,java.text.SimpleDateFormat"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>  
  <head>  
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>CS425 project-Medicare</title>

  <!-- CSS  -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/><title>CS425 project-Medicare</title>

     <script type = "text/javascript"
         src = "https://code.jquery.com/jquery-2.1.1.min.js"></script>           
      <title>CS425 project-Medicare</title>
      <script>
         $(document).ready(function() {
            $('select').material_select();
         });
      </script>
       <style type="text/css">
body {
    background-image: url(https://audj6g.bn1303.livefilestore.com/y4mlDSTfO3NZw0a1pc5jwrKCgp2LTz-DwTOnBjJss2hrSw8GLBltHXnOAwBYXh77LRMLDN1RvFDG0S8sJpKXImQvPElwe9ejve74NWqpwyQ60L-pT_5HubGgpFwHuA5hRO_k2-dBDpzIUVbP1420erz6l3HXwoIr3S6XMeRas3OIynr37auemrM9bi839J80BL9ghn27aVqn58h0DAwJD23hw?width=2500&height=1664&cropmode=none);
background-size:100% 100%; 
}
</style>
 </head> 
 
 <body> 

 <nav class="Maroon" role="navigation">
    <div class="nav-wrapper container">
      <a id="logo-container" href="#" class="brand-logo middle">CS425 project-Medicare</a>
      <ul class="right hide-on-med-and-down">
        <li><a class="waves-effect waves-light btn blue" href="index.jsp">Login</a></li>
      </ul>

      <ul id="nav-mobile" class="side-nav">
        <li><a class="waves-effect waves-light btn blue" href="index.jsp">Login</a></li>
   
      </ul>
      <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons"><span class="white-text">menu</span></i></a>
    </div>
  </nav>
  
 <br></br>
 <br></br>

    <%    
    String h="";
    try{  
         if(request.getParameter("errNo")!=null)  
            h += "Please recheck your login ID. ";
         if(request.getParameter("logoff")!=null)  
             h += "Successfully logged out! ";
         if(request.getParameter("errlogoff")!=null)  
                 h += "Unsuccessfully logged out! ";
         if(request.getParameter("illegel")!=null)  
             h += "Illegel visiting";
    }catch(Exception e){
        e.printStackTrace();
    }  
   %>  


    <form action = "loginCh.jsp" method = "post" onsubmit = "return validate()">  
          <div class="row">
           <div class="col s1 m2 l4 left">
      <p>&nbsp;&nbsp;&nbsp;</p>
      </div>
        <div class="col s10 m8 l4">
          <div class="card white z-depth-3">
            <div class="card-content black-text">
              <span class="card-title">Welcome back!</span>
              <p>A little more steps.</p>
              <span class="red-text"><%=h%></span>      
          </div>
      <div class="card-action">

      <div class="input-field col s12">
           <i class="material-icons prefix">account_circle</i> 
          <input id="loginName" class="validate" type="text" name="id" value="" onkeyup="value=value.replace(/[^\d]/g,'')"> 
          <label for="icon_prefix">ID</label>
      </div>
      
      <div class="input-field col s12">
           <i class="material-icons prefix">vpn_key</i> 
          <input id="password" class="validate" type="text" name="password" value=""> 
          <label for="password">password</label>
      </div>
      
        <div class="input-field col s12">
        <i class="material-icons prefix">perm_identity</i> 
    <select name="Privilege">
      <optgroup label="Choose Privilege">
        <option value="admin">admin</option>
        <option value="scheduler">scheduler</option>
        <option value="Medical Staff">Medical Staff</option>
        <option value="patient">patient</option>
      </optgroup>
    </select>
    <label>Privilege</label>
  </div>
      <button class="waves-effect waves-light btn" id="submit">submit</button>

    
</div>
        </div>
            </div>
            </div>

    </form>  

    
      <br></br>
  <br></br>




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
  <script src="js/init_.js"></script>
<div id="fb-root"></div>
    </body>
</html>  