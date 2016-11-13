<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.lenovo.lps.push.marketing.manager.HitConfig" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="assets/ico/favicon.ico">

    <title>PM Manager</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/starter-template.css" rel="stylesheet">
       
  </head>

  <body>

    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">PM Manager</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="index.html">Home</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="#contact">Contact</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>
	
	<%
		HitConfig hc = (HitConfig)request.getAttribute("hitConfig"); 
    	String zkPath = (String)request.getAttribute("zkPath");
	%>
	
	<div class="container">
		<div class="col-md-6">
		 	<form class="form-horizontal" action="updateHitConfig" method="post">
<fieldset>

<!-- Form Name -->
<legend>Update Hit Configuration in Path <em><%=zkPath %></em></legend>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="minHitInterval">minHitInterval</label>  
  <div class="col-md-5">
  <input id="minHitInterval" name="minHitInterval" type="text" placeholder="" class="form-control input-md" value=<%=hc.getMinHitInterval() %>>
    
  </div>
</div>

<!-- Multiple Checkboxes (inline) -->

<div class="form-group">
  <label class="col-md-4 control-label" for="pushHours">pushHours</label>
  <div class="col-md-4">
  	<%
  		int[] pushHours = hc.getPushHours();
		int len = pushHours.length;
  		int i = 0, j = 0;		
		while (i < 24 && j < len){
			if(i == pushHours[j]){
				j++;
	%>
	<label class="checkbox-inline" for="pushHours-<%=i %>">
      <input type="checkbox" name="pushHours" id="pushHours-<%=i %>" value="<%=i %>" checked="checked">
      <%=i %>
    </label>
    <%
			} else {
	%>
	<label class="checkbox-inline" for="pushHours-<%=i %>">
      <input type="checkbox" name="pushHours" id="pushHours-<%=i %>" value="<%=i %>">
      <%=i %>
    </label>
    <% }
		   i++;
	}  		 																	
  	%>
  	<%
  		while (i < 24) {
  	%>
  	<label class="checkbox-inline" for="pushHours-<%=i %>">
      <input type="checkbox" name="pushHours" id="pushHours-<%=i %>" value="<%=i %>">
      <%=i %>
    </label>
    <%  			
  			i++;
  		}  	
  	%>    
  </div>
</div>
<%
	Set<Long> testDevices = hc.getTestDevices();
  	String textValue = "";
  	for(Long td : testDevices){
  		textValue += td + ",";
  	}
%>
<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="testDevices">testDevices</label>  
  <div class="col-md-6">
  <input id="testDevices" name="testDevices" type="text" placeholder="comma separated values" class="form-control input-md" value="<%=textValue %>">
  <span class="help-block">eg: 34567,45667,99898</span>  
  </div>
</div>
<%
	int umapd = hc.getUserMaxAdsPerDay();
%>
<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="userMaxAdsPerDay">userMaxAdsPerDay</label>  
  <div class="col-md-5">
  <input id="userMaxAdsPerDay" name="userMaxAdsPerDay" type="text" placeholder="" class="form-control input-md" value="<%=umapd %>">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">  
  <div class="col-md-6">
  <input id="zkPath" name="zkPath" type="hidden" placeholder="" class="form-control input-md" value="<%=zkPath %>">  
  </div>
</div>


<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="submit-btn"></label>
  <div class="col-md-4">
    <input id="submit-btn" name="submit-btn" type="submit" class="btn btn-primary" value="update">
  </div>
</div>

</fieldset>
</form>           
		</div>
	</div>	
    <!-- Bootstrap core JavaScript-->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>
