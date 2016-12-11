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
          <div class="logo_area"><a href="index.html" class="logo"><img src="/SportMgmt/images/logo.jpg" alt=""></a></div>
          <div class="add_banner"><a href="#"><img src="/SportMgmt/images/addbanner_728x90_V1.jpg" alt=""></a></div>
        </div>
      </div>
    </div>
  </header>
  <section id="navArea">
    <nav class="navbar navbar-inverse" role="navigation">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      </div>
      <div id="navbar" class="navbar-collapse collapse">
        <ul class="nav navbar-nav main_nav">
          <li class="active"><a href="index.html"><span class="fa fa-home desktop-home"></span><span class="mobile-show">Home</span></a></li>
          <li><a href="game_guide.html">Game Guide</a></li>
          <li><a href="standings.html">Standings</a></li>
          <li><a href="players.html">Players</a></li>
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
            <li><a href="#"><img src="/SportMgmt/images/news_thumbnail3.jpg" alt="">Double your money league</a></li>            
          </ul>
          <div class="social_area">
            <ul class="social_nav">
              <li class="facebook"><a href="https://www.facebook.com/the12thman.in/"></a></li>
              <li class="twitter"><a href="https://twitter.com/the12thmantimes"></a></li>              
              <li class="googleplus"><a href="#"></a></li>
              <li class="youtube"><a href="#"></a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </section>
  <section id="sliderSection">
    <div class="row">
      <div class="col-lg-8 col-md-8 col-sm-8">
        <div class="slick_slider">
          <div class="single_iteam"> <a href="pages/single_page.html"> <img src="/SportMgmt/images/ban-1.jpg" alt=""></a>
            <div class="slider_article">
              <h2><a class="slider_tittle" href="pages/single_page.html">Fusce eu nulla semper porttitor felis sit amet</a></h2>
              <p>Nunc tincidunt, elit non cursus euismod, lacus augue ornare metus, egestas imperdiet nulla nisl quis mauris. Suspendisse a pharetra urna. Morbi dui...</p>
            </div>
          </div>
          <div class="single_iteam"> <a href="pages/single_page.html"> <img src="/SportMgmt/images/ban-2.jpg" alt=""></a>
            <div class="slider_article">
              <h2><a class="slider_tittle" href="pages/single_page.html">Fusce eu nulla semper porttitor felis sit amet</a></h2>
              <p>Nunc tincidunt, elit non cursus euismod, lacus augue ornare metus, egestas imperdiet nulla nisl quis mauris. Suspendisse a pharetra urna. Morbi dui...</p>
            </div>
          </div>
          <div class="single_iteam"> <a href="pages/single_page.html"> <img src="/SportMgmt/images/ban-3.jpg" alt=""></a>
            <div class="slider_article">
              <h2><a class="slider_tittle" href="pages/single_page.html">Fusce eu nulla semper porttitor felis sit amet</a></h2>
              <p>Nunc tincidunt, elit non cursus euismod, lacus augue ornare metus, egestas imperdiet nulla nisl quis mauris. Suspendisse a pharetra urna. Morbi dui...</p>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-md-4 col-sm-4">
        <div class="choose-team"><img src="/SportMgmt/images/ball-1.jpg" class="img-responsive"> <span class="overlay-img">Select your Team <br/> & Play <br/> <a class="btn btn-black" onclick="redirectToLeague();">Select Team</a> </span></div>
      </div>
    </div>
  </section>
  <section id="contentSection">
    <div class="row">
      <div class="col-lg-8 col-md-8 col-sm-8">
        <div class="left_content">
          <div class="single_post_content">
            <blockquote>Fantasy League and Squawka have teamed up to bring you the game as you know and love it for 2016/17. Select your squad now! </blockquote>

