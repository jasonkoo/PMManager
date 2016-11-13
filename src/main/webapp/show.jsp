<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.lenovo.lps.push.marketing.manager.HitConfig" %>

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
		String zkPath = (String)request.getAttribute("zkPath");
		HitConfig hc = (HitConfig)request.getAttribute("hitConfig");
    	String hcString = hc.toStringForTest();
    	String[] lists = hcString.split(";");
    
	%>
	<div class="container">
		<div class="col-md-6">
		<!-- Form Name -->
		<h2>Hit Configurations <em>in Path <%=zkPath %></em> </h2>
		<ul class="list-group">
  			<li class="list-group-item"><%=lists[0] %></li>
  			<li class="list-group-item"><%=lists[1] %></li>
 			<li class="list-group-item"><%=lists[2] %></li>
  			<li class="list-group-item"><%=lists[3] %></li>  			
		</ul>
		</div>
	</div>
   
	
    <!-- Bootstrap core JavaScript-->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>
