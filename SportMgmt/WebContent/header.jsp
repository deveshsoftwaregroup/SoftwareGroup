<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>The12thman | League</title>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<%@ taglib uri="WEB-INF/sportmgmt.tld" prefix="s" %>  
    <link rel="stylesheet" href="/SportMgmt/css/foundation.css">
    <link rel="stylesheet" href="/SportMgmt/css/app.css">
    <link rel="stylesheet" href="/SportMgmt/css/superslides.css">
    <link rel="stylesheet" type="text/css" href="/SportMgmt/css/customMedia.css">
   <!-- <link rel="stylesheet" href="https://ismdj.scdn5.secure.raxcdn.com/static/CACHE/css/258578334140.css" type="text/css" />-->
    <link rel="stylesheet" type="text/css" href="/SportMgmt/css/258578334140.css">
    <script src="https://use.fontawesome.com/d4e6d4c165.js"></script>
    <style>
    
.ism .ism-element__name {
    font-family: inherit;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
    
    color: #f1f1f1;
    font-weight: 600;
}
.ism-game-header h1 a{ color:#fff;}
#ajaxloader {
    border: 16px solid #f3f3f3; /* Light grey */
    border-top: 16px solid blue;
 	border-right: 16px solid green;
 	border-bottom: 16px solid red;
 	border-left: 16px solid pink;
    border-radius: 50%;
    width: 50px;
    height: 50px;
    animation: spin 1s linear infinite;
    position: fixed;
    left: 50%;
    top: 50%;
    margin-left: -32px; 
    margin-top: -32px;
    z-index: 999;
    display:none;
}
.mask{ background: #000; opacity: 0.5; position:fixed; top: 0; left: 0; width: 100%; height:100%;}


@keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}
</style>
</head> 
 <body>
 <s:sportExt retrieve="priceList" />
 <div class="league_header">
    <div class="ism-header">
        <div class="wrapper">
            <div class="ism-game-header-wrap">
                <div class="ism-game-header">
                    <div class="top-banner">
						<div class="top-ads"></div>
						<div class="top-ads"></div>
						<div class="top-ads"></div>
					</div>
                    <h1>
                    	<a href="/a/">THE 12TH MAN LEAGUE</a>
                    </h1>                    
                </div>
                <nav role="navigation" class="ism-nav ismjs-priority-nav ismjs-nav priority-nav" instance="0">

                    <ul class="ism-nav__list ismjs-main-nav">                        

                        <li class="ism-nav__list__item">
                           
                            <%-- <a href="/SportMgmt/mvc/user/login/${sessionScope.userId}" class="ism-nav__tab" data-nav-tab="squad">Transfers</a> --%>
                        	<a href="javascript:void(0);" class="ism-nav__tab" onclick="uploadTransferView();" data-nav-tab="squad">Transfers</a>
                        </li> 
                        <li class="ism-nav__list__item">
                            <a href="/SportMgmt/mvc/game/MyTeamView/${sessionScope.userId}/${sessionScope.gameDetails.gameId}" class="ism-nav__tab " data-nav-tab="squad">My Team</a>
                        </li> 
                        <li class="ism-nav__list__item">
                            <a href="javascript:void(0);" class="ism-nav__tab" onclick="uploadMatchView('${sessionScope.gameDetails.gameId}');" data-nav-tab="squad">Fixtures</a>
                        </li>                        
                        <li class="ism-nav__list__item">
                            <a href="/SportMgmt/prizes.jsp" class="ism-nav__tab ">Scout</a>
                        </li>   
                        <li class="ism-nav__list__item">
                            <a href="/SportMgmt/prizes.jsp" class="ism-nav__tab ">Point Table</a>
                        </li>                      
                        <li class="ism-nav__list__item">
                            <a href="/SportMgmt/rules.jsp" class="ism-nav__tab ">Rules</a>
                        </li>
                        <li class="ism-nav__list__item">
                            <a href="/SportMgmt/FAQ.jsp" class="ism-nav__tab ">FAQ</a>
                        </li>                       
                        <li class="ism-nav__list__item">
                            <a href="#" class="ism-nav__tab ">Sign Out</a>
                        </li>

                    </ul>
                  <span class="ism-nav__dropdown-wrapper priority-nav__wrapper" aria-haspopup="false">
					<button aria-controls="menu" type="button" class="ism-nav__dropdown-toggle priority-nav__dropdown-toggle priority-nav-is-hidden">More</button>
					<ul aria-hidden="true" class="ism-nav__dropdown priority-nav__dropdown"></ul>
					</span>
                </nav>
            </div>
        </div>
    </div>  
   </div>  

    
 
    
    <script src="/SportMgmt/js/vendor/jquery.js"></script>
    <script src="/SportMgmt/js/vendor/what-input.js"></script>
    <script src="/SportMgmt/js/vendor/foundation.js"></script>
    <script src="/SportMgmt/js/app.js"></script>
    <script src="/SportMgmt/js/jquery.easing.1.3.js"></script>
    <script src="/SportMgmt/js/jquery.animate-enhanced.min.js"></script>
    <script src="/SportMgmt/js/jquery.superslides.js" type="text/javascript" charset="utf-8"></script>
 	<script type="text/javascript" src="/SportMgmt/js/69e9bb26ef46.js"></script>
	<script type="text/javascript">
		function uploadMatchView(gameId)
		{
			if(typeof gameId != 'undefined' && gameId != '')
			{
				url ="/SportMgmt/mvc/game/MatchView/"+gameId;
				$.ajax({
		     		  url: url,
		     		  dataType: 'html',
		     		  success: function( resp ) {
		     			 //console.log(resp); 
		     			 $('.ism-container').html(resp);
		     		  },
		     		  error: function( req, status, err ) {
		     		    console.log( 'something went wrong', status, err );
		     		  }
		     		});	
			}
		}
		function uploadTransferView()
		{
			url ="/SportMgmt/transfer.jsp";
				$.ajax({
		     		  url: url,
		     		  dataType: 'html',
		     		  success: function( resp ) {
		     			 //console.log(resp); 
		     			 $('.ism-container').html(resp);
		     		  },
		     		  error: function( req, status, err ) {
		     		    console.log( 'something went wrong', status, err );
		     		  }
		     		});	
		}
  </script>
  </body>
</html>