<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<%@ taglib uri="WEB-INF/sportmgmt.tld" prefix="s" %>  
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <!-- 
    <link rel="stylesheet" href="/SportMgmt/css/app.css">
    <link rel="stylesheet" href="/SportMgmt/css/superslides.css">
    <link rel="stylesheet" type="text/css" href="/SportMgmt/css/customMedia.css">
   <link rel="stylesheet" href="https://ismdj.scdn5.secure.raxcdn.com/static/CACHE/css/258578334140.css" type="text/css" />-->
    <link rel="stylesheet" href="/SportMgmt/css/foundation.css">
    <link rel="stylesheet" type="text/css" href="/SportMgmt/css/258578334140.css"> 
    
    <style>
    .addPlayer a{ color:#ed3a28; font-size: 18px;padding: 5px 4px;}
    .removePlayerIcon{ background: #de5e00;
    color: #fff !important;
    padding: 2px 5px;
    font-size: 12px;
    font-weight: bold;
    }
    .ism-table--el__status.text-center.addPlayer {
    padding-left: .2rem;
    padding-right: .2rem;
    text-align: center;
}
    /*  home  page */
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
<s:sportExt retrieve="priceList" />
<s:sportExt retrieve="deadLine" />
<div class="addsbanner-lft"></div>
<div class="addsbanner-rgt"></div>
<div class="ism-pusher ismjs-page-transition">
            <!-- Primary content -->
            <div id="ismr-main" class="ism-main">
                <div>

                    <div id="ismr-scoreboard">
                        <div>
                        <div class="ism-copy">
                                <p style="color: #ffcc00; font-weight: bold;"><i class="fa fa-angle-double-right" style="color: #f00;"></i> Select maximum of 3 players from a single team</p>
                         </div> 

                            <!-- Scoreboard -->
                            <div class="ism-scoreboard">
							<div class="league-deadline-bar">
									<h4 class="league-deadline-bar__heading">Gameweek ${gameWeekNumber} Deadline: <time datetime="2016-08-27T10:30:00Z" class="league-deadline-bar__deadline">${deadline}</time></h4>
								</div>
                            </div>
                        </div>
                        
                        <div>
                        	<div class="plain_text">
                                <p>Free Transfer: 1 Available/Used</p>
                        	 
                                <p>Wild Card: 1 Available/Used
                                <c:if test="${sessionScope.hasFreeWildCard}">
                                <input type="button" class="link" value="Use Wild Card" data-toggle="modal" data-target="#myModal-1">
                                </p>
                                  <div id="myModal-1" class="modal fade" role="dialog">
								  <div class="modal-dialog">
								    <div class="modal-content">
								      <div class="modal-header">
								        <a type="button" class="close" data-dismiss="modal">&times;</a>
								        <h4 class="modal-title"></h4>
								      </div>
								      <div class="modal-body buywildcard">
										<h2>Are you Sure</h2>
										<p style="text-align:center">
											<a class="button" href="activateWildCard?userId=${sessionScope.user.userId}&planId=${sessionScope.freeWildCardPlanId}">Yes</a> &nbsp;
											<a class="button no-btn" data-dismiss="modal">No</a>
										</p>
								      </div> 
								    </div>
								  </div>
								</div>	
								</c:if>
                                <p>Want unlimited transfer? : 
                                <input type="button" class="link" value="Buy Wildcard" data-toggle="modal" data-target="#paymentModel" > 
                                </p>
                                <div id="paymentModel" class="modal fade" role="dialog">
									  <div class="modal-dialog modal-lg">
									
									    <!-- Modal content-->
									    <div class="modal-content">
									      <div class="modal-header">
									        <a type="button" class="close" data-dismiss="modal">&times;</a>
									        <h4 class="modal-title">Use Wild Card</h4>
									      </div>
									      <div class="modal-body">
									        <div class="table-responsive prod-tbl">
												<table class="table table-striped table-bordered table-hover">
													<thead>
													  <tr>
														<th>Product Name</th>
														<th>Product Price</th>
														<th>Discount Code</th>
														<th>Total Price</th>
														<th>Purchase It</th>
													  </tr>
													</thead>
													<tbody>
													<c:forEach var="wildCard" items="${sessionScope.purchableWildCardList}" >
													  <form  id="paymentForm_${wildCard.planId}" action="/SportMgmt/mvc/payment/MakePayment" method="post">
													  <input type="hidden" name="leaguePlanId" value="${wildCard.planId}"></input>
													  <input type="hidden" name="planDiscountId" value="${sessionScope.planDiscountId}"></input>
													  <input type="hidden" name="amount" value="${wildCard.price}"></input>
													  </form>
													  <tr>
														<td>${wildCard.name}</td>
														<td>${wildCard.price}</td>
														<td>
														<input id="paymentDiscountCode_${wildCard.planId}" type="text" name="discount" value=""></input>
														</td>
														<td>${wildCard.price}</td>
														<td>
									        			<button id="paymentButton_${wildCard.planId}" type="button" class="button" >Buy Now</button>
									     				</td>
													  </tr>
													  </c:forEach>
													 <%--  <tr>
														<td>Abcdef ghijk</td>
														<td>Rs. 200</td>
														<td>
															<select>
																<option>1</option>
																<option>2</option>
																<option>3</option>
																<option>4</option>
																<option>5</option>
															</select>
														</td>
														<td>Rs. 600</td>
													  </tr>
													  <tr>
														<td>Abcdef ghijk</td>
														<td>Rs. 200</td>
														<td>
															<select>
																<option>1</option>
																<option>2</option>
																<option>3</option>
																<option>4</option>
																<option>5</option>
															</select>
														</td>
														<td>Rs. 600</td>
													  </tr> --%>
													</tbody>
												  </table>
											</div>
									      </div>
									    </div>
									
									  </div>
									</div>
                              
                                <p>Cost : -4                                
                                </p>
                                
                                <p>Note: Cost will be deducted from your total points. You can make your cost 0 by using WIldCard.                                
                                </p>
                                
                        	 </div> 
                        	 <input type="button" value="Confirm" onclick="updatePoints('${sessionScope.user.userId}');">
										

                           
                           
                        </div>
                    </div>

                    <section>
                        <h3 class="visuallyHidden">My Squad</h3>
                        <div id="ismr-errors" class="ism-alert-wrap">
                            <div>

                            </div>
                        </div>
                        <div id="ismr-info" class="ism-alert-wrap">
                            <div>
                                <div id="ismjs-squad-info" tabindex="0">

                                </div>
                            </div>
                        </div>
                        <div class="ism-squad-wrapper">
                            <div class="ismjs-a11y-tabs ism-tabs">
                               

                                <section id="ismr-summary" class="ism-pitch" role="tabpanel">
                                    <div tabindex="0">

                                        <div class="ism-element-row ism-element-row--pitch">
                                            <div class="ism-pitch__unit ism-pitch__unit--4"></div>
                                            
                                            
                                            
                                            <div id="ismr-pos1"  class="ism-pitch__unit ism-pitch__unit--4">
                                                <div>
                                                <s:sport position="1" playerType="Goalkeeper"/>
                                                    <div class="ism-element" tabindex="0">
                                                        <div 
                                                        <c:choose>
                                                        <c:when test='${isPlayerAvail}'>class="ismjs-select added-player-css" id="${gameClubPlayerId}"</c:when>
                                                        <c:otherwise>class="ismjs-select"</c:otherwise>
                                                        </c:choose>
                                                        >
                                                            <picture>
                                                                <img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.png"  alt="" title="Select a Goalkeeper" class="ism-shirt ism-element__shirt">
                                                            </picture>
                                                             <c:choose>
                                                             <c:when test="${isPlayerAvail}">
                                                             	<div class="ism-element__name ism-element__name--placeholder">
                                                                ${playerName} <abbr title="Goalkeeper" class="ism-element__type"><span class="ism-element__type__short">${price}</span></abbr>
                                                             </div>
                                                             </c:when>
                                                             <c:otherwise>
                                                             <div class="ism-element__name ism-element__name--placeholder">
                                                                <abbr title="Goalkeeper" class="ism-element__type"><span class="ism-element__type__short">GKP</span></abbr>
                                                             </div>
                                                             </c:otherwise>
                                                             </c:choose>                                                            
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            
                                            
                                            
                                            <div id="ismr-pos2" class="ism-pitch__unit ism-pitch__unit--4">
                                                <div>
                                                <s:sport position="2" playerType="Goalkeeper"/>
                                                    <div class="ism-element" tabindex="0">
                                                    	<div <c:choose><c:when test='${isPlayerAvail}'>class="ismjs-select added-player-css" id="${gameClubPlayerId}"</c:when><c:otherwise>class="ismjs-select"</c:otherwise></c:choose>>

                <picture>
                    
                    <img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.png"
                    
                    
                    
                     title="Select a Goalkeeper" class="ism-shirt ism-element__shirt">
                </picture>

                											
                                                             <c:choose>
                                                             <c:when test="${isPlayerAvail}">
                                                             	<div class="ism-element__name ism-element__name--placeholder">
                                                                ${playerName} <abbr title="Goalkeeper" class="ism-element__type"><span class="ism-element__type__short">${price}</span></abbr>
                                                             </div>
                                                             </c:when>
                                                             <c:otherwise>
                                                             <div class="ism-element__name ism-element__name--placeholder">
                                                                 <abbr title="Goalkeeper" class="ism-element__type"><span class="ism-element__type__short">GKP</span></abbr>
                                                             </div>
                                                             </c:otherwise>
                                                             </c:choose>

            </div>                  
                                                    
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="ism-pitch__unit ism-pitch__unit--4"></div>
                                        </div>

                                        <div class="ism-element-row ism-element-row--pitch">
                                            <div id="ismr-pos3" class="ism-pitch__unit ism-pitch__unit--5">
                                                <div>
                                                <s:sport position="1" playerType="Defender"/>
                                                    <div class="ism-element" tabindex="0">

                                                        <div 
                                                        <c:choose>
                                                        	<c:when test='${isPlayerAvail}'>class="ismjs-select added-player-css" id="${gameClubPlayerId}"
                                                        	
                                                        	</c:when>
                                                        	<c:otherwise>class="ismjs-select"</c:otherwise>
                                                        </c:choose>
                                                        >

                                                            <picture>                                                                
                                                                <img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.png" 
                                                                alt="" title="Select a Defender" class="ism-shirt ism-element__shirt">
                                                            </picture>
															
                                                             <c:choose>
                                                             <c:when test="${isPlayerAvail}">
                                                             	<div class="ism-element__name ism-element__name--placeholder">
                                                                ${playerName} <abbr title="Defender" class="ism-element__type"><span class="ism-element__type__short">${price}</span></abbr>
                                                             </div>
                                                             </c:when>
                                                             <c:otherwise>
                                                             <div class="ism-element__name ism-element__name--placeholder">
                                                                 <abbr title="Defender" class="ism-element__type"><span class="ism-element__type__short">DEF</span></abbr>
                                                             </div>
                                                             </c:otherwise>
                                                             </c:choose>
                                                            
                                                          </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <div id="ismr-pos4" class="ism-pitch__unit ism-pitch__unit--5">
                                                <div>
                                                 <s:sport position="2" playerType="Defender"/>
                                                    <div class="ism-element" tabindex="0">

                                                        <div <c:choose><c:when test='${isPlayerAvail}'>class="ismjs-select added-player-css" id="${gameClubPlayerId}"</c:when><c:otherwise>class="ismjs-select"</c:otherwise></c:choose>>

                                                            <picture>
                                                                
                                                                <img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.png"  alt="" title="Select a Defender" class="ism-shirt ism-element__shirt">
                                                            </picture>

                                                           
                                                             <c:choose>
                                                             <c:when test="${isPlayerAvail}">
                                                             	<div class="ism-element__name ism-element__name--placeholder">
                                                                ${playerName} <abbr title="Defender" class="ism-element__type"><span class="ism-element__type__short">${price}</span></abbr>
                                                             </div>
                                                             </c:when>
                                                             <c:otherwise>
                                                             <div class="ism-element__name ism-element__name--placeholder">
                                                                 <abbr title="Defender" class="ism-element__type"><span class="ism-element__type__short">DEF</span></abbr>
                                                             </div>
                                                             </c:otherwise>
                                                             </c:choose>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <div id="ismr-pos5" class="ism-pitch__unit ism-pitch__unit--5">
                                                <div>
                                                 <s:sport position="3" playerType="Defender"/>
                                                    <div class="ism-element" tabindex="0">

                                                        <div <c:choose><c:when test='${isPlayerAvail}'>class="ismjs-select added-player-css" id="${gameClubPlayerId}"</c:when><c:otherwise>class="ismjs-select"</c:otherwise></c:choose>>

                                                            <picture>
                                                               
                                                                <img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.png" alt="" title="Select a Defender" class="ism-shirt ism-element__shirt">
                                                            </picture>

                                                           
                                                             <c:choose>
                                                             <c:when test="${isPlayerAvail}">
                                                             	<div class="ism-element__name ism-element__name--placeholder">
                                                                ${playerName} <abbr title="Defender" class="ism-element__type"><span class="ism-element__type__short">${price}</span></abbr>
                                                             </div>
                                                             </c:when>
                                                             <c:otherwise>
                                                             <div class="ism-element__name ism-element__name--placeholder">
                                                                 <abbr title="Defender" class="ism-element__type"><span class="ism-element__type__short">DEF</span></abbr>
                                                             </div>
                                                             </c:otherwise>
                                                             </c:choose>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <div id="ismr-pos6" class="ism-pitch__unit ism-pitch__unit--5">
                                                <div>
                                                 <s:sport position="4" playerType="Defender"/>
                                                    <div class="ism-element" tabindex="0">

                                                        <div <c:choose><c:when test='${isPlayerAvail}'>class="ismjs-select added-player-css" id="${gameClubPlayerId}"</c:when><c:otherwise>class="ismjs-select"</c:otherwise></c:choose>>

                                                            <picture>
                                                               <img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.png" alt="" title="Select a Defender" class="ism-shirt ism-element__shirt">
                                                            </picture>

                                                           
                                                             <c:choose>
                                                             <c:when test="${isPlayerAvail}">
                                                             	<div class="ism-element__name ism-element__name--placeholder">
                                                                ${playerName} <abbr title="Defender" class="ism-element__type"><span class="ism-element__type__short">${price}</span></abbr>
                                                             </div>
                                                             </c:when>
                                                             <c:otherwise>
                                                             <div class="ism-element__name ism-element__name--placeholder">
                                                                 <abbr title="Defender" class="ism-element__type"><span class="ism-element__type__short">DEF</span></abbr>
                                                             </div>
                                                             </c:otherwise>
                                                             </c:choose>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <div id="ismr-pos7" class="ism-pitch__unit ism-pitch__unit--5">
                                                <div>
                                                 <s:sport position="5" playerType="Defender"/>
                                                    <div class="ism-element" tabindex="0">

                                                        <div <c:choose><c:when test='${isPlayerAvail}'>class="ismjs-select added-player-css" id="${gameClubPlayerId}"</c:when><c:otherwise>class="ismjs-select"</c:otherwise></c:choose>>

                                                            <picture>
                                                                 <img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.png" alt="" title="Select a Defender" class="ism-shirt ism-element__shirt">
                                                            </picture>                                                             <c:choose>
                                                             <c:when test="${isPlayerAvail}">
                                                             	<div class="ism-element__name ism-element__name--placeholder">
                                                                ${playerName} <abbr title="Defender" class="ism-element__type"><span class="ism-element__type__short">${price}</span></abbr>
                                                             </div>
                                                             </c:when>
                                                             <c:otherwise>
                                                             <div class="ism-element__name ism-element__name--placeholder">
                                                                 <abbr title="Defender" class="ism-element__type"><span class="ism-element__type__short">DEF</span></abbr>
                                                             </div>
                                                             </c:otherwise>
                                                             </c:choose>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="ism-element-row ism-element-row--pitch">
                                            <div id="ismr-pos8" class="ism-pitch__unit ism-pitch__unit--5">
                                                <div>
                                                <s:sport position="1" playerType="Midfielder"/>
                                                    <div class="ism-element" tabindex="0">
                                                        <div <c:choose><c:when test='${isPlayerAvail}'>class="ismjs-select added-player-css" id="${gameClubPlayerId}"</c:when><c:otherwise>class="ismjs-select"</c:otherwise></c:choose>>

                                                            <picture>
                                                                <img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.png" alt="" title="Select a Midfielder" class="ism-shirt ism-element__shirt">
                                                            </picture>
															
                                                             <c:choose>
                                                             <c:when test="${isPlayerAvail}">
                                                             	<div class="ism-element__name ism-element__name--placeholder">
                                                                ${playerName} <abbr title="Midfielder" class="ism-element__type"><span class="ism-element__type__short">${price}</span></abbr>
                                                             </div>
                                                             </c:when>
                                                             <c:otherwise>
                                                             <div class="ism-element__name ism-element__name--placeholder">
                                                                <abbr title="Midfielder" class="ism-element__type"><span class="ism-element__type__short">MID</span></abbr>
                                                             </div>
                                                             </c:otherwise>
                                                             </c:choose>
                                                            </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="ismr-pos9" class="ism-pitch__unit ism-pitch__unit--5">
                                                <div>
                                                 <s:sport position="2" playerType="Midfielder"/>
                                                    <div class="ism-element" tabindex="0">

                                                        <div <c:choose><c:when test='${isPlayerAvail}'>class="ismjs-select added-player-css" id="${gameClubPlayerId}"</c:when><c:otherwise>class="ismjs-select"</c:otherwise></c:choose>>

                                                            <picture>
                                                                <img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.png"  alt="" title="Select a Midfielder" class="ism-shirt ism-element__shirt">
                                                            </picture>

                                                           
                                                             <c:choose>
                                                             <c:when test="${isPlayerAvail}">
                                                             	<div class="ism-element__name ism-element__name--placeholder">
                                                                ${playerName} <abbr title="Midfielder" class="ism-element__type"><span class="ism-element__type__short">${price}</span></abbr>
                                                             </div>
                                                             </c:when>
                                                             <c:otherwise>
                                                             <div class="ism-element__name ism-element__name--placeholder">
                                                                <abbr title="Midfielder" class="ism-element__type"><span class="ism-element__type__short">MID</span></abbr>
                                                             </div>
                                                             </c:otherwise>
                                                             </c:choose>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <div id="ismr-pos10" class="ism-pitch__unit ism-pitch__unit--5">
                                                <div>
                                                 <s:sport position="3" playerType="Midfielder"/>
                                                    <div class="ism-element" tabindex="0">

                                                        <div <c:choose><c:when test='${isPlayerAvail}'>class="ismjs-select added-player-css" id="${gameClubPlayerId}"</c:when><c:otherwise>class="ismjs-select"</c:otherwise></c:choose>>

                                                            <picture>
                                                                 <img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.png"  alt="" title="Select a Midfielder" class="ism-shirt ism-element__shirt">
                                                            </picture>

                                                           
                                                             <c:choose>
                                                             <c:when test="${isPlayerAvail}">
                                                             	<div class="ism-element__name ism-element__name--placeholder">
                                                                ${playerName} <abbr title="Midfielder" class="ism-element__type"><span class="ism-element__type__short">${price}</span></abbr>
                                                             </div>
                                                             </c:when>
                                                             <c:otherwise>
                                                             <div class="ism-element__name ism-element__name--placeholder">
                                                                <abbr title="Midfielder" class="ism-element__type"><span class="ism-element__type__short">MID</span></abbr>
                                                             </div>
                                                             </c:otherwise>
                                                             </c:choose>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <div id="ismr-pos11" class="ism-pitch__unit ism-pitch__unit--5">
                                                <div>
                                                <s:sport position="4" playerType="Midfielder"/>
                                                    <div class="ism-element" tabindex="0">
                                                        <div <c:choose><c:when test='${isPlayerAvail}'>class="ismjs-select added-player-css" id="${gameClubPlayerId}"</c:when><c:otherwise>class="ismjs-select"</c:otherwise></c:choose>>

                                                            <picture>
                                                                     <img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.png" alt="" title="Select a Midfielder" class="ism-shirt ism-element__shirt">
                                                            </picture>                                                             <c:choose>
                                                             <c:when test="${isPlayerAvail}">
                                                             	<div class="ism-element__name ism-element__name--placeholder">
                                                                ${playerName} <abbr title="Midfielder" class="ism-element__type"><span class="ism-element__type__short">${price}</span></abbr>
                                                             </div>
                                                             </c:when>
                                                             <c:otherwise>
                                                             <div class="ism-element__name ism-element__name--placeholder">
                                                                 <abbr title="Midfielder" class="ism-element__type"><span class="ism-element__type__short">MID</span></abbr>
                                                             </div>
                                                             </c:otherwise>
                                                             </c:choose>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <div id="ismr-pos12" class="ism-pitch__unit ism-pitch__unit--5">
                                                <div>
                                                <s:sport position="5" playerType="Midfielder"/>
                                                    <div class="ism-element" tabindex="0">

                                                        <div <c:choose><c:when test='${isPlayerAvail}'>class="ismjs-select added-player-css" id="${gameClubPlayerId}"</c:when><c:otherwise>class="ismjs-select"</c:otherwise></c:choose>>

                                                            <picture>
                                                                <img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.png" alt="" title="Select a Midfielder" class="ism-shirt ism-element__shirt">
                                                            </picture>                                                             <c:choose>
                                                             <c:when test="${isPlayerAvail}">
                                                             	<div class="ism-element__name ism-element__name--placeholder">
                                                                ${playerName} <abbr title="Midfielder" class="ism-element__type"><span class="ism-element__type__short">${price}</span></abbr>
                                                             </div>
                                                             </c:when>
                                                             <c:otherwise>
                                                             <div class="ism-element__name ism-element__name--placeholder">
                                                                 <abbr title="Midfielder" class="ism-element__type"><span class="ism-element__type__short">MID</span></abbr>
                                                             </div>
                                                             </c:otherwise>
                                                             </c:choose>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="ism-element-row ism-element-row--pitch">
                                            <div id="ismr-pos13" class="ism-pitch__unit ism-pitch__unit--3">
                                                <div>
                                                <s:sport position="1" playerType="Forward"/>
                                                    <div class="ism-element" tabindex="0">

                                                        <div <c:choose><c:when test='${isPlayerAvail}'>class="ismjs-select added-player-css" id="${gameClubPlayerId}"</c:when><c:otherwise>class="ismjs-select"</c:otherwise></c:choose>>

                                                            <picture>
                                                                   <img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.png" alt="" title="Select a Forward" class="ism-shirt ism-element__shirt">
                                                            </picture>
															
                                                             <c:choose>
                                                             <c:when test="${isPlayerAvail}">
                                                             	<div class="ism-element__name ism-element__name--placeholder">
                                                                ${playerName} <abbr title="Forward" class="ism-element__type"><span class="ism-element__type__short">${price}</span></abbr>
                                                             </div>
                                                             </c:when>
                                                             <c:otherwise>
                                                             <div class="ism-element__name ism-element__name--placeholder">
                                                                 <abbr title="Forward" class="ism-element__type"><span class="ism-element__type__short">FWD</span></abbr>
                                                             </div>
                                                             </c:otherwise>
                                                             </c:choose>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <div id="ismr-pos14" class="ism-pitch__unit ism-pitch__unit--3">
                                                <div>
                                                <s:sport position="2" playerType="Forward"/>
                                                    <div class="ism-element" tabindex="0">

                                                        <div <c:choose><c:when test='${isPlayerAvail}'>class="ismjs-select added-player-css" id="${gameClubPlayerId}"</c:when><c:otherwise>class="ismjs-select"</c:otherwise></c:choose>>

                                                            <picture>
                                                               <img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.png"  alt="" title="Select a Forward" class="ism-shirt ism-element__shirt">
                                                            </picture>

                                                            
                                                             <c:choose>
                                                             <c:when test="${isPlayerAvail}">
                                                             	<div class="ism-element__name ism-element__name--placeholder">
                                                                ${playerName} <abbr title="Forward" class="ism-element__type"><span class="ism-element__type__short">${price}</span></abbr>
                                                             </div>
                                                             </c:when>
                                                             <c:otherwise>
                                                             <div class="ism-element__name ism-element__name--placeholder">
                                                                <abbr title="Forward" class="ism-element__type"><span class="ism-element__type__short">FWD</span></abbr>
                                                             </div>
                                                             </c:otherwise>
                                                             </c:choose>

                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <div id="ismr-pos15" class="ism-pitch__unit ism-pitch__unit--3">
                                                <div>
                                                 <s:sport position="3" playerType="Forward"/>
                                                    <div class="ism-element" tabindex="0">

                                                        <div <c:choose><c:when test='${isPlayerAvail}'>class="ismjs-select added-player-css" id="${gameClubPlayerId}"</c:when><c:otherwise>class="ismjs-select"</c:otherwise></c:choose>>

                                                            <picture>
                                                                  <img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.png" alt="" title="Select a Forward" class="ism-shirt ism-element__shirt">
                                                            </picture>

                                                           
                                                             <c:choose>
                                                             <c:when test="${isPlayerAvail}">
                                                             	<div class="ism-element__name ism-element__name--placeholder">
                                                                ${playerName} <abbr title="Forward" class="ism-element__type"><span class="ism-element__type__short">${price}</span></abbr>
                                                             </div>
                                                             </c:when>
                                                             <c:otherwise>
                                                             <div class="ism-element__name ism-element__name--placeholder">
                                                                <abbr title="Forward" class="ism-element__type"><span class="ism-element__type__short">FWD</span></abbr>
                                                             </div>
                                                             </c:otherwise>
                                                             </c:choose>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </section>
                                <section id="ismr-detail" class="ism-detail" role="tabpanel" aria-hidden="true">
                                    <div tabindex="-1">
                                        <div>
                                            <div class="table">
                                                <table class="ism-table ism-table--el ism-table--squad">
                                                    <thead>
                                                        <tr class="ism-table__divider ism-el-type ism-el-type--1">
                                                            <th class="ism-table--squad__status"></th>
                                                            <th class="ism-table--squad__name">Goalkeeper</th>
                                                            <th class="ism-table--squad__price"><abbr title="Price in Coins">Coins</abbr></th>
                                                            <th class="ism-table--squad__tsb"><abbr title="Teams selected by %">SB</abbr></th>
                                                            <th class="ism-table--squad__pts-tot"><abbr title="Total points">TP</abbr></th>
                                                            <th class="ism-table--squad__fixture"><abbr title="Fixture next Gameweek">FIX</abbr></th>
                                                        </tr>
                                                    </thead>
                                                    </table>
                                                    <table class="ism-table ism-table--el ism-table--squad">
                                                    <tbody>
                                                        <tr>

                                                            <td></td>
                                                            <td colspan="5" class="ism-table--el__placeholder">
                                                                <a href="#" class="ismjs-select">Select Goalkeeper</a>
                                                            </td>

                                                        </tr>
                                                        <tr>

                                                            <td></td>
                                                            <td colspan="5" class="ism-table--el__placeholder">
                                                                <a href="#" class="ismjs-select">Select Goalkeeper</a>
                                                            </td>

                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="table">
                                                <table class="ism-table ism-table--el ism-table--squad">
                                                    <thead>
                                                        <tr class="ism-table__divider ism-el-type ism-el-type--2">
                                                            <th class="ism-table--squad__status"></th>
                                                            <th class="ism-table--squad__name">Defenders</th>
                                                            <th class="ism-table--squad__price"><abbr title="Price in Coins">Coins</abbr></th>
                                                            <th class="ism-table--squad__tsb"><abbr title="Teams selected by %">SB</abbr></th>
                                                            <th class="ism-table--squad__pts-tot"><abbr title="Total points">TP</abbr></th>
                                                            <th class="ism-table--squad__fixture"><abbr title="Fixture next Gameweek">FIX</abbr></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td></td>
                                                            <td colspan="5" class="ism-table--el__placeholder">
                                                                <a href="#" class="ismjs-select">Select Defender</a>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td colspan="5" class="ism-table--el__placeholder">
                                                                <a href="#" class="ismjs-select">Select Defender</a>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td></td>
                                                            <td colspan="5" class="ism-table--el__placeholder">
                                                                <a href="#" class="ismjs-select">Select Defender</a>
                                                            </td>
                                                        </tr>
                                                        <tr>

                                                            <td></td>
                                                            <td colspan="5" class="ism-table--el__placeholder">
                                                                <a href="#" class="ismjs-select">Select Defender</a>
                                                            </td>

                                                        </tr>
                                                        <tr>

                                                            <td></td>
                                                            <td colspan="5" class="ism-table--el__placeholder">
                                                                <a href="#" class="ismjs-select">Select Defender</a>
                                                            </td>

                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="table">
                                                <table class="ism-table ism-table--el ism-table--squad">
                                                    <thead>
                                                        <tr class="ism-table__divider ism-el-type ism-el-type--3">
                                                            <th class="ism-table--squad__status"></th>
                                                            <th class="ism-table--squad__name">Midfielders</th>
                                                            <th class="ism-table--squad__price"><abbr title="Price in Coins">Coins</abbr></th>
                                                            <th class="ism-table--squad__tsb"><abbr title="Teams selected by %">SB</abbr></th>
                                                            <th class="ism-table--squad__pts-tot"><abbr title="Total points">TP</abbr></th>
                                                            <th class="ism-table--squad__fixture"><abbr title="Fixture next Gameweek">FIX</abbr></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>

                                                            <td></td>
                                                            <td colspan="5" class="ism-table--el__placeholder">
                                                                <a href="#" class="ismjs-select">Select Midfielder</a>
                                                            </td>

                                                        </tr>
                                                        <tr>

                                                            <td></td>
                                                            <td colspan="5" class="ism-table--el__placeholder">
                                                                <a href="#" class="ismjs-select">Select Midfielder</a>
                                                            </td>

                                                        </tr>
                                                        <tr>

                                                            <td></td>
                                                            <td colspan="5" class="ism-table--el__placeholder">
                                                                <a href="#" class="ismjs-select">Select Midfielder</a>
                                                            </td>

                                                        </tr>
                                                        <tr>

                                                            <td></td>
                                                            <td colspan="5" class="ism-table--el__placeholder">
                                                                <a href="#" class="ismjs-select">Select Midfielder</a>
                                                            </td>

                                                        </tr>
                                                        <tr>

                                                            <td></td>
                                                            <td colspan="5" class="ism-table--el__placeholder">
                                                                <a href="#" class="ismjs-select">Select Midfielder</a>
                                                            </td>

                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="table">
                                                <table class="ism-table ism-table--el ism-table--squad">
                                                    <thead>
                                                        <tr class="ism-table__divider ism-el-type ism-el-type--4">
                                                            <th class="ism-table--squad__status"></th>
                                                            <th class="ism-table--squad__name">Forwards</th>
                                                            <th class="ism-table--squad__price"><abbr title="Price in Coins">Coins</abbr></th>
                                                            <th class="ism-table--squad__tsb"><abbr title="Teams selected by %">SB</abbr></th>
                                                            <th class="ism-table--squad__pts-tot"><abbr title="Total points">TP</abbr></th>
                                                            <th class="ism-table--squad__fixture"><abbr title="Fixture next Gameweek">FIX</abbr></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>

                                                            <td></td>
                                                            <td colspan="5" class="ism-table--el__placeholder">
                                                                <a href="#" class="ismjs-select">Select Forward</a>
                                                            </td>

                                                        </tr>
                                                        <tr>

                                                            <td></td>
                                                            <td colspan="5" class="ism-table--el__placeholder">
                                                                <a href="#" class="ismjs-select">Select Forward</a>
                                                            </td>

                                                        </tr>
                                                        <tr>

                                                            <td></td>
                                                            <td colspan="5" class="ism-table--el__placeholder">
                                                                <a href="#" class="ismjs-select">Select Forward</a>
                                                            </td>

                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                                
            
                                
                                
                            </div>

                            

                        </div>
                        
                    </section>

                    <!--<div id="ismr-fixtures-table"></div>
                    <div id="ismr-fixtures-matches"></div>-->
                </div>
                
                <div id="ismr-squad-menu"></div>
                <div id="ismr-help"></div>
                <div id="ismr-confirm"></div>
            </div>
        </div>

        <!-- Secondary content -->
        
        <div id="ismr-side" class="ism-sidebar">
            <div>
        <c:if test="${sessionScope.user.hasActivePlan}">
        <div class="remain_coin">Remaining Coins : <span id="planBalanceDiv">${sessionScope.user.activePlan.balance}</span></div>
        </c:if>
                <section class="ism-bordered ism-bordered--primary">

                    <div class="ism-section-header">
                        <h3 class="subHeader ism-sub-header ism-section-header__title" tabindex="0" id="ismjs-side-focus">Player Selection</h3>
                       
                    </div>

                    <div id="ismr-sideboard">
                        <div>

                            <div class="ism-deadline-bar ism-deadline-bar--side">

                                <h4 class="ism-deadline-bar__heading">Gameweek 1 Deadline:</h4>
                                <time datetime="2016-08-13T10:30:00Z" class="ism-deadline-bar__deadline">13 Aug 11:30</time>

                            </div>

                            <div class="ism-sideboard">
                                <div class="ism-scoreboard__panel">
                                    <h4 class="ism-scoreboard__panel__heading">Players Selected</h4>
                                    <div class="ism-scoreboard__panel__value is-error">0/15</div>
                                </div>
                                <div class="ism-scoreboard__panel">
                                    <h4 class="ism-scoreboard__panel__heading">Money Remaining</h4>
                                    <div class="ism-scoreboard__panel__value is-success">�100.0</div>
                                </div>
                            </div>

                        </div>
                    </div>

                    <form class="ism-form">
                        <div class="ism-form__group">
                            <label for="ismjs-element-filter" class="ism-form__label">View</label>
                            <div class="ism-form__select-wrap">
                                <select id="ismjs-element-filter" class="ism-form__select" data-global="Global" data-position="By Position" data-team="By Team">
                                    <optgroup label="Global">
                                        <option value="all">All players</option>
                                    </optgroup>
                                    <optgroup label="By Position">
                                        <option value="Goalkeepers">Goalkeepers</option>
                                        <option value="Defenders">Defenders</option>
                                        <option value="Forwards">Forwards</option>
                                        <option value="Midfielders">Midfielders</option>                                        
                                    </optgroup>
                                    <optgroup label="By Team">
                                    <c:forEach var="clubMap" items="${sessionScope.clubList}">
                                    	<option value="club_${clubMap['clubId']}">${clubMap['name']}</option>
                                    </c:forEach>
                                    </optgroup>
                                </select>
                            </div>
                        </div>
                        <%-- <div id="ismr-sort" class="ism-form__group">
                            <label for="ismjs-element-sort" class="ism-form__label">Sorted by</label>
                            <div class="ism-form__select-wrap">
                                <select id="ismjs-element-sort" class="ism-form__select">
                                    <option value="total_points">Total score</option>
                                    <option value="event_points">Round score</option>
                                    <option value="now_cost">Price</option>
                                </select>
                            </div>
                        </div> --%>
                        <div id="ismr-price" class="ism-form__group">
                            <div>
                                <label for="ismjs-element-price" class="ism-form__label">With a maximum price of</label>
                                <div class="ism-form__select-wrap">
                                    <select id="ismjs-element-price" class="ism-form__select">
                                        <option value="0">Unlimited</option>
                                        <c:forEach var="price" items="${priceList}" >
                                        <option value="${price}">${price}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div id="ismr-price" class="ism-form__group">
                            <div>
                                <label for="ismjs-element-price" class="ism-form__label">Sorted By</label>
                                <div class="ism-form__select-wrap">
                                    <select id="ismjs-element-price" class="ism-form__select" onchange="orderPlayerList(this.value);">
                                        <option <c:if test="${sessionScope.playersOrderBy eq 'price'}">selected</c:if>  value="price">Price</option>
                                        <option <c:if test="${sessionScope.playersOrderBy eq 'total_score'}">selected</c:if> value="total_score">Total Score</option>
                                        <option <c:if test="${sessionScope.playersOrderBy eq 'user_count'}">selected</c:if> value="user_count">Selected By %</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                       <!--  <div class="ism-search">
                            <label for="ismjs-element-search" class="ism-form__label">Search Player List</label>
                            <div class="searchInputContainer ism-search">
                                <input id="ismjs-element-search" class="searchInput ism-search__input" type="search" placeholder="Player name">

                                <div class="searchCommit">
                                    <div class="icn search-sm"></div>
                                </div>
                            </div>
                        </div> -->

                    </form>

                    <div id="ismr-sideboard"></div>
                    
                    <div id="ismr-elements-list"><div>

    <p class="ism-elements-shown"><strong class="ism-elements-shown__num">${fn:length(sessionScope.playerList)}</strong> players shown</p>

    <div id="ismjs-elements-list-tables"><div>
    <div class="table" id="Goalkeepers" >
        <table class="ism-table ism-table--el ism-table--el-list" style="margin-bottom: 0;">
            <thead>
                <tr class="ism-table__divider ism-el-type ism-el-type--1">
                    <th class="ism-table--el-list__status"></th>
                    <th class="ism-table--el-list__name"><a href="#" class="ism-link--bold">Goalkeepers</a></th>
                    <th class="ism-table--el-list__price"><abbr title="Price in Coins">Coins</abbr></th>
                    <c:choose>
                    <c:when test="${sessionScope.playersOrderBy eq 'user_count'}"><th class="ism-table--el-list__stat"><abbr title="Total Score">UC</abbr></c:when>
                    <c:otherwise><th class="ism-table--el-list__stat"><abbr title="Total Score">TS</abbr></th></c:otherwise>
                    </c:choose>
                </tr>
            </thead>
            </table>
            </div>
            <div class="table scroll-tbl" id="Goalkeepers" >
            <table class="ism-table ism-table--el ism-table--el-list">
            <tbody>
            <c:forEach var="playerMap" items="${sessionScope.playerList}">
            <c:if test="${playerMap.type eq 'Goalkeeper'}">
            <tr class="ismjs-menu ism-row-select" id="${playerMap.gameClubPlayerId}">
    <td class="ism-table--el__status text-center addPlayer">
        
            <a href="javascript:void(0);" onclick="addPlayer('${sessionScope.userId}','${playerMap.gameClubPlayerId}');"><i class="fa fa-plus" aria-hidden="true"></i></a>
        
    </td>
    <td class="ism-table--el__primary">
        <div class="ism-media ism-media--centred">
            <div class="ism-media__figure">
				<c:if test="${not empty playerMap.clubId and playerMap.clubId ne ''}">
					<c:set value="${clubImageMap[playerMap.clubId]}" var="imageSrc" />
				</c:if>	
              <!--  player list image -->              
                    <img src="/SportMgmt/images/gk_${imageSrc}" height="20" width="20" alt="Arsenal" title="${playerMap.name}" class="ism-shirt">
            </div>
            <div class="ism-media__body ism-table--el__primary-text">
                <a href="#" class="ism-table--el__name">${playerMap.name}</a>
                <span class="ism-table--el__strong"><a href="javascript:void(0);"   title="Add Player"></a></span>
            </div>
        </div>

    </td>
    <td class="ism-table--el__strong playerPrice">${playerMap.price}</td>
    <c:choose>
        <c:when test="${sessionScope.playersOrderBy eq 'user_count'}"><td class="ism-table--el__strong">${playerMap.userCount}</td></c:when>
        <c:otherwise><td class="ism-table--el__strong">${playerMap.totalScore}</td></c:otherwise>
    </c:choose>
</tr>
</c:if>
 </c:forEach>
</tbody>
        </table>
    </div>
	</div>
<div>
    <div class="table" id="Defenders">
        <table class="ism-table ism-table--el ism-table--el-list" style="margin-bottom: 0;">
            <thead>
                <tr class="ism-table__divider ism-el-type ism-el-type--2">
                    <th class="ism-table--el-list__status"></th>
                    <th class="ism-table--el-list__name"><a href="#" class="ism-link--bold">Defenders</a></th>
                    <th class="ism-table--el-list__price"><abbr title="Price in Coins">Coins</abbr></th>
                    <c:choose>
                    <c:when test="${sessionScope.playersOrderBy eq 'user_count'}"><th class="ism-table--el-list__stat"><abbr title="Total Score">UC</abbr></c:when>
                    <c:otherwise><th class="ism-table--el-list__stat"><abbr title="Total Score">TS</abbr></th></c:otherwise>
                    </c:choose>
                </tr>
            </thead>
            </table>
            </div>
            <div class="table scroll-tbl" id="Defenders">
        <table class="ism-table ism-table--el ism-table--el-list">
            <tbody>
            <c:forEach var="playerMap" items="${sessionScope.playerList}">
            <c:if test="${playerMap.type eq 'Defender'}">
            <tr class="ismjs-menu ism-row-select" id="${playerMap.gameClubPlayerId}">
    <td class="ism-table--el__status text-center addPlayer">
        
            <a href="javascript:void(0);" onclick="addPlayer('${sessionScope.userId}','${playerMap.gameClubPlayerId}');"><i class="fa fa-plus" aria-hidden="true"></i></a>
        
    </td>
    <td class="ism-table--el__primary">
        <div class="ism-media ism-media--centred">
            <div class="ism-media__figure">
				<c:if test="${not empty playerMap.clubId and playerMap.clubId ne ''}">
				<c:set value="${clubImageMap[playerMap.clubId]}" var="imageSrc" />
				</c:if>
               <img src="/SportMgmt/images/${imageSrc}" height="20" width="20" alt="Arsenal" title="${playerMap.name}" class="ism-shirt">
                
            </div>

            <div class="ism-media__body ism-table--el__primary-text">
                <a href="#" class="ism-table--el__name">${playerMap.name}</a>
                <span class="ism-table--el__strong"><a href="javascript:void(0);"  title="Add Player"></a></span>
            </div>
        </div>

    </td>
    <td class="ism-table--el__strong playerPrice">${playerMap.price}</td>
    <c:choose>
        <c:when test="${sessionScope.playersOrderBy eq 'user_count'}"><td class="ism-table--el__strong">${playerMap.userCount}</td></c:when>
        <c:otherwise><td class="ism-table--el__strong">${playerMap.totalScore}</td></c:otherwise>
    </c:choose>
</tr>
</c:if>
</c:forEach>
</tbody>
        </table>
    </div>
</div>
<div>
    <div class="table" id="Midfielders">
        <table class="ism-table ism-table--el ism-table--el-list" style="margin-bottom: 0">
            <thead>
                <tr class="ism-table__divider ism-el-type ism-el-type--3">
                    <th class="ism-table--el-list__status"></th>
                    <th class="ism-table--el-list__name"><a href="#" class="ism-link--bold">Midfielders</a></th>
                    <th class="ism-table--el-list__price"><abbr title="Price in Coins">Coins</abbr></th>
                    <c:choose>
                    <c:when test="${sessionScope.playersOrderBy eq 'user_count'}"><th class="ism-table--el-list__stat"><abbr title="Total Score">UC</abbr></c:when>
                    <c:otherwise><th class="ism-table--el-list__stat"><abbr title="Total Score">TS</abbr></th></c:otherwise>
                    </c:choose>
                </tr>
            </thead>
            </table>
            </div>
            <div class="table scroll-tbl" id="Midfielders">
        <table class="ism-table ism-table--el ism-table--el-list">
            <tbody>
            <c:forEach var="playerMap" items="${sessionScope.playerList}">
            <c:if test="${playerMap.type eq 'Midfielder'}">
            <tr class="ismjs-menu ism-row-select" id="${playerMap.gameClubPlayerId}">
    <td class="ism-table--el__status text-center addPlayer">
        
            <a href="javascript:void(0);" onclick="addPlayer('${sessionScope.userId}','${playerMap.gameClubPlayerId}');"><i class="fa fa-plus" aria-hidden="true"></i></a>
        
    </td>
    <td class="ism-table--el__primary">
        <div class="ism-media ism-media--centred">
            <div class="ism-media__figure">
				<c:if test="${not empty playerMap.clubId and playerMap.clubId ne ''}">
				<c:set value="${clubImageMap[playerMap.clubId]}" var="imageSrc" />
				</c:if>
               <img src="/SportMgmt/images/${imageSrc}" height="20" width="20" alt="Arsenal" title="${playerMap.name}" class="ism-shirt">
                
            </div>

            <div class="ism-media__body ism-table--el__primary-text">
                <a href="#" class="ism-table--el__name">${playerMap.name }</a>
                <span class="ism-table--el__strong"><a href="javascript:void(0);"  title="Add Player"></a></span>
            </div>
        </div>

    </td>
    <td class="ism-table--el__strong playerPrice">${playerMap.price}</td>
    <c:choose>
        <c:when test="${sessionScope.playersOrderBy eq 'user_count'}"><td class="ism-table--el__strong">${playerMap.userCount}</td></c:when>
        <c:otherwise><td class="ism-table--el__strong">${playerMap.totalScore}</td></c:otherwise>
    </c:choose>
</tr>
</c:if>
</c:forEach>
</tbody>
        </table>
    </div>
</div>
<div>
    <div class="table" id="Forwards" >
        <table class="ism-table ism-table--el ism-table--el-list" style="margin-bottom: 0">
            <thead> 
                <tr class="ism-table__divider ism-el-type ism-el-type--4">
                    <th class="ism-table--el-list__status"></th>
                    <th class="ism-table--el-list__name"><a href="#" class="ism-link--bold">Forwards</a></th>
                    <th class="ism-table--el-list__price"><abbr title="Price in Coins">Coins</abbr></th>
                    <c:choose>
                    <c:when test="${sessionScope.playersOrderBy eq 'user_count'}"><th class="ism-table--el-list__stat"><abbr title="Total Score">UC</abbr></c:when>
                    <c:otherwise><th class="ism-table--el-list__stat"><abbr title="Total Score">TS</abbr></th></c:otherwise>
                    </c:choose>
                </tr>
            </thead>
            </table>
            </div>
            <div class="table scroll-tbl" id="Forwards">
        <table class="ism-table ism-table--el ism-table--el-list">
            <tbody>
            <c:forEach var="playerMap" items="${sessionScope.playerList}">
            <c:if test="${playerMap.type eq 'Forward'}">
            <tr class="ismjs-menu ism-row-select ism-element-list__info--0" id="${playerMap.gameClubPlayerId}">
    <td class="ism-table--el__status text-center addPlayer">        
            <a href="javascript:void(0);"  onclick="addPlayer('${sessionScope.userId}','${playerMap.gameClubPlayerId}');" ><i class="fa fa-plus" aria-hidden="true"></i></a>
        
    </td>
    <td class="ism-table--el__primary">
        <div class="ism-media ism-media--centred">
            <div class="ism-media__figure">
            
               <c:if test="${not empty playerMap.clubId and playerMap.clubId ne ''}">
				<c:set value="${clubImageMap[playerMap.clubId]}" var="imageSrc" />
				</c:if>
               <img src="/SportMgmt/images/${imageSrc}" height="20" width="20" alt="Arsenal" title="${playerMap.name}" class="ism-shirt">
            </div>
            <div class="ism-media__body ism-table--el__primary-text">
                <a href="#" class="ism-table--el__name">${playerMap.name}</a>
                <span class="ism-table--el__strong"><a href="javascript:void(0);"   title="Add Player"></a></span>
            </div>
        </div>

    </td>
    <td class="ism-table--el__strong playerPrice">${playerMap.price }</td>
    <c:choose>
        <c:when test="${sessionScope.playersOrderBy eq 'user_count'}"><td class="ism-table--el__strong">${playerMap.userCount}</td></c:when>
        <c:otherwise><td class="ism-table--el__strong">${playerMap.totalScore}</td></c:otherwise>
    </c:choose>
</tr>
</c:if>
</c:forEach>
</tbody>
        </table>
    </div>
</div></div>

    

</div></div>
                </section>

            </div>
        </div>
    <%-- <script src="/SportMgmt/js/vendor/jquery.js"></script> --%>
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
   var purchableWildCardJson = null;
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
	<c:if test="${not empty sessionScope.purchableWildCardJson}">
  	<script type="text/javascript">
  	purchableWildCardJson = ${sessionScope.purchableWildCardJson};
  	var planDiscountId = '${sessionScope.planDiscountId}';
		</script>
	</c:if>
	<script type="text/javascript">
	
	function aa(){
		var elems2 = '<div class="ismjs-select">'+
	     '<picture>'+
	     '<img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.png" alt="" title="Select a Goalkeeper" class="ism-shirt ism-element__shirt">'+
	     '</picture>'+
	     '<div class="ism-element__name ism-element__name--placeholder"> <abbr title="Goalkeeper" class="ism-element__type"><span class="ism-element__type__short">GKP</span></abbr></div>';
	     
	     $('.ism-element-row.ism-element-row--pitch:first-child .ismjs-remove').click(function () {
	    	 var userId = $(this).parents('.ism-element').find('.ismjs-menu').attr('id').split('_')[0];
	    	 var gameClubPlayerId = $(this).parents('.ism-element').find('.ismjs-menu').attr('id').split('_')[1];
	    	 removePlayer(userId,gameClubPlayerId,this,elems2);
	    	 return false;
	    })
	};
	
	
	function defenderRemove(){
		var def2 = '<div class="ismjs-select">'+
	     '<picture>'+
	    '<img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.png"  alt="" title="Select a Defender" class="ism-shirt ism-element__shirt">'+
	     '</picture>'+
	     '<div class="ism-element__name ism-element__name--placeholder"> <abbr title="Defender" class="ism-element__type"><span class="ism-element__type__short">DEF</span></abbr></div>';
	     
	     
	     
	     $('.ism-element-row.ism-element-row--pitch:nth-child(2) .ismjs-remove').click(function () {
	    	 var userId = $(this).parents('.ism-element').find('.ismjs-menu').attr('id').split('_')[0];
	    	 var gameClubPlayerId = $(this).parents('.ism-element').find('.ismjs-menu').attr('id').split('_')[1];
	    	 removePlayer(userId,gameClubPlayerId,this,def2);
	    	 return false;
	    })
	};
	
	
	function midfielderRemove(){
		var midd2 = '<div class="ismjs-select">'+
	     '<picture>'+
	     '<img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.png" alt="" title="Select a Defender" class="ism-shirt ism-element__shirt">'+
	     '</picture>'+
	     '<div class="ism-element__name ism-element__name--placeholder"> <abbr title="Midfielder" class="ism-element__type"><span class="ism-element__type__short">MID</span></abbr></div>';
	    
	     
	     
	     $('.ism-element-row.ism-element-row--pitch:nth-child(3) .ismjs-remove').click(function () {
	    	 var userId = $(this).parents('.ism-element').find('.ismjs-menu').attr('id').split('_')[0];
	    	 var gameClubPlayerId = $(this).parents('.ism-element').find('.ismjs-menu').attr('id').split('_')[1];
	    	 removePlayer(userId,gameClubPlayerId,this,midd2);
	    	 return false;
	    })
	};
	
	function forwardRemove(){
		var for2 = '<div class="ismjs-select">'+
	     '<picture>'+
	    '<img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.png" alt="" title="Select a Defender" class="ism-shirt ism-element__shirt">'+
	     '</picture>'+
	     '<div class="ism-element__name ism-element__name--placeholder"> <abbr title="Forward" class="ism-element__type"><span class="ism-element__type__short">FWD</span></abbr></div>';
	    
	     
	     
	     $('.ism-element-row.ism-element-row--pitch:nth-child(4) .ismjs-remove').click(function () {
	    	 var userId = $(this).parents('.ism-element').find('.ismjs-menu').attr('id').split('_')[0];
	    	 var gameClubPlayerId = $(this).parents('.ism-element').find('.ismjs-menu').attr('id').split('_')[1];
	    	 removePlayer(userId,gameClubPlayerId,this,for2);
	    	 return false;
	    })
	};
	
	<c:if test="${!isUnderDeadline}">
			$('.ism-element').mousemove(function(){
			
			aa();		
			defenderRemove();
			midfielderRemove();
			forwardRemove();
		})

	</c:if>
	
	$(document).ready(function() {
		$("div.ismjs-select.added-player-css").each(function(){
			var gameClubPlayerId = $(this).attr('id');
			console.info('gameClubPlayerId: '+gameClubPlayerId);
			var playerClubId = "";
			var playerType = "";
			var playerPrice = "";
			var playerName = "";
			var userId = "${sessionScope.userId}";
			if(typeof playerListJson != 'undefined')
			{
				for(var playerListIndex = 0; playerListIndex < playerListJson.length; playerListIndex++)
				{
				  if(playerListJson[playerListIndex].gameClubPlayerId == gameClubPlayerId)
					{
					  playerClubId =   playerListJson[playerListIndex].clubId;
					  playerType =   playerListJson[playerListIndex].type;
					  playerPrice =   playerListJson[playerListIndex].price;
					  playerName =   playerListJson[playerListIndex].name;
					}
					  
				}
			}
			console.info('playerClubId--: '+playerClubId);
			//playerClubId=playerClubId+"_gk";
			var clubImage = clubIdImageMap[playerClubId];
			console.info('clubImage--: '+clubImage);
			/*if(typeof clubImage != 'undefined' && clubImage !='')
			{
				$(this).find('picture img').attr('src','/SportMgmt/images/'+clubImage);
			}
			*/
			if(playerType == 'Goalkeeper')
			 {
				$("#Goalkeepers .addPlayer>a").closest('tr').attr('disabled', 'disabled');

				var elems = '<div class="ismjs-menu" id="'+userId+'_'+gameClubPlayerId+'">'+
		        /*'<picture>'+
		        '<source type="image/webp" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_90_1-110.webp 110w,https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_90_1-66.webp 66w,https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_90_1-33.webp 33w" sizes="(min-width: 1024px) 55px, (min-width: 610px) 44px, 33px" >'+
		        '<img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_90_1-33.png" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_90_1-110.png 110w,https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_90_1-66.png 66w,https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_90_1-33.png 33w" sizes="(min-width: 1024px) 55px,(min-width: 610px) 44px,33px" alt="Burnley" title="Burnley" class="ism-shirt ism-element__shirt">'+
		        '</picture>'+*/
		       '<picture>'+
		        '<img src="/SportMgmt/images/gk_'+clubImage+'" alt="" title="" class="ism-shirt ism-element__shirt">'+
		        '</picture>'+
		        '<div class="ism-element__name">'+playerName+'</div>'+
		        '<div class="ism-element__data">'+playerPrice+'</div>'+
		        '<div class="ism-element__controls">'+
		        '<div  class="ismjs-remove ism-element__control ism-element__control--primary"><a href="#" title="Remove player" class="ism-element__link removePlayerIcon rr">X</a></div></div>';
		        
		       
		        $('.ism-element-row.ism-element-row--pitch:first-child').find('.ismjs-select').first().replaceWith(elems); 
			 }
			 if(playerType == 'Midfielder')
			 {
				$('#Midfielders .addPlayer>a').closest('tr').attr('disabled', 'disabled');
				
				var midfielder = '<div class="ismjs-menu" id="'+userId+'_'+gameClubPlayerId+'">'+
		        /*'<picture>'+
		        '<source type="image/webp" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_57-110.webp 110w,https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_57-66.webp 66w,https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_57-33.webp 33w" sizes="(min-width: 1024px) 55px,(min-width: 610px) 44px,33px">'+
		        '<img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_57-33.png" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_57-110.webp 110w,https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_57-66.webp 66w,https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_57-33.webp 33w" sizes="(min-width: 1024px) 55px,(min-width: 610px) 44px,33px" alt="Sunderland" title="Sunderland" class="ism-shirt ism-element__shirt">'+
		        '</picture>'+*/
		       '<picture>'+
		        '<img src="/SportMgmt/images/'+clubImage+'" alt="'+playerName+'" title="'+playerName+'" class="ism-shirt ism-element__shirt">'+
		        '</picture>'+
		       
		        '<div class="ism-element__name">'+playerName+'</div>'+
		        '<div class="ism-element__data">'+playerPrice+'</div>'+
		        '<div class="ism-element__controls">'+
		        '<div  class="ismjs-remove ism-element__control ism-element__control--primary"><a href="#" title="Remove player" class="ism-element__link removePlayerIcon rr">X</a></div></div>';
		        
		        $('.ism-element-row.ism-element-row--pitch:nth-child(3)').find('.ismjs-select').first().replaceWith( midfielder );
			 }
			 if(playerType == 'Defender')
			 {
				$('#Defenders .addPlayer>a').closest('tr').attr('disabled', 'disabled');
				
				var defender = '<div class="ismjs-menu" id="'+userId+'_'+gameClubPlayerId+'">'+
		        /*'<picture>'+
		        '<source type="image/webp" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_56-110.webp 110w,https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_56-66.webp 66w,https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_56-33.webp 33w" sizes="(min-width: 1024px) 55px,min-width: 610px) 44px,33px" >'+
		        '<img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_56-33.png" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_56-110.png 110w,https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_56-66.png 66w,https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_56-33.png 33w" sizes="(min-width: 1024px) 55px,(min-width: 610px) 44px,33px" alt="Sunderland" title="Sunderland" class="ism-shirt ism-element__shirt">'+
		        '</picture>'+*/
		       '<picture>'+
		        '<img src="/SportMgmt/images/'+clubImage+'"  alt="'+playerName+'" title="'+playerName+'" class="ism-shirt ism-element__shirt">'+
		        '</picture>'+
		        '<div class="ism-element__name">'+playerName+'</div>'+
		        '<div class="ism-element__data">'+playerPrice+'</div>'+
		        '<div class="ism-element__controls">'+
		        '<div  class="ismjs-remove ism-element__control ism-element__control--primary"><a href="#" title="Remove player" class="ism-element__link removePlayerIcon rr">X</a></div></div>';
		        
		        $('.ism-element-row.ism-element-row--pitch:nth-child(2)').find('.ismjs-select').first().replaceWith( defender );
		       
			 }
			 if(playerType == 'Forward')
			 {
				$('#Forwards .addPlayer>a').closest('tr').attr('disabled', 'disabled');
				
				var forward = '<div class="ismjs-menu" id="'+userId+'_'+gameClubPlayerId+'">'+
		       /* '<picture>'+
		        '<source type="image/webp" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_1-110.webp 110w,https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_1-66.webp 66w,https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_1-33.webp 33w" sizes="(min-width: 1024px) 55px,(min-width: 610px) 44px,33px">'+
		        '<img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_1-33.png" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_1-110.png 110w,https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_1-66.png 66w,https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_1-33.png 33w" sizes="(min-width: 1024px) 55px,(min-width: 610px) 44px,33px" alt="Man Utd" title="Man Utd" class="ism-shirt ism-element__shirt">'+
		        '</picture>'+*/
		       '<picture>'+
		        '<img src="/SportMgmt/images/'+clubImage+'" title="'+playerName+'" class="ism-shirt ism-element__shirt">'+
		        '</picture>'+
		        '<div class="ism-element__name">'+playerName+'</div>'+
		        '<div class="ism-element__data">'+playerPrice+'</div>'+
		        '<div class="ism-element__controls">'+
		        '<div  class="ismjs-remove ism-element__control ism-element__control--primary"><a href="#" title="Remove player" class="ism-element__link removePlayerIcon rr">X</a></div></div>';
		       
		       	        
		        $('.ism-element-row.ism-element-row--pitch:nth-child(4)').find('.ismjs-select').first().replaceWith( forward );
			 }

		});
		
		$("#paymentModel").find("button").click(function(){
			var planId =  $(this).attr("id").split("_")[1];
			console.log("Plan Id: "+planId);
			//var paymentForm = $("#paymentForm_"+planId);
			var paymentForm = document.createElement("form");
		    var plan = document.createElement("input"); 
		    var discount = document.createElement("input");
		    var amount = document.createElement("input");
		
		    paymentForm.method = "POST";
		    paymentForm.action = "/SportMgmt/mvc/payment/MakePayment";   
		
		    plan.value=planId;
		    plan.name="leaguePlanId";
		    paymentForm.appendChild(plan);  
		
		    discount.value=planDiscountId;
		    discount.name="planDiscountId";
		    paymentForm.appendChild(discount);
		    amount.name = "amount";
		    if(purchableWildCardJson != null && typeof purchableWildCardJson != 'undefined')
		    {
		    	console.log("Going ot iterate purchableWildCardJson");
		    	for(var i = 0;i<purchableWildCardJson.length;i++)
			    {
			    	console.log("iterating purchableWildCardJson: planId: "+purchableWildCardJson[i].planId);
			    	if(purchableWildCardJson[i].planId == planId)
			    	{
			    		console.log("gettting amount :: "+purchableWildCardJson[i].amount);
			    		amount.value = purchableWildCardJson[i].price;
			    		paymentForm.appendChild(amount);  
			    		document.body.appendChild(paymentForm);
			 			paymentForm.submit();
			    	}
			    }
		    }
		    
			//console.log("paymentForm: input length "+paymentForm.elements.length);
			//console.log("amount Object: "+paymentForm.elements['amount']);
		});
	});
	 $('#ismjs-element-filter').change(function(){
	  var selected = $(':selected',this); 
	  filterByView(selected);
	  
   });
 $('#ismjs-element-price').change(function(){
	 console.info("---- filter by price");
	  var filterByViewSelected = $(':selected',$('#ismjs-element-filter')); 
	  filterByView(filterByViewSelected);
	  var selected = $(':selected',this);
	  var seletedPrice = selected.attr("value");
	  console.info("---- filter by price selected value: "+seletedPrice);
	  if(seletedPrice != null && seletedPrice != 'undefined' && seletedPrice !='0')
	  {
		  $("tr.ismjs-menu.ism-row-select:visible").each(function()
					{
						var gameClubPlayerId = $(this).attr('id');
						var playerPrice = 0;
						if(typeof playerListJson != 'undefined')
						{
							for(var playerListIndex = 0; playerListIndex < playerListJson.length; playerListIndex++)
							{
							  if(playerListJson[playerListIndex].gameClubPlayerId == gameClubPlayerId)
								{
								  playerPrice =   playerListJson[playerListIndex].price;
								}
								  
							}
						}
						if(parseInt(seletedPrice) !=playerPrice)
						{
							 $(this).hide();
						}
						
					});
	  }
	$("p.ism-elements-shown strong.ism-elements-shown__num").text($("tr.ismjs-menu.ism-row-select:visible").length);
  });

 function filterByView(selected)
 {
	 console.info("---- filter by View");	
	 console.info(selected.closest('optgroup').attr('label'));
	  $("tr.ismjs-menu.ism-row-select").each(function()
		{
			$(this).show();
		});
	  $("div#ismjs-elements-list-tables").find("div.table").each(function(){
			 // console.info(" table Id: "+$(this).attr('id'));
			 $(this).show();
		})
	  if(typeof selected.closest('optgroup').attr('label') != 'undefined' && selected.closest('optgroup').attr('label') == 'By Position')
		{
		  var playerGroup = selected.attr("value");
		  console.info("--- Selected Position: "+playerGroup);
		  $("div#ismjs-elements-list-tables").find("div.table").each(function(){
			  console.info(" table Id: "+$(this).attr('id'));
			  if(typeof $(this).attr('id') != 'undefined' && $(this).attr('id')!== playerGroup)
			  {
				  $(this).hide();
			  }
		 })
		}
	  else if(typeof selected.closest('optgroup').attr('label') != 'undefined' && selected.closest('optgroup').attr('label') == 'By Team')
		{
		  var selectedClub = selected.attr("value");
		  console.info("--- Selected Club: "+selectedClub);
		  $("tr.ismjs-menu.ism-row-select").each(function()
			{
				var gameClubPlayerId = $(this).attr('id');
				var selectedClub = selected.attr("value");
				var playerClubId = "";
				if(typeof playerListJson != 'undefined')
				{
					for(var playerListIndex = 0; playerListIndex < playerListJson.length; playerListIndex++)
					{
					  if(playerListJson[playerListIndex].gameClubPlayerId == gameClubPlayerId)
						{
						  playerClubId =   playerListJson[playerListIndex].clubId;
						}
						  
					}
				}
				if(selectedClub.split('_')[1] !=playerClubId)
				{
					 $(this).hide();
				}
				
			});
		}
	  $("p.ism-elements-shown strong.ism-elements-shown__num").text($("tr.ismjs-menu.ism-row-select:visible").length);
 }
     function addPlayer(userId, gameClubPlayerId)
     {
     	<c:choose>
     	<c:when test="${isUnderDeadline}">
     	alert("You r under deadline");
     	</c:when>
     	<c:when test="${not sessionScope.user.hasActivePlan}">
     	alert("You don't have any plan active");
     	</c:when>
     	<c:otherwise>
     	
    	 var playerType = '';
    	 var playerName = '';
    	 var playerPrice = '';
    	 var clubId = '';
			if(typeof playerListJson != 'undefined')
			{
				for(var playerListIndex = 0; playerListIndex < playerListJson.length; playerListIndex++)
				{
				  if(playerListJson[playerListIndex].gameClubPlayerId == gameClubPlayerId)
					{
					  playerType =   playerListJson[playerListIndex].type;
					  playerName = playerListJson[playerListIndex].name;
					  playerPrice = playerListJson[playerListIndex].price;
					  clubId = playerListJson[playerListIndex].clubId;
					}
					  
				}
			}
		console.info("--- Player Type "+playerType);
		var ajaxCall = true;
		var avialBalance = parseInt($('#planBalanceDiv').text());
		var planTypeVal =  '${sessionScope.user.activePlan.planTypeVal}'; /* Denoted plan is of unlimitted value (Days wise or price wise)*/
		console.log('planTypeVal: '+planTypeVal+' , avialBalance: '+avialBalance);
		var planTypeVal =  '${sessionScope.user.activePlan.planTypeVal}';
		var hasActivePlan = '${sessionScope.user.hasActivePlan}';
		if(playerType == '')
		{
			ajaxCall = false;
		}
		else if(planTypeVal == 0 && avialBalance < playerPrice)
		{
			alert("Bank Account is less than player price");
			ajaxCall = false;
		}
		else if (playerType == 'Goalkeeper')
		{
			if(typeof userGameJson != null && typeof userGameJson != 'undefined' && typeof userGameJson['total'] !='undefined')
			{
				if(userGameJson['total']['Goalkeeper'] >=2)
				{
					ajaxCall = false;
					alert("You can add maximum 2 GoalKeepers. Please Remove any one first ");
				}
			}
		}
		else if (playerType == 'Midfielder')
		{
			if(typeof userGameJson != null && typeof userGameJson != 'undefined' && typeof userGameJson['total'] !='undefined')
			{
				if(userGameJson['total']['Midfielder'] >=5)
				{
					ajaxCall = false;
					alert("You can add maximum 5 Midfielders. Please Remove any one first ");
				}
			}
		}
		else if (playerType == 'Forward')
		{
			if(typeof userGameJson != null && typeof userGameJson != 'undefined' && typeof userGameJson['total'] !='undefined')
			{
				if(userGameJson['total']['Forward'] >=3)
				{
					ajaxCall = false;
					alert("You can add maximum 5 Forwards. Please Remove any one first ");
				}
			}
		}
		else if (playerType == 'Defender')
		{
			if(typeof userGameJson != null && typeof userGameJson != 'undefined' && typeof userGameJson['total'] !='undefined')
			{
				if(userGameJson['total']['Defender'] >=5)
				{
					ajaxCall = false;
					alert("You can add maximum 5 Defenders. Please Remove any one first ");
				}
			}
		}
		console.info("--- Ajax Call: "+ajaxCall);
		if(ajaxCall)
		{
			var url = "/SportMgmt/mvc/game/AddPlayer?userId="+userId+"&gameClubPlayerId="+gameClubPlayerId;
	     	$.ajax({
	     		  url: url,
	     		  dataType: 'json',
	     		  success: function( resp ) {
	     			  if(resp.isSuccess)
	     			  {
	     				 userGameJson = resp.userGameJson; 
	     				 var clubImage = clubIdImageMap[clubId];
	     				 if(typeof $('#planBalanceDiv') != 'undefined')
	     			 	 {
	     					$('#planBalanceDiv').text(resp.activePlanBalance); 
	     				 }
	     				 if(playerType == 'Goalkeeper')
	     				 {
	     					$("#Goalkeepers .addPlayer>a").closest('tr').attr('disabled', 'disabled');

	     					var elems = '<div class="ismjs-menu" id="'+userId+'_'+gameClubPlayerId+'">'+
	     			        /*'<picture>'+
	     			        '<source type="image/webp" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_90_1-110.webp 110w,https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_90_1-66.webp 66w,https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_90_1-33.webp 33w" sizes="(min-width: 1024px) 55px, (min-width: 610px) 44px, 33px" >'+
	     			        '<img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_90_1-33.png" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_90_1-110.png 110w,https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_90_1-66.png 66w,https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_90_1-33.png 33w" sizes="(min-width: 1024px) 55px,(min-width: 610px) 44px,33px" alt="Burnley" title="Burnley" class="ism-shirt ism-element__shirt">'+
	     			        '</picture>'+*/
	     			       '<picture>'+
	     			        '<img src="/SportMgmt/images/gk_'+clubImage+'" alt="'+playerName+'" title="'+playerName+'" class="ism-shirt ism-element__shirt">'+
	     			        '</picture>'+
	     			        '<div class="ism-element__name">'+playerName+'</div>'+
	     			        '<div class="ism-element__data">'+playerPrice+'</div>'+
	     			        '<div class="ism-element__controls">'+
	     			        '<div  class="ismjs-remove ism-element__control ism-element__control--primary"><a href="#" title="Remove player" class="ism-element__link removePlayerIcon rr">X</a></div></div>';
	     			        
	     			       
	     			        $('.ism-element-row.ism-element-row--pitch:first-child').find('.ismjs-select').first().replaceWith( elems ); 
	     				 }
	     				 if(playerType == 'Midfielder')
     					 {
	     					$('#Midfielders .addPlayer>a').closest('tr').attr('disabled', 'disabled');
	     					
	     					var midfielder = '<div class="ismjs-menu" id="'+userId+'_'+gameClubPlayerId+'">'+
	     			        /*'<picture>'+
	     			        '<source type="image/webp" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_57-110.webp 110w,https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_57-66.webp 66w,https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_57-33.webp 33w" sizes="(min-width: 1024px) 55px,(min-width: 610px) 44px,33px">'+
	     			        '<img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_57-33.png" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_57-110.webp 110w,https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_57-66.webp 66w,https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_57-33.webp 33w" sizes="(min-width: 1024px) 55px,(min-width: 610px) 44px,33px" alt="Sunderland" title="Sunderland" class="ism-shirt ism-element__shirt">'+
	     			        '</picture>'+*/
	     			       '<picture>'+
	     			        '<img src="/SportMgmt/images/'+clubImage+'" alt="'+playerName+'" title="'+playerName+'" class="ism-shirt ism-element__shirt">'+
	     			        '</picture>'+
	     			       
	     			        '<div class="ism-element__name">'+playerName+'</div>'+
	     			        '<div class="ism-element__data">'+playerPrice+'</div>'+
	     			        '<div class="ism-element__controls">'+
	     			        '<div  class="ismjs-remove ism-element__control ism-element__control--primary"><a href="#" title="Remove player" class="ism-element__link removePlayerIcon rr">X</a></div></div>';
	     			        
	     			        $('.ism-element-row.ism-element-row--pitch:nth-child(3)').find('.ismjs-select').first().replaceWith( midfielder );
     					 }
	     				 if(playerType == 'Defender')
     					 {
	     					$('#Defenders .addPlayer>a').closest('tr').attr('disabled', 'disabled');
	     					
	     					var defender = '<div class="ismjs-menu" id="'+userId+'_'+gameClubPlayerId+'">'+
	     			        /*'<picture>'+
	     			        '<source type="image/webp" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_56-110.webp 110w,https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_56-66.webp 66w,https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_56-33.webp 33w" sizes="(min-width: 1024px) 55px,min-width: 610px) 44px,33px" >'+
	     			        '<img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_56-33.png" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_56-110.png 110w,https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_56-66.png 66w,https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_56-33.png 33w" sizes="(min-width: 1024px) 55px,(min-width: 610px) 44px,33px" alt="Sunderland" title="Sunderland" class="ism-shirt ism-element__shirt">'+
	     			        '</picture>'+*/
	     			       '<picture>'+
	     			        '<img src="/SportMgmt/images/'+clubImage+'" alt="'+playerName+'" title="'+playerName+'" class="ism-shirt ism-element__shirt">'+
	     			        '</picture>'+
	     			        '<div class="ism-element__name">'+playerName+'</div>'+
	     			        '<div class="ism-element__data">'+playerPrice+'</div>'+
	     			        '<div class="ism-element__controls">'+
	     			        '<div  class="ismjs-remove ism-element__control ism-element__control--primary"><a href="#" title="Remove player" class="ism-element__link removePlayerIcon rr">X</a></div></div>';
	     			        
	     			        $('.ism-element-row.ism-element-row--pitch:nth-child(2)').find('.ismjs-select').first().replaceWith( defender );
	     			       
     					 }
	     				 if(playerType == 'Forward')
     					 {
	     					$('#Forwards .addPlayer>a').closest('tr').attr('disabled', 'disabled');
	     					
	     					var forward = '<div class="ismjs-menu" id="'+userId+'_'+gameClubPlayerId+'">'+
	     			       /* '<picture>'+
	     			        '<source type="image/webp" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_1-110.webp 110w,https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_1-66.webp 66w,https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_1-33.webp 33w" sizes="(min-width: 1024px) 55px,(min-width: 610px) 44px,33px">'+
	     			        '<img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_1-33.png" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_1-110.png 110w,https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_1-66.png 66w,https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_1-33.png 33w" sizes="(min-width: 1024px) 55px,(min-width: 610px) 44px,33px" alt="Man Utd" title="Man Utd" class="ism-shirt ism-element__shirt">'+
	     			        '</picture>'+*/
	     			       '<picture>'+
	     			        '<img src="/SportMgmt/images/'+clubImage+'" alt="'+playerName+'" title="'+playerName+'" class="ism-shirt ism-element__shirt">'+
	     			        '</picture>'+
	     			        '<div class="ism-element__name">'+playerName+'</div>'+
	     			        '<div class="ism-element__data">'+playerPrice+'</div>'+
	     			        '<div class="ism-element__controls">'+
	     			        '<div  class="ismjs-remove ism-element__control ism-element__control--primary"><a href="#" title="Remove player" class="ism-element__link removePlayerIcon rr">X</a></div></div>';
	     			       
	     			       	        
	     			        $('.ism-element-row.ism-element-row--pitch:nth-child(4)').find('.ismjs-select').first().replaceWith( forward );
     					 }
	     			  }
	     			  else
	    			  {
	    				  	alert(resp.errorMessage);
	    			  }
	     		  },
	     		  error: function( req, status, err ) {
	     		    console.log( 'something went wrong', status, err );
	     		  }
	     		});

		}
		</c:otherwise>
		</c:choose>
     }
     function removePlayer(userId, gameClubPlayerId,elems1,elems2)
     {
    	
		var isPlayerPlaying = false;
		for(var i=0;i<userGameJson.playerList.length ;i++)
		{
			if(userGameJson.playerList[i].gameClubPlayerId == gameClubPlayerId)
			{
				isPlayerPlaying = true;
				break;
			}
		}
    	if(isPlayerPlaying)
   		{
    		var url = "/SportMgmt/mvc/game/RemovePlayer?userId="+userId+"&gameClubPlayerId="+gameClubPlayerId;
	     	$.ajax({
	     		  url: url,
	     		  dataType: 'json',
	     		  async: false,
	     		  success: function( resp ) {
	     			  if(resp.isSuccess)
	     			  {
	     				 userGameJson = resp.userGameJson;
	     				if(typeof $('#planBalanceDiv') != 'undefined')
	     			 	 {
	     					$('#planBalanceDiv').text(resp.activePlanBalance); 
	     				 }
	     				$(elems1).parents('.ism-element').find('.ismjs-menu').replaceWith( elems2 );
	     			  }
	     			  else
	    			  {
	    				  	alert(resp.errorMessage);
	    			  }
	     		  },
	     		  error: function( req, status, err ) {
	     		    console.log( 'something went wrong', status, err );
	     		  }
	     		});
   		}
		
     }
     $(document).ajaxStart(function(){
  		$("#ajaxloader").css("display", "block");
  		$('.mask').show();
  	});

  	$(document).ajaxComplete(function(){
  	    $("#ajaxloader").css("display", "none");
  	    $('.mask').hide();
  	});

  </script>
<script src="/SportMgmt/js/bootstrap.min.js"></script>