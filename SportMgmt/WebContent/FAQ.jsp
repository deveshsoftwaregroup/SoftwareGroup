<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>The12thman | Football</title>
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
    .addPlayer a{ color:#ed3a28; font-size: 18px; padding: 5px;}
    .removePlayerIcon{ background: #de5e00;
    color: #fff !important;
    padding: 2px 5px;
    font-size: 12px;
    font-weight: bold;}
    /*  home  page */
.ism-game-header h1 a{ color:#fff;}
#ajaxloader {
    border: 16px solid #f3f3f3; /* Light grey */
    border-top: 16px solid blue;
 	border-right: 16px solid green;
 	border-bottom: 16px solid red;
 	border-left: 16px solid pink;
    border-radius: 50%;
    width: 120px;
    height: 120px;
    animation: spin 2s linear infinite;
}

@keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}
</style>
</head> 
 <body>
 <s:sportExt retrieve="priceList" />
  <%@ include file="header.jsp" %>
 <main id="mainContent" tabindex="0" class="ism">
   
    <div class="ism-container">
        <div class="ism-pusher ismjs-page-transition">
            <!-- Primary content -->
            <div id="ismr-main" class="ism-main">
                <div class="static_container">
			        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
			            <h2 class="head">How Can We Help?<br/> Your premierleague.com account</h2>
			            <div class="panel panel-default">
			                <div class="panel-heading" role="tab" id="headingOne">
			                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="collapsed">
			                      <h4 class="panel-title">I have submitted a password reset email and it has not been received. What can I do?</h4>
			                    </a>
			                </div>
			                <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
			                    <div class="panel-body">
			                        <p>Some users with Hotmail/Outlook addresses have reported issues with receiving emails due to them being blocked by spam filters. To resolve this you need to set the Premier League as a safe sender in your settings. To do this complete the following steps:</p>
			                        <p>Outlook.com (Formerly Hotmail)</p>
			                        <ol class="list">
			                        <li>Open your Outlook mailbox.</li>
			                        <li>Select Options from the top right (next to the question mark).</li>
			                        <li>Select More options > Safe and blocked senders (under Preventing junk email) > Safe senders.</li>
			                        <li>In the space provided, enter the address - noreply@mailout.users.premierleague.com</li>
			                        <li>Select Add to list.</li>
			                        <li>Ensure the safe mailing lists box has the address you entered, and select OK.</li>
			                        </ol>
			                        <p>Once this has been completed, please go back to the FPL site and follow the 'Forgot your password?' steps again.</p>
			                        <p>You should find that the email is then sent to your inbox. Please note that this can take up to 10 minutes to come through.</p>
			                    </div>
			                </div>
			            </div>
			            <div class="panel panel-default">
			                <div class="panel-heading" role="tab" id="headingTwo">
			                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
			                      <h4 class="panel-title">I can't sign in. What do I need to do?</h4>
			                    </a>
			              	</div>
			                <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
			                    <div class="panel-body">
			                        <p>Please ensure you are using your registered e-mail address and correct password. Note that the password is case sensitive.</p>
			                        
			                        <p>If you’ve registered for the first time this season, you will need to activate your account before entering a Fantasy Premier League team. An email will be sent to the email address you’ve registered with and contains a link you’ll need to click in order to activate your account. If you haven’t received an email, please check your spam or junk mail folders.</p>
			                        
			                        <p>Try resetting your password. A temporary password will be sent to your mailbox. Please update your password once logged in.</p>
			                        
			                        <p>If you do not receive the password reminder, please check your Junk folder in your email inbox and add noreply@mailout.users.premierleague.com to your address book.</p>
			                    </div>
			                </div>
			            </div>
			            <div class="panel panel-default">
			                <div class="panel-heading" role="tab" id="headingThree">
			                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
			                      <h4 class="panel-title">I have set up a team, but I can't see my History or renew my leagues from previous seasons. Can you link my new account to my old one?</h4>
			                    </a>
			        		</div>
			                <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
			                    <div class="panel-body">
			                        <p>Unfortunately, we cannot link your history from an old account to a new one. If you have set up a team for this season using a different email address, you will not be able to view your History from previous seasons on that account.</p>
			    
			                        <p>In order to see previous seasons' scores, you will need to sign in on the homepage using the registered email address and password combination from the previous seasons and set up a team using that account.</p> 
			                    </div>
			                </div>
			            </div>
			            <h2 class="head">How Can We Help?</h2>
			            <div class="panel panel-default">
			                <div class="panel-heading" role="tab" id="heading4">
			                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse4" aria-expanded="false" aria-controls="collapse4">
			                      <h4 class="panel-title">Collapsible Group Item #3</h4>
			                    </a>
			        		</div>
			                <div id="collapse4" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading4">
			                    <div class="panel-body">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. </div>
			                </div>
			            </div>
			            <div class="panel panel-default">
			                <div class="panel-heading" role="tab" id="heading5">
			                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse5" aria-expanded="false" aria-controls="collapse5">
			                      <h4 class="panel-title">Collapsible Group Item #3</h4>
			                    </a>
			        		</div>
			                <div id="collapse5" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading5">
			                    <div class="panel-body">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. </div>
			                </div>
			            </div>
			        </div>
			    </div>
            </div>
        </div>

        <!-- Secondary content -->

    </div>
    <!--</div>-->
    
    <div id="ismr-elements-menu"></div>
    <!--</div>
    </div>
    </div>
    </div>-->
</main>
    
 
    
    <script src="/SportMgmt/js/vendor/jquery.js"></script>
    <script src="/SportMgmt/js/vendor/what-input.js"></script>
    <script src="/SportMgmt/js/vendor/foundation.js"></script>
    <script src="/SportMgmt/js/app.js"></script>
    <script src="/SportMgmt/js/jquery.easing.1.3.js"></script>
    <script src="/SportMgmt/js/jquery.animate-enhanced.min.js"></script>
    <script src="/SportMgmt/js/jquery.superslides.js" type="text/javascript" charset="utf-8"></script>
   <script type="text/javascript">
   var gameDetailsJson = null;
   var playerListJson = null;
   var clubListJson = null;
   var userGameJson = null;
   </script>
   	<c:if test="${not empty sessionScope.gameDetailsJson}">
   	<script type="text/javascript">
   		gameDetailsJson = ${sessionScope.gameDetailsJson};
   	</script>
   	</c:if>
   	<c:if test="${not empty sessionScope.playerListJson}">
   		<script type="text/javascript">
  		 playerListJson = ${sessionScope.playerListJson};
  		</script>
	</c:if>
  	<c:if test="${not empty sessionScope.clubListJson}">
  	<script type="text/javascript">
		clubListJson = ${sessionScope.clubListJson};
		</script>
	</c:if>
	<c:if test="${not empty sessionScope.userGameJson}">
  	<script type="text/javascript">
  		userGameJson = ${sessionScope.userGameJson};
		</script>
	</c:if>
	
   <div id="ajaxloader"></div>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
   
  </body>
	
</html>