<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>The12thman | League</title>
    <link rel="stylesheet" href="/SportMgmt/css/foundation.css">
    <link rel="stylesheet" href="/SportMgmt/css/app.css">
    <link rel="stylesheet" href="/SportMgmt/css/superslides.css">
    <style>
    /*body{background-color:#1b75bc;}*/
	#mainMenu a{ color:#fff; font-size:16px; text-transform:uppercase; position:relative; }
	#mainMenu a:hover{ color:#D4CCCC; text-align:center; border-bottom:2px solid #f0e809; padding-bottom:16px; position:relative; }
	#mainMenu li:last-child a{ border-bottom:none !important;}
	ul#mainMenu{ list-style:none; position:relative; top:25%; margin:auto; text-align:right;}
	
	ul#mainMenu li{ list-style:none; text-decoration:none; display:inline-block; text-align:center; text-transform:uppercase; padding:8px 10px; margin:5px auto; }
	#mainMenu a.logo{ font-size:34px; color:#fff; border-bottom:none;}
	.menuOverlay{ width:100%; height:80px; z-index:9; background:#1b75bc; position:absolute; opacity:.8; }
	#logo{top:20%; position:relative;}
	#logo a{ color:#fff; font-size:30px; }
    

	#exampleModal1{ padding: 80px 20px 60px;     box-shadow: 0px 0px 27px #369dc4;
    border: 2px solid #3f81c4; background:#fff;}
	input[type="text"], input[type="email"], input[type="password"], select{ height:34px; border:1px solid #999; }
	#exampleModal1 input{ margin-bottom:25px; }
	select option:first-child{ color:#ccc;}
	.btnSubmit{ display: block; width: 100%; margin: 20px 0px; background: rgba(27, 117, 188, .85); font-size: 16px; padding: 14px 20px;}
    </style>
</head>
<body>
<header class="menuOverlay">
        <div id="logo" class="large-4 columns">
    	<a href="http://the12thman.in/">The12thman</a>
        </div>
        <nav class="large-8 columns">
               <ul id="mainMenu">
                    <li><a href="http://the12thman.in/"> Home </a></li>
                    <li><a href="javascript:void(0);" data-open="exampleModal1"> Sign Up </a></li>
              </ul>
        </nav>
    </header>
    <div id="slides">
        <div class="slides-container">
        	<img src="/SportMgmt/images/1.jpg">
        	<img src="/SportMgmt/images/mzhnah28se4o5ykw.jpg">
            <img src="/SportMgmt/images/6922364-football-stadium-wallpaper.jpg">
            <img src="/SportMgmt/images/1.jpg">
            <img src="/SportMgmt/images/3.jpg">
            <img src="/SportMgmt/images/4.jpg">
            <img src="/SportMgmt/images/5.jpg">
            <img src="/SportMgmt/images/6.jpg">           
            <img src="/SportMgmt/images/8.jpg">           
            <img src="/SportMgmt/images/10.jpg">
            <img src="/SportMgmt/images/11.jpg">
            </div>
        <div id="main-content">
            <div class="row clearfix main-banner">
                <div class="large-12 column logo">
                    <div class="logo-container wow zoomIn" data-wow-duration=".8s" data-wow-delay="0.5s"
                        style="visibility: visible; animation-duration: 0.8s; animation-delay: 0.5s;
                        animation-name: zoomIn;">
                    </div>
                </div>
                <div class="large-12 column euro-headings">
                    <p>
                        The 12th Man League</p>
                    <div class="euro-divider">
                        <hr style="border-top: 5px solid #fff">
                    </div>
                    <p>
                        Play and win  <span class="highlight"> Cash!<span></span></span></p>
                </div>
            </div>
            <div class="row clearfix big-register">
                <div class="large-12 column text-center">
                    <button class="btn btn-default bigRegister" data-open="exampleModal1">
                        Play Now</button>
                </div>
            </div>
        </div>
    </div>
    
    
    <nav class="slides-navigation">
          <a href="#" class="next"></a>
          <a href="#" class="prev"></a>
        </nav>
   
    
    <!-- pop-up container -->
   

<div class="reveal medium" id="exampleModal1" data-reveal>
  
  
  <form name="RegisterForm" action="mvc/user/register" method="post">
        <div class="large-12 columns">
          <label>Name*
            <input type="text" name="displayName" placeholder="Name" required />
          </label>
        </div>
            <!-- <div class="large-12 columns">
          <label>last name*
            <input type="text" name="lastname" placeholder="last name" required />
          </label>
        </div>
 -->            <div class="large-12 columns">
          <label>Email Address/Login ID*
            <input type="email" name="emailId" placeholder="email" required />
          </label>
        </div>
           <!--  <div class="large-12 columns">
          <label>confirm email*
            <input type="email" name="emailconfirm" placeholder="email" required />
          </label>
        </div>
 -->        <div class="large-12 columns">
            <label>Password*</label>
            <input type="password" name="logonPassword" placeholder="password" required />       
            
             </div>
        <div class="large-12 columns">
            <label>Confirm Password*</label>
              <input type="password" name="logonPasswordConfirm" placeholder="confirm password" required />
            
            </div>
            <div class="large-12 columns">
            
                <div align="right">
                    <a href="javascript:void(0);" class="button-lrg" ></a><input type="submit" class="button btnSubmit" value="REGISTER"></a>
                     </div>
            </div>
    </form>
  <button class="close-button" data-close aria-label="Close modal" type="button">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
    
    <script src="/SportMgmt/js/vendor/jquery.js"></script>
    <script src="/SportMgmt/js/vendor/what-input.js"></script>
    <script src="/SportMgmt/js/vendor/foundation.js"></script>
    <script src="/SportMgmt/js/app.js"></script>
    <script src="/SportMgmt/js/jquery.easing.1.3.js"></script>
    <script src="/SportMgmt/js/jquery.animate-enhanced.min.js"></script>
    <script src="/SportMgmt/js/jquery.superslides.js" type="text/javascript" charset="utf-8"></script>
    <script>
        $(function () {
        	$('#slides').superslides({
                pagination:false,
        	animation:'fade',
        	play: 10000,
        	animation_speed: 3000,
            });
        });
       /* function submitForm()
        {
        	var regForm = document.forms['RegisterForm'];
        	if(typeof regForm['displayName'] == 'undefined' || regForm['displayName'].value=='')
        	{
        		alert("Please input your Name");
        		return false;
        	}
        	if(typeof regForm['emailId'] == 'undefined' || regForm['emailId'].value=='')
        	{
        		alert("Please input Email ID");
        		return false;
        	}
        	var isEmailValid = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(regForm['emailId'].value);
        	if(!isEmailValid)
       		{
        		alert("Email ID is not valid");
        		return false;
       		}
        	if(typeof regForm['logonPassword'] == 'undefined' || regForm['logonPassword'].value =='')
        	{
        		alert("Please input password");
        		return false;
        	}
        	if(typeof regForm['logonPasswordConfirm'] == 'undefined' || regForm['logonPasswordConfirm'].value !=regForm['logonPassword'].value)
        	{
        		alert("Password and confirm password should match");
        		return false;
        	}
        	regForm.submit();
        }*/
    </script>
  </body>
</body>
</html>