Squawka's new free-to-play weekly MatchBoss game is now live, with a �50,000 jackpot and a guaranteed �1,000 in prizes up for grabs every week. Simply pick the the player you think will fare best in each of the weekend's 10 Premier League matches - based on Squawka's unique player performance algorithm. Play now at matchboss.com</p>
          </div>
          
          <div class="single_post_content">
            <h2><span>Latest News</span></h2>
            <div class="single_post_content_left">
              <ul class="business_catgnav">
                <li>
                  <figure class="bsbig_fig  wow fadeInDown"> <a class="featured_img" href="/SportMgmt/pages/single_page.html"> <img src="/SportMgmt/images/featured_img1.jpg" alt=""> <span class="overlay"></span> </a>
                    <figcaption> <a href="pages/single_page.html">Play MatchBoss and Win 50,000 Pounds!</a> </figcaption>
                    <div class="date">23rd September 2016</div>
                    <p>As you may be aware, Fantasy League has recently formed a partnership with football experts Squawka, who have just launched their latest free-to-play fantasy football based game.</p>
                  </figure>
                </li>
              </ul>
            </div>
            <div class="single_post_content_right">
              <ul class="spost_nav">
                <li>
                  <div class="media wow fadeInDown"> <a href="pages/single_page.html" class="media-left"> <img alt="" src="/SportMgmt/images/post_img1.jpg"> </a>
                    <div class="media-body"> <a href="pages/single_page.html" class="catg_title">Assists Explained - Week 13</a> <div class="date">7th November 2016</div></div>
                  </div>
                </li>
                <li>
                  <div class="media wow fadeInDown"> <a href="pages/single_page.html" class="media-left"> <img alt="" src="/SportMgmt/images/post_img2.jpg"> </a>
                    <div class="media-body"> <a href="pages/single_page.html" class="catg_title"> Assists Explained - Week 12</a> <div class="date">31st October 2016</div></div>
                  </div>
                </li>
                <li>
                  <div class="media wow fadeInDown"> <a href="pages/single_page.html" class="media-left"> <img alt="" src="/SportMgmt/images/post_img1.jpg"> </a>
                    <div class="media-body"> <a href="pages/single_page.html" class="catg_title">Fancy a Flutter at SquawkaBet?</a> <div class="date">27th October 2016</div></div>
                  </div>
                </li>
                <li>
                  <div class="media wow fadeInDown"> <a href="pages/single_page.html" class="media-left"> <img alt="" src="/SportMgmt/images/post_img2.jpg"> </a>
                    <div class="media-body"> <a href="pages/single_page.html" class="catg_title"> Assists Explained - Week 11</a> <div class="date">24th October 2016</div></div>
                  </div>
                </li>
                <li>
                  <div class="media wow fadeInDown"> <a href="pages/single_page.html" class="media-left"> <img alt="" src="/SportMgmt/images/post_img2.jpg"> </a>
                    <div class="media-body"> <a href="pages/single_page.html" class="catg_title"> Assists Explained - Week 10</a> <div class="date">18th October 2016</div></div>
                  </div>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-md-4 col-sm-4">
        <aside class="right_content">
          <div class="single_sidebar wow fadeInDown">
            <a class="sideAdd" href="#"><img src="/SportMgmt/images/ball-2.jpg" alt=""></a> 
            <a class="sideAdd" href="#"><img src="/SportMgmt/images/ball-3.jpg" alt=""></a> 
          </div>
        </aside>
      </div>
    </div>
  </section>
  <footer id="footer">
    <div class="footer_top">
      <div class="row">
        <div class="col-lg-4 col-md-4 col-sm-4">
          <div class="footer_widget wow fadeInLeftBig">
            <h2>Images</h2>
          </div>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-4">
          <div class="footer_widget wow fadeInDown">
            <h2>Tag</h2>
            <ul class="tag_nav">
              <li><a href="#">Terms of Use</a></li>
              <li><a href="#">Terms & Conditions Of Play</a></li>
              <li><a href="#">Privacy Policy18+</a></li>
              <li><a href="#">About Fantasy League</a></li>
              <li><a href="http://the12thman.in/advertise-with-us/">Advertise With Us</a></li>
              <li><a href="http://the12thman.in/">The 12th Man Blog</a></li>
              <li><a href="http://the12thman.in/contact/">Contact Us</a></li>
            </ul>
          </div>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-4">
          <div class="footer_widget wow fadeInRightBig">
            <h2>Contact</h2>
            <p>If you have any query or want to contact us, you are most welcome to write us at</p>
            <address>
            The 12th Man <br/>
            contactus@the12thman.in
            </address>
          </div>
        </div>
      </div>
    </div>
    <div class="footer_bottom">
      <p class="copyright">Copyright &copy; 2016 <a href="index.html">The 12th Man</a></p>
    </div>
  </footer>
</div>
<script src="/SportMgmt/assets/js/jquery.min.js"></script> 
<script src="/SportMgmt/assets/js/wow.min.js"></script> 
<script src="/SportMgmt/assets/js/bootstrap.min.js"></script> 
<script src="/SportMgmt/assets/js/slick.min.js"></script> 
<script src="/SportMgmt/assets/js/custom.js"></script>
</body>
</html>
<script>
	function redirectToLeague()
	{
		window.open("http://localhost:7979/SportMgmt/mvc/user/UserLanding?isLogined=true");
	}
</script>