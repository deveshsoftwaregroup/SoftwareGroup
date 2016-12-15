<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The 12th Man League</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta name="viewport" content="width=device-width, initial-scale=1">

 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<%@ taglib uri="WEB-INF/sportmgmt.tld" prefix="s" %>  
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<link rel="stylesheet" type="text/css" href="/SportMgmt/assets/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/SportMgmt/assets/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="/SportMgmt/assets/css/animate.css">
<link rel="stylesheet" type="text/css" href="/SportMgmt/assets/css/theme.css">
<link rel="stylesheet" type="text/css" href="/SportMgmt/assets/css/style.css">
<!--[if lt IE 9]>
<script src="assets/js/html5shiv.min.js"></script>
<script src="assets/js/respond.min.js"></script>
<![endif]-->
</head>
<body>
<div id="preloader">
  <div id="status">&nbsp;</div>
</div>
<a class="scrollToTop" href="#"><i class="fa fa-angle-up"></i></a>
<div class="container">
  <header id="header">
    <div class="row">
      <div class="col-lg-12 col-md-12 col-sm-12">
        <div class="header_bottom">
          <div class="logo_area" ><a href="http://the12thman.in" target="_blank" class="logo"><img src="/SportMgmt/images/logo.png" alt="" height="92" width="92">
          <span>The 12th Man <span>League</span></span>
          </a></div>
          <div class="add_banner"><a href="#"><img src="/SportMgmt/images/addbanner_728x90_V1.jpg" alt=""></a></div>
        </div>
      </div>
    </div>
  </header>
   <section id="newsSection">
    <div class="row">
      <div class="col-lg-12 col-md-12">
        <div class="latest_newsarea"> <span>Our Partners</span>
          <ul id="ticker01" class="news_sticker">
            <li><a href="#"><img src="/SportMgmt/images/soccer-loader.gif" alt=""></a></li>
            <li><a href="" target="_blank"><img src="/SportMgmt/images/news_thumbnail2.jpg" alt=""></a></li>    
            <li><a href="http://www.the12thman.in" target="_blank"><img src="/SportMgmt/images/logo.png" alt=""></a></li>  
            <li><a href="#"><img src="/SportMgmt/images/photograph_img2.jpg" alt=""></a></li>  
            <li><a href="#"><img src="/SportMgmt/images/img-1.jpg" alt=""></a></li>  
            <li><a href="#"><img src="/SportMgmt/images/img-2.jpg" alt=""></a></li>    
             <li><a href="#"><img src="/SportMgmt/images/football-1.png" alt=""></a></li>
            <li><a href="" target="_blank"><img src="/SportMgmt/images/news_thumbnail2.jpg" alt=""></a></li>    
            <li><a href="http://www.the12thman.in" target="_blank"><img src="/SportMgmt/images/logo.png" alt=""></a></li>  
            <li><a href="#"><img src="/SportMgmt/images/photograph_img2.jpg" alt=""></a></li>  
            <li><a href="#"><img src="/SportMgmt/images/img-1.jpg" alt=""></a></li>  
            <li><a href="#"><img src="/SportMgmt/images/img-2.jpg" alt=""></a></li>                  
          </ul>
          
        </div>
      </div>
    </div>
  </section>
  <section id="navArea">
    <nav class="navbar navbar-inverse" role="navigation">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      </div>
      <div id="navbar" class="navbar-collapse collapse">
        <ul class="nav navbar-nav main_nav">
          <li class="active"><a href="javascript:void(0);" onclick="openHomeHome();"><span class="fa fa-home desktop-home"></span><span class="mobile-show">Home</span></a></li>
          <li><a href="javascript:void(0);" onclick="homeGameGuide();">Game Guide</a></li>
          <li><a href="javascript:void(0);" onclick="homeGameGuide();">Standings</a></li>
          <li><a href="javascript:void(0);" onclick="openHomeHome();">Players</a></li>
        </ul>
      </div>
    </nav>
  </section>
  <section id="newsSection">
    <div class="row">
      <div class="col-lg-12 col-md-12">
        <div class="latest_newsarea"> <span>Ongoing/Upcoming Leagues</span>
          <ul id="ticker01" class="news_sticker">
            <li><a href="#"><img src="/SportMgmt/images/news_thumbnail3.jpg" alt="">Fantasy League</a></li>
            <li><a href="http://www.google.co.in" target="_blank"><img src="/SportMgmt/images/news_thumbnail3.jpg" alt="">Double your money</a></li>    
            <li><a href="#"><img src="/SportMgmt/images/news_thumbnail3.jpg" alt="">Predict top 11</a></li>  
            <li><a href="#"><img src="/SportMgmt/images/news_thumbnail3.jpg" alt="">Player with highest no of goals</a></li>  
            <li><a href="#"><img src="" alt=""></a>.</li>  
            <li><a href="#"><img src="" alt=""></a>.</li>                  
          </ul>
          <div class="social_area">
            <ul class="social_nav">
              <li class="facebook"><a href="https://www.facebook.com/the12thman.in/" target="_blank"></a></li>
              <li class="twitter"><a href="https://twitter.com/the12thmantimes" target="_blank"></a></li>              
              <li class="googleplus"><a href="#"></a></li>
              <li class="youtube"><a href="#"></a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </section>
 
  <script>
	function redirectToLeague()
	{
		window.location="UserLanding";
		//window.open("http://localhost:7979/SportMgmt/mvc/user/UserLanding?isLogined=true");
	}
	function homeGameGuide()
	{
		window.location="HomeGameGuide";
	}
	function openHomeHome()
	{
		window.location="UserLandingHome";
	}
</script>