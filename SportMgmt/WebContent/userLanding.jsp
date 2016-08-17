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
	<%@ taglib uri="WEB-INF/sportmgmt.tld" prefix="s" %>  
    <link rel="stylesheet" href="/SportMgmt/css/foundation.css">
    <link rel="stylesheet" href="/SportMgmt/css/app.css">
    <link rel="stylesheet" href="/SportMgmt/css/superslides.css">
    <link rel="stylesheet" type="text/css" href="/SportMgmt/css/customMedia.css">
   <!-- <link rel="stylesheet" href="https://ismdj.scdn5.secure.raxcdn.com/static/CACHE/css/258578334140.css" type="text/css" />-->
    <link rel="stylesheet" type="text/css" href="/SportMgmt/css/258578334140.css">
    <style>
    
    /*  home  page */
.ism-game-header h1 a{ color:#fff;}
</style>
</head> 
 <body>
 <main id="mainContent" tabindex="0" class="ism">
    <div class="ism-header">
        <div class="wrapper">
            <div class="ism-game-header-wrap">
                <div class="ism-game-header">
                    <h1>
                    	<a href="/a/">THE 12TH MAN LEAGUE</a>
                    </h1>                    
                </div>
                <nav role="navigation" class="ism-nav ismjs-priority-nav ismjs-nav priority-nav" instance="0">

                    <ul class="ism-nav__list ismjs-main-nav">                        

                        <li class="ism-nav__list__item">
                            <a href="/a/squad/selection" class="ism-nav__tab is-active" data-nav-tab="squad">Squad Selection</a>
                        </li>

                        <li class="ism-nav__list__item">
                            <a href="#" class="ism-nav__tab">Sign Out</a>
                        </li>

                    </ul>
                    <span class="ism-nav__dropdown-wrapper priority-nav__wrapper" aria-haspopup="false"><button aria-controls="menu" type="button" class="ism-nav__dropdown-toggle priority-nav__dropdown-toggle priority-nav-is-hidden">More</button><ul aria-hidden="true" class="ism-nav__dropdown priority-nav__dropdown"></ul></span>

                </nav>
            </div>
        </div>
    </div>
    <div class="ism-container">
        <div class="ism-pusher ismjs-page-transition">
            <!-- Primary content -->
            <div id="ismr-main" class="ism-main">
                <div>

                    <div id="ismr-scoreboard">
                        <div>
                        <div class="ism-copy">
                                <p>Select a maximum of 3 players from a single team or 'Auto Pick' if you're short of time.</p>
                         </div>

                            <!-- Scoreboard -->
                            <div class="ism-scoreboard">

                            </div>

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
                                <ul class="ism-toggle-tabs__list ism-toggle-tabs__list--light-b" role="tablist">
                                    <li class="ism-toggle-tabs__item" role="presentation">
                                        <a href="#ismr-summary" class="ism-toggle-tabs__tab" role="tab" tabindex="0" aria-controls="ismr-summary" aria-selected="true">Pitch View</a>
                                    </li>
                                    <li class="ism-toggle-tabs__item" role="presentation">
                                        <a href="#ismr-detail" class="ism-toggle-tabs__tab" role="tab" tabindex="-1" aria-controls="ismr-detail">List View</a>
                                    </li>
                                </ul>

                                <section id="ismr-summary" class="ism-pitch" role="tabpanel">
                                    <div tabindex="0">

                                        <div class="ism-element-row ism-element-row--pitch">
                                            <div class="ism-pitch__unit ism-pitch__unit--4"></div>
                                            <div id="ismr-pos1" class="ism-pitch__unit ism-pitch__unit--4">
                                                <div>
                                                    <div class="ism-element" tabindex="0">

                                                        <div class="ismjs-select">

                                                            <picture>
                                                                <source type="/SportMgmt/js/webp" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0_1-110.webp 110w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0_1-66.webp 66w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0_1-33.webp 33w" sizes="(min-width: 1024px) 55px,
                               (min-width: 610px) 44px,
                                33px">
                                                                <img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0_1-33.png" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0_1-110.png 110w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0_1-66.png 66w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0_1-33.png 33w" sizes="(min-width: 1024px) 55px,
                               (min-width: 610px) 44px,
                                33px" alt="" title="Click to select a Goalkeeper" class="ism-shirt ism-element__shirt">
                                                            </picture>
															<s:sport position="1" playerType="Goalkeeper"/>
                                                             <c:choose>
                                                             <c:when test="${isPlayerAvail}">
                                                             	<div class="ism-element__name ism-element__name--placeholder">
                                                                ${playerName} <abbr title="Goalkeeper" class="ism-element__type"><span class="ism-element__type__short">${price}</span></abbr>
                                                             </div>
                                                             </c:when>
                                                             <c:otherwise>
                                                             <div class="ism-element__name ism-element__name--placeholder">
                                                                Add <abbr title="Goalkeeper" class="ism-element__type"><span class="ism-element__type__short">GKP</span></abbr>
                                                             </div>
                                                             </c:otherwise>
                                                             </c:choose>
                                                            
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <div id="ismr-pos2" class="ism-pitch__unit ism-pitch__unit--4">
                                                <div>
                                                    <div class="ism-element" tabindex="0">

                                                        <div class="ismjs-select">

                                                            <picture>
                                                                <source type="/SportMgmt/js/webp" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0_1-110.webp 110w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0_1-66.webp 66w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0_1-33.webp 33w" sizes="(min-width: 1024px) 55px,
                               (min-width: 610px) 44px,
                                33px">
                                                                <img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0_1-33.png" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0_1-110.png 110w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0_1-66.png 66w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0_1-33.png 33w" sizes="(min-width: 1024px) 55px,
                               (min-width: 610px) 44px,
                                33px" alt="" title="Click to select a Goalkeeper" class="ism-shirt ism-element__shirt">
                                                            </picture>
															<s:sport position="2" playerType="Goalkeeper"/>
                                                             <c:choose>
                                                             <c:when test="${isPlayerAvail}">
                                                             	<div class="ism-element__name ism-element__name--placeholder">
                                                                ${playerName} <abbr title="Goalkeeper" class="ism-element__type"><span class="ism-element__type__short">${price}</span></abbr>
                                                             </div>
                                                             </c:when>
                                                             <c:otherwise>
                                                             <div class="ism-element__name ism-element__name--placeholder">
                                                                Add <abbr title="Goalkeeper" class="ism-element__type"><span class="ism-element__type__short">GKP</span></abbr>
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
                                                    <div class="ism-element" tabindex="0">

                                                        <div class="ismjs-select">

                                                            <picture>
                                                                <source type="/SportMgmt/js/webp" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-110.webp 110w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-66.webp 66w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.webp 33w" sizes="(min-width: 1024px) 55px,
                               (min-width: 610px) 44px,
                                33px">
                                                                <img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.png" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-110.png 110w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-66.png 66w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.png 33w" sizes="(min-width: 1024px) 55px,
                               (min-width: 610px) 44px,
                                33px" alt="" title="Click to select a Defender" class="ism-shirt ism-element__shirt">
                                                            </picture>
															<s:sport position="1" playerType="Defender"/>
                                                             <c:choose>
                                                             <c:when test="${isPlayerAvail}">
                                                             	<div class="ism-element__name ism-element__name--placeholder">
                                                                ${playerName} <abbr title="Defender" class="ism-element__type"><span class="ism-element__type__short">${price}</span></abbr>
                                                             </div>
                                                             </c:when>
                                                             <c:otherwise>
                                                             <div class="ism-element__name ism-element__name--placeholder">
                                                                Add <abbr title="Defender" class="ism-element__type"><span class="ism-element__type__short">DEF</span></abbr>
                                                             </div>
                                                             </c:otherwise>
                                                             </c:choose>
                                                            
                                                          </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <div id="ismr-pos4" class="ism-pitch__unit ism-pitch__unit--5">
                                                <div>
                                                    <div class="ism-element" tabindex="0">

                                                        <div class="ismjs-select">

                                                            <picture>
                                                                <source type="/SportMgmt/js/webp" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-110.webp 110w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-66.webp 66w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.webp 33w" sizes="(min-width: 1024px) 55px,
                               (min-width: 610px) 44px,
                                33px">
                                                                <img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.png" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-110.png 110w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-66.png 66w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.png 33w" sizes="(min-width: 1024px) 55px,
                               (min-width: 610px) 44px,
                                33px" alt="" title="Click to select a Defender" class="ism-shirt ism-element__shirt">
                                                            </picture>

                                                            <s:sport position="2" playerType="Defender"/>
                                                             <c:choose>
                                                             <c:when test="${isPlayerAvail}">
                                                             	<div class="ism-element__name ism-element__name--placeholder">
                                                                ${playerName} <abbr title="Defender" class="ism-element__type"><span class="ism-element__type__short">${price}</span></abbr>
                                                             </div>
                                                             </c:when>
                                                             <c:otherwise>
                                                             <div class="ism-element__name ism-element__name--placeholder">
                                                                Add <abbr title="Defender" class="ism-element__type"><span class="ism-element__type__short">DEF</span></abbr>
                                                             </div>
                                                             </c:otherwise>
                                                             </c:choose>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <div id="ismr-pos5" class="ism-pitch__unit ism-pitch__unit--5">
                                                <div>
                                                    <div class="ism-element" tabindex="0">

                                                        <div class="ismjs-select">

                                                            <picture>
                                                                <source type="/SportMgmt/js/webp" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-110.webp 110w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-66.webp 66w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.webp 33w" sizes="(min-width: 1024px) 55px,
                               (min-width: 610px) 44px,
                                33px">
                                                                <img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.png" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-110.png 110w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-66.png 66w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.png 33w" sizes="(min-width: 1024px) 55px,
                               (min-width: 610px) 44px,
                                33px" alt="" title="Click to select a Defender" class="ism-shirt ism-element__shirt">
                                                            </picture>

                                                            <s:sport position="3" playerType="Defender"/>
                                                             <c:choose>
                                                             <c:when test="${isPlayerAvail}">
                                                             	<div class="ism-element__name ism-element__name--placeholder">
                                                                ${playerName} <abbr title="Defender" class="ism-element__type"><span class="ism-element__type__short">${price}</span></abbr>
                                                             </div>
                                                             </c:when>
                                                             <c:otherwise>
                                                             <div class="ism-element__name ism-element__name--placeholder">
                                                                Add <abbr title="Defender" class="ism-element__type"><span class="ism-element__type__short">DEF</span></abbr>
                                                             </div>
                                                             </c:otherwise>
                                                             </c:choose>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <div id="ismr-pos6" class="ism-pitch__unit ism-pitch__unit--5">
                                                <div>
                                                    <div class="ism-element" tabindex="0">

                                                        <div class="ismjs-select">

                                                            <picture>
                                                                <source type="/SportMgmt/js/webp" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-110.webp 110w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-66.webp 66w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.webp 33w" sizes="(min-width: 1024px) 55px,
                               (min-width: 610px) 44px,
                                33px">
                                                                <img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.png" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-110.png 110w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-66.png 66w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.png 33w" sizes="(min-width: 1024px) 55px,
                               (min-width: 610px) 44px,
                                33px" alt="" title="Click to select a Defender" class="ism-shirt ism-element__shirt">
                                                            </picture>

                                                            <s:sport position="4" playerType="Defender"/>
                                                             <c:choose>
                                                             <c:when test="${isPlayerAvail}">
                                                             	<div class="ism-element__name ism-element__name--placeholder">
                                                                ${playerName} <abbr title="Defender" class="ism-element__type"><span class="ism-element__type__short">${price}</span></abbr>
                                                             </div>
                                                             </c:when>
                                                             <c:otherwise>
                                                             <div class="ism-element__name ism-element__name--placeholder">
                                                                Add <abbr title="Defender" class="ism-element__type"><span class="ism-element__type__short">DEF</span></abbr>
                                                             </div>
                                                             </c:otherwise>
                                                             </c:choose>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <div id="ismr-pos7" class="ism-pitch__unit ism-pitch__unit--5">
                                                <div>
                                                    <div class="ism-element" tabindex="0">

                                                        <div class="ismjs-select">

                                                            <picture>
                                                                <source type="/SportMgmt/js/webp" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-110.webp 110w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-66.webp 66w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.webp 33w" sizes="(min-width: 1024px) 55px,
                               (min-width: 610px) 44px,
                                33px">
                                                                <img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.png" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-110.png 110w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-66.png 66w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.png 33w" sizes="(min-width: 1024px) 55px,
                               (min-width: 610px) 44px,
                                33px" alt="" title="Click to select a Defender" class="ism-shirt ism-element__shirt">
                                                            </picture>

                                                            <s:sport position="5" playerType="Defender"/>
                                                             <c:choose>
                                                             <c:when test="${isPlayerAvail}">
                                                             	<div class="ism-element__name ism-element__name--placeholder">
                                                                ${playerName} <abbr title="Defender" class="ism-element__type"><span class="ism-element__type__short">${price}</span></abbr>
                                                             </div>
                                                             </c:when>
                                                             <c:otherwise>
                                                             <div class="ism-element__name ism-element__name--placeholder">
                                                                Add <abbr title="Defender" class="ism-element__type"><span class="ism-element__type__short">DEF</span></abbr>
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
                                                    <div class="ism-element" tabindex="0">
                                                        <div class="ismjs-select">

                                                            <picture>
                                                                <source type="/SportMgmt/js/webp" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-110.webp 110w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-66.webp 66w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.webp 33w" sizes="(min-width: 1024px) 55px,
                               (min-width: 610px) 44px,
                                33px">
                                                                <img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.png" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-110.png 110w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-66.png 66w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.png 33w" sizes="(min-width: 1024px) 55px,
                               (min-width: 610px) 44px,
                                33px" alt="" title="Click to select a Midfielder" class="ism-shirt ism-element__shirt">
                                                            </picture>
															<s:sport position="1" playerType="Midfielder"/>
                                                             <c:choose>
                                                             <c:when test="${isPlayerAvail}">
                                                             	<div class="ism-element__name ism-element__name--placeholder">
                                                                ${playerName} <abbr title="Midfielder" class="ism-element__type"><span class="ism-element__type__short">${price}</span></abbr>
                                                             </div>
                                                             </c:when>
                                                             <c:otherwise>
                                                             <div class="ism-element__name ism-element__name--placeholder">
                                                                Add <abbr title="Midfielder" class="ism-element__type"><span class="ism-element__type__short">MID</span></abbr>
                                                             </div>
                                                             </c:otherwise>
                                                             </c:choose>
                                                            </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="ismr-pos9" class="ism-pitch__unit ism-pitch__unit--5">
                                                <div>
                                                    <div class="ism-element" tabindex="0">

                                                        <div class="ismjs-select">

                                                            <picture>
                                                                <source type="/SportMgmt/js/webp" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-110.webp 110w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-66.webp 66w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.webp 33w" sizes="(min-width: 1024px) 55px,
                               (min-width: 610px) 44px,
                                33px">
                                                                <img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.png" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-110.png 110w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-66.png 66w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.png 33w" sizes="(min-width: 1024px) 55px,
                               (min-width: 610px) 44px,
                                33px" alt="" title="Click to select a Midfielder" class="ism-shirt ism-element__shirt">
                                                            </picture>

                                                            <s:sport position="2" playerType="Midfielder"/>
                                                             <c:choose>
                                                             <c:when test="${isPlayerAvail}">
                                                             	<div class="ism-element__name ism-element__name--placeholder">
                                                                ${playerName} <abbr title="Midfielder" class="ism-element__type"><span class="ism-element__type__short">${price}</span></abbr>
                                                             </div>
                                                             </c:when>
                                                             <c:otherwise>
                                                             <div class="ism-element__name ism-element__name--placeholder">
                                                                Add <abbr title="Midfielder" class="ism-element__type"><span class="ism-element__type__short">MID</span></abbr>
                                                             </div>
                                                             </c:otherwise>
                                                             </c:choose>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <div id="ismr-pos10" class="ism-pitch__unit ism-pitch__unit--5">
                                                <div>
                                                    <div class="ism-element" tabindex="0">

                                                        <div class="ismjs-select">

                                                            <picture>
                                                                <source type="/SportMgmt/js/webp" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-110.webp 110w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-66.webp 66w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.webp 33w" sizes="(min-width: 1024px) 55px,
                               (min-width: 610px) 44px,
                                33px">
                                                                <img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.png" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-110.png 110w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-66.png 66w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.png 33w" sizes="(min-width: 1024px) 55px,
                               (min-width: 610px) 44px,
                                33px" alt="" title="Click to select a Midfielder" class="ism-shirt ism-element__shirt">
                                                            </picture>

                                                            <s:sport position="3" playerType="Midfielder"/>
                                                             <c:choose>
                                                             <c:when test="${isPlayerAvail}">
                                                             	<div class="ism-element__name ism-element__name--placeholder">
                                                                ${playerName} <abbr title="Midfielder" class="ism-element__type"><span class="ism-element__type__short">${price}</span></abbr>
                                                             </div>
                                                             </c:when>
                                                             <c:otherwise>
                                                             <div class="ism-element__name ism-element__name--placeholder">
                                                                Add <abbr title="Midfielder" class="ism-element__type"><span class="ism-element__type__short">MID</span></abbr>
                                                             </div>
                                                             </c:otherwise>
                                                             </c:choose>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <div id="ismr-pos11" class="ism-pitch__unit ism-pitch__unit--5">
                                                <div>
                                                    <div class="ism-element" tabindex="0">

                                                        <div class="ismjs-select">

                                                            <picture>
                                                                <source type="/SportMgmt/js/webp" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-110.webp 110w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-66.webp 66w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.webp 33w" sizes="(min-width: 1024px) 55px,
                               (min-width: 610px) 44px,
                                33px">
                                                                <img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.png" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-110.png 110w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-66.png 66w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.png 33w" sizes="(min-width: 1024px) 55px,
                               (min-width: 610px) 44px,
                                33px" alt="" title="Click to select a Midfielder" class="ism-shirt ism-element__shirt">
                                                            </picture>

                                                            <s:sport position="4" playerType="Midfielder"/>
                                                             <c:choose>
                                                             <c:when test="${isPlayerAvail}">
                                                             	<div class="ism-element__name ism-element__name--placeholder">
                                                                ${playerName} <abbr title="Midfielder" class="ism-element__type"><span class="ism-element__type__short">${price}</span></abbr>
                                                             </div>
                                                             </c:when>
                                                             <c:otherwise>
                                                             <div class="ism-element__name ism-element__name--placeholder">
                                                                Add <abbr title="Midfielder" class="ism-element__type"><span class="ism-element__type__short">MID</span></abbr>
                                                             </div>
                                                             </c:otherwise>
                                                             </c:choose>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <div id="ismr-pos12" class="ism-pitch__unit ism-pitch__unit--5">
                                                <div>
                                                    <div class="ism-element" tabindex="0">

                                                        <div class="ismjs-select">

                                                            <picture>
                                                                <source type="/SportMgmt/js/webp" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-110.webp 110w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-66.webp 66w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.webp 33w" sizes="(min-width: 1024px) 55px,
                               (min-width: 610px) 44px,
                                33px">
                                                                <img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.png" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-110.png 110w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-66.png 66w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.png 33w" sizes="(min-width: 1024px) 55px,
                               (min-width: 610px) 44px,
                                33px" alt="" title="Click to select a Midfielder" class="ism-shirt ism-element__shirt">
                                                            </picture>

                                                            <s:sport position="5" playerType="Midfielder"/>
                                                             <c:choose>
                                                             <c:when test="${isPlayerAvail}">
                                                             	<div class="ism-element__name ism-element__name--placeholder">
                                                                ${playerName} <abbr title="Midfielder" class="ism-element__type"><span class="ism-element__type__short">${price}</span></abbr>
                                                             </div>
                                                             </c:when>
                                                             <c:otherwise>
                                                             <div class="ism-element__name ism-element__name--placeholder">
                                                                Add <abbr title="Midfielder" class="ism-element__type"><span class="ism-element__type__short">MID</span></abbr>
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
                                                    <div class="ism-element" tabindex="0">

                                                        <div class="ismjs-select">

                                                            <picture>
                                                                <source type="/SportMgmt/js/webp" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-110.webp 110w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-66.webp 66w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.webp 33w" sizes="(min-width: 1024px) 55px,
                               (min-width: 610px) 44px,
                                33px">
                                                                <img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.png" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-110.png 110w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-66.png 66w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.png 33w" sizes="(min-width: 1024px) 55px,
                               (min-width: 610px) 44px,
                                33px" alt="" title="Click to select a Forward" class="ism-shirt ism-element__shirt">
                                                            </picture>
															<s:sport position="1" playerType="Forward"/>
                                                             <c:choose>
                                                             <c:when test="${isPlayerAvail}">
                                                             	<div class="ism-element__name ism-element__name--placeholder">
                                                                ${playerName} <abbr title="Forward" class="ism-element__type"><span class="ism-element__type__short">${price}</span></abbr>
                                                             </div>
                                                             </c:when>
                                                             <c:otherwise>
                                                             <div class="ism-element__name ism-element__name--placeholder">
                                                                Add <abbr title="Forward" class="ism-element__type"><span class="ism-element__type__short">FWD</span></abbr>
                                                             </div>
                                                             </c:otherwise>
                                                             </c:choose>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <div id="ismr-pos14" class="ism-pitch__unit ism-pitch__unit--3">
                                                <div>
                                                    <div class="ism-element" tabindex="0">

                                                        <div class="ismjs-select">

                                                            <picture>
                                                                <source type="/SportMgmt/js/webp" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-110.webp 110w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-66.webp 66w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.webp 33w" sizes="(min-width: 1024px) 55px,
                               (min-width: 610px) 44px,
                                33px">
                                                                <img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.png" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-110.png 110w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-66.png 66w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.png 33w" sizes="(min-width: 1024px) 55px,
                               (min-width: 610px) 44px,
                                33px" alt="" title="Click to select a Forward" class="ism-shirt ism-element__shirt">
                                                            </picture>

                                                            <s:sport position="2" playerType="Forward"/>
                                                             <c:choose>
                                                             <c:when test="${isPlayerAvail}">
                                                             	<div class="ism-element__name ism-element__name--placeholder">
                                                                ${playerName} <abbr title="Forward" class="ism-element__type"><span class="ism-element__type__short">${price}</span></abbr>
                                                             </div>
                                                             </c:when>
                                                             <c:otherwise>
                                                             <div class="ism-element__name ism-element__name--placeholder">
                                                                Add <abbr title="Forward" class="ism-element__type"><span class="ism-element__type__short">FWD</span></abbr>
                                                             </div>
                                                             </c:otherwise>
                                                             </c:choose>

                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <div id="ismr-pos15" class="ism-pitch__unit ism-pitch__unit--3">
                                                <div>
                                                    <div class="ism-element" tabindex="0">

                                                        <div class="ismjs-select">

                                                            <picture>
                                                                <source type="/SportMgmt/js/webp" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-110.webp 110w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-66.webp 66w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.webp 33w" sizes="(min-width: 1024px) 55px,
                               (min-width: 610px) 44px,
                                33px">
                                                                <img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.png" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-110.png 110w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-66.png 66w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_0-33.png 33w" sizes="(min-width: 1024px) 55px,
                               (min-width: 610px) 44px,
                                33px" alt="" title="Click to select a Forward" class="ism-shirt ism-element__shirt">
                                                            </picture>

                                                            <s:sport position="3" playerType="Forward"/>
                                                             <c:choose>
                                                             <c:when test="${isPlayerAvail}">
                                                             	<div class="ism-element__name ism-element__name--placeholder">
                                                                ${playerName} <abbr title="Forward" class="ism-element__type"><span class="ism-element__type__short">${price}</span></abbr>
                                                             </div>
                                                             </c:when>
                                                             <c:otherwise>
                                                             <div class="ism-element__name ism-element__name--placeholder">
                                                                Add <abbr title="Forward" class="ism-element__type"><span class="ism-element__type__short">FWD</span></abbr>
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
                                    <div tabindex="0">
                                        <div>
                                            <div class="table">
                                                <table class="ism-table ism-table--el ism-table--squad">
                                                    <thead>
                                                        <tr class="ism-table__divider ism-el-type ism-el-type--1">
                                                            <th class="ism-table--squad__status"></th>
                                                            <th class="ism-table--squad__name">Goalkeepers</th>
                                                            <th class="ism-table--squad__price"><abbr title="Price">£</abbr></th>
                                                            <th class="ism-table--squad__tsb"><abbr title="Teams selected by %">SB</abbr></th>
                                                            <th class="ism-table--squad__pts-tot"><abbr title="Total points">TP</abbr></th>
                                                            <th class="ism-table--squad__fixture"><abbr title="Fixture next Gameweek">FIX</abbr></th>
                                                        </tr>
                                                    </thead>
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
                                                            <th class="ism-table--squad__price"><abbr title="Price">£</abbr></th>
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
                                                            <th class="ism-table--squad__price"><abbr title="Price">£</abbr></th>
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
                                                            <th class="ism-table--squad__price"><abbr title="Price">£</abbr></th>
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

                            <div class="ism-alert--info">
                                <p class="ism-alert__item"><strong>Please note:</strong> Some kit designs are mere placeholders. All home shirts will be faithfully reproduced here once kits are launched.</p>
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
        <div id="ismr-side" class="ism-sidebar ism-sidebar--squad">
            <div>
                <section class="ism-bordered ism-bordered--primary">

                    <div class="ism-section-header">
                        <h3 class="subHeader ism-sub-header ism-section-header__title" tabindex="0" id="ismjs-side-focus">Player Selection</h3>
                        <div class="ism-section-header__button">
                            <button type="button" class="ismjs-show-main btn ism-button ism-button--player-list"><span class="icn ism-bg-icn ism-arrow-left"></span>Back</button>
                        </div>
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
                                    <div class="ism-scoreboard__panel__value is-success">£100.0</div>
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
                                        <option value="et_1">Goalkeepers</option>
                                        <option value="et_2">Defenders</option>                                        
                                    </optgroup>
                                    <optgroup label="By Team">
                                        <option value="te_1">Arsenal</option>
                                        <option value="te_2">Bournemouth</option>                                       
                                    </optgroup>
                                </select>
                            </div>
                        </div>
                        <div id="ismr-sort" class="ism-form__group">
                            <label for="ismjs-element-sort" class="ism-form__label">Sorted by</label>
                            <div class="ism-form__select-wrap">
                                <select id="ismjs-element-sort" class="ism-form__select">
                                    <option value="total_points">Total score</option>
                                    <option value="event_points">Round score</option>
                                    <option value="now_cost">Price</option>
                                </select>
                            </div>
                        </div>
                        <div id="ismr-price" class="ism-form__group">
                            <div>
                                <label for="ismjs-element-price" class="ism-form__label">With a maximum price of</label>
                                <div class="ism-form__select-wrap">
                                    <select id="ismjs-element-price" class="ism-form__select">
                                        <option value="">Unlimited</option>
                                        <option value="130">£13.0</option>
                                        <option value="125">£12.5</option>                                        
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="ism-search">
                            <label for="ismjs-element-search" class="ism-form__label">Search Player List</label>
                            <div class="searchInputContainer ism-search">
                                <input id="ismjs-element-search" class="searchInput ism-search__input" type="search" placeholder="Player name">

                                <div class="searchCommit">
                                    <div class="icn search-sm"></div>
                                </div>
                            </div>
                        </div>

                    </form>

                    <div id="ismr-sideboard"></div>
                    
                    <div id="ismr-elements-list"><div>

    <p class="ism-elements-shown"><strong class="ism-elements-shown__num">30</strong> players shown</p>

    <div id="ismjs-elements-list-tables"><div>
    <div class="table">
        <table class="ism-table ism-table--el ism-table--el-list">
            <thead>
                <tr class="ism-table__divider ism-el-type ism-el-type--1">
                    <th class="ism-table--el-list__status"></th>
                    <th class="ism-table--el-list__name"><a href="#" class="ism-link--bold">Goalkeepers</a></th>
                    <th class="ism-table--el-list__price"><abbr title="Price">£</abbr></th>
                    <th class="ism-table--el-list__stat"><abbr title="Goals scored">GS</abbr></th>
                </tr>
            </thead>
            <tbody>
            <tr class="ismjs-menu ism-row-select">
    <td class="ism-table--el__status">
        
            <a href="#" class="ismjs-info ism-table--el__status-link" title="View player information"><svg class="ism-icon--element ism-icon--info" aria-labelledby="ism-title-info" aria-describedby="ism-desc-info">
                <title id="ism-title-info">View player information</title>
                <desc id="ism-desc-info">Information about the player, their season history and upcoming fixtures</desc>
                <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#ism-info"></use>
            </svg></a>
        
    </td>
    <td class="ism-table--el__primary">
        <div class="ism-media ism-media--centred">
            <div class="ism-media__figure">

                <picture>
                    <source type="image/webp" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3_1-110.webp 110w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3_1-66.webp 66w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3_1-33.webp 33w" sizes="16px">
                    <img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3_1-33.png" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3_1-110.png 110w,
                            https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3_1-66.png 66w,
                            https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3_1-33.png 33w" sizes="16px" alt="Arsenal" title="Arsenal" class="ism-shirt">
                </picture>
            </div>

            <div class="ism-media__body ism-table--el__primary-text">
                <a href="#" class="ism-table--el__name">Ospina</a>
                <span class="ism-table--el__strong"><abbr title="Arsenal">ARS</abbr></span>
            </div>
        </div>

    </td>
    <td class="ism-table--el__strong">£5.0</td>
    <td class="ism-table--el__strong">0</td>
</tr><tr class="ismjs-menu ism-row-select">
    <td class="ism-table--el__status">
        
            <a href="#" class="ismjs-info ism-table--el__status-link" title="View player information"><svg class="ism-icon--element ism-icon--info" aria-labelledby="ism-title-info" aria-describedby="ism-desc-info">
                <title id="ism-title-info">View player information</title>
                <desc id="ism-desc-info">Information about the player, their season history and upcoming fixtures</desc>
                <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#ism-info"></use>
            </svg></a>
        
    </td>
    <td class="ism-table--el__primary">
        <div class="ism-media ism-media--centred">
            <div class="ism-media__figure">

                <picture>
                    <source type="image/webp" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3_1-110.webp 110w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3_1-66.webp 66w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3_1-33.webp 33w" sizes="16px">
                    <img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3_1-33.png" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3_1-110.png 110w,
                            https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3_1-66.png 66w,
                            https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3_1-33.png 33w" sizes="16px" alt="Arsenal" title="Arsenal" class="ism-shirt">
                </picture>
            </div>

            <div class="ism-media__body ism-table--el__primary-text">
                <a href="#" class="ism-table--el__name">Cech</a>
                <span class="ism-table--el__strong"><abbr title="Arsenal">ARS</abbr></span>
            </div>
        </div>

    </td>
    <td class="ism-table--el__strong">£5.5</td>
    <td class="ism-table--el__strong">0</td>
</tr></tbody>
        </table>
    </div>
</div><div>
    <div class="table">
        <table class="ism-table ism-table--el ism-table--el-list">
            <thead>
                <tr class="ism-table__divider ism-el-type ism-el-type--2">
                    <th class="ism-table--el-list__status"></th>
                    <th class="ism-table--el-list__name"><a href="#" class="ism-link--bold">Defenders</a></th>
                    <th class="ism-table--el-list__price"><abbr title="Price">£</abbr></th>
                    <th class="ism-table--el-list__stat"><abbr title="Goals scored">GS</abbr></th>
                </tr>
            </thead>
            <tbody>
            <tr class="ismjs-menu ism-row-select">
    <td class="ism-table--el__status">
        
            <a href="#" class="ismjs-info ism-table--el__status-link" title="View player information"><svg class="ism-icon--element ism-icon--info" aria-labelledby="ism-title-info" aria-describedby="ism-desc-info">
                <title id="ism-title-info">View player information</title>
                <desc id="ism-desc-info">Information about the player, their season history and upcoming fixtures</desc>
                <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#ism-info"></use>
            </svg></a>
        
    </td>
    <td class="ism-table--el__primary">
        <div class="ism-media ism-media--centred">
            <div class="ism-media__figure">

                <picture>
                    <source type="image/webp" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-110.webp 110w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-66.webp 66w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-33.webp 33w" sizes="16px">
                    <img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-33.png" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-110.png 110w,
                            https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-66.png 66w,
                            https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-33.png 33w" sizes="16px" alt="Arsenal" title="Arsenal" class="ism-shirt">
                </picture>
            </div>

            <div class="ism-media__body ism-table--el__primary-text">
                <a href="#" class="ism-table--el__name">Chambers</a>
                <span class="ism-table--el__strong"><abbr title="Arsenal">ARS</abbr></span>
            </div>
        </div>

    </td>
    <td class="ism-table--el__strong">£4.5</td>
    <td class="ism-table--el__strong">1</td>
</tr><tr class="ismjs-menu ism-row-select">
    <td class="ism-table--el__status">
        
            <a href="#" class="ismjs-info ism-table--el__status-link" title="View player information"><svg class="ism-icon--element ism-icon--info" aria-labelledby="ism-title-info" aria-describedby="ism-desc-info">
                <title id="ism-title-info">View player information</title>
                <desc id="ism-desc-info">Information about the player, their season history and upcoming fixtures</desc>
                <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#ism-info"></use>
            </svg></a>
        
    </td>
    <td class="ism-table--el__primary">
        <div class="ism-media ism-media--centred">
            <div class="ism-media__figure">

                <picture>
                    <source type="image/webp" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-110.webp 110w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-66.webp 66w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-33.webp 33w" sizes="16px">
                    <img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-33.png" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-110.png 110w,
                            https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-66.png 66w,
                            https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-33.png 33w" sizes="16px" alt="Arsenal" title="Arsenal" class="ism-shirt">
                </picture>
            </div>

            <div class="ism-media__body ism-table--el__primary-text">
                <a href="#" class="ism-table--el__name">Holding</a>
                <span class="ism-table--el__strong"><abbr title="Arsenal">ARS</abbr></span>
            </div>
        </div>

    </td>
    <td class="ism-table--el__strong">£4.5</td>
    <td class="ism-table--el__strong">0</td>
</tr></tbody>
        </table>
    </div>
</div><div>
    <div class="table">
        <table class="ism-table ism-table--el ism-table--el-list">
            <thead>
                <tr class="ism-table__divider ism-el-type ism-el-type--3">
                    <th class="ism-table--el-list__status"></th>
                    <th class="ism-table--el-list__name"><a href="#" class="ism-link--bold">Midfielders</a></th>
                    <th class="ism-table--el-list__price"><abbr title="Price">£</abbr></th>
                    <th class="ism-table--el-list__stat"><abbr title="Goals scored">GS</abbr></th>
                </tr>
            </thead>
            <tbody>
            <tr class="ismjs-menu ism-row-select">
    <td class="ism-table--el__status">
        
            <a href="#" class="ismjs-info ism-table--el__status-link" title="View player information"><svg class="ism-icon--element ism-icon--info" aria-labelledby="ism-title-info" aria-describedby="ism-desc-info">
                <title id="ism-title-info">View player information</title>
                <desc id="ism-desc-info">Information about the player, their season history and upcoming fixtures</desc>
                <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#ism-info"></use>
            </svg></a>
        
    </td>
    <td class="ism-table--el__primary">
        <div class="ism-media ism-media--centred">
            <div class="ism-media__figure">

                <picture>
                    <source type="image/webp" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-110.webp 110w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-66.webp 66w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-33.webp 33w" sizes="16px">
                    <img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-33.png" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-110.png 110w,
                            https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-66.png 66w,
                            https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-33.png 33w" sizes="16px" alt="Arsenal" title="Arsenal" class="ism-shirt">
                </picture>
            </div>

            <div class="ism-media__body ism-table--el__primary-text">
                <a href="#" class="ism-table--el__name">Walcott</a>
                <span class="ism-table--el__strong"><abbr title="Arsenal">ARS</abbr></span>
            </div>
        </div>

    </td>
    <td class="ism-table--el__strong">£7.5</td>
    <td class="ism-table--el__strong">1</td>
</tr><tr class="ismjs-menu ism-row-select">
    <td class="ism-table--el__status">
        
            <a href="#" class="ismjs-info ism-table--el__status-link" title="View player information"><svg class="ism-icon--element ism-icon--info" aria-labelledby="ism-title-info" aria-describedby="ism-desc-info">
                <title id="ism-title-info">View player information</title>
                <desc id="ism-desc-info">Information about the player, their season history and upcoming fixtures</desc>
                <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#ism-info"></use>
            </svg></a>
        
    </td>
    <td class="ism-table--el__primary">
        <div class="ism-media ism-media--centred">
            <div class="ism-media__figure">

                <picture>
                    <source type="image/webp" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-110.webp 110w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-66.webp 66w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-33.webp 33w" sizes="16px">
                    <img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-33.png" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-110.png 110w,
                            https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-66.png 66w,
                            https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-33.png 33w" sizes="16px" alt="Arsenal" title="Arsenal" class="ism-shirt">
                </picture>
            </div>

            <div class="ism-media__body ism-table--el__primary-text">
                <a href="#" class="ism-table--el__name">Chamberlain</a>
                <span class="ism-table--el__strong"><abbr title="Arsenal">ARS</abbr></span>
            </div>
        </div>

    </td>
    <td class="ism-table--el__strong">£6.0</td>
    <td class="ism-table--el__strong">1</td>
</tr>
<tr class="ismjs-menu ism-row-select">
    <td class="ism-table--el__status">
        
            <a href="#" class="ismjs-info ism-table--el__status-link" title="View player information"><svg class="ism-icon--element ism-icon--info" aria-labelledby="ism-title-info" aria-describedby="ism-desc-info">
                <title id="ism-title-info">View player information</title>
                <desc id="ism-desc-info">Information about the player, their season history and upcoming fixtures</desc>
                <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#ism-info"></use>
            </svg></a>
        
    </td>
    <td class="ism-table--el__primary">
        <div class="ism-media ism-media--centred">
            <div class="ism-media__figure">

                <picture>
                    <source type="image/webp" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-110.webp 110w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-66.webp 66w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-33.webp 33w" sizes="16px">
                    <img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-33.png" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-110.png 110w,
                            https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-66.png 66w,
                            https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-33.png 33w" sizes="16px" alt="Arsenal" title="Arsenal" class="ism-shirt">
                </picture>
            </div>

            <div class="ism-media__body ism-table--el__primary-text">
                <a href="#" class="ism-table--el__name">Xhaka</a>
                <span class="ism-table--el__strong"><abbr title="Arsenal">ARS</abbr></span>
            </div>
        </div>

    </td>
    <td class="ism-table--el__strong">£5.5</td>
    <td class="ism-table--el__strong">0</td>
</tr></tbody>
        </table>
    </div>
</div><div>
    <div class="table">
        <table class="ism-table ism-table--el ism-table--el-list">
            <thead>
                <tr class="ism-table__divider ism-el-type ism-el-type--4">
                    <th class="ism-table--el-list__status"></th>
                    <th class="ism-table--el-list__name"><a href="#" class="ism-link--bold">Forwards</a></th>
                    <th class="ism-table--el-list__price"><abbr title="Price">£</abbr></th>
                    <th class="ism-table--el-list__stat"><abbr title="Goals scored">GS</abbr></th>
                </tr>
            </thead>
            <tbody>
            <tr class="ismjs-menu ism-row-select ism-element-list__info--0">
    <td class="ism-table--el__status">
        
            <a href="#" class="ismjs-info ism-table--el__status-link" title="75% chance of playing next match"><svg class="ism-icon--element ism-icon--status-75">
                <title>75% chance of playing next match</title>
                <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#ism-status"></use>
            </svg></a>
        
    </td>
    <td class="ism-table--el__primary">
        <div class="ism-media ism-media--centred">
            <div class="ism-media__figure">

                <picture>
                    <source type="image/webp" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-110.webp 110w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-66.webp 66w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-33.webp 33w" sizes="16px">
                    <img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-33.png" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-110.png 110w,
                            https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-66.png 66w,
                            https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-33.png 33w" sizes="16px" alt="Arsenal" title="Arsenal" class="ism-shirt">
                </picture>
            </div>

            <div class="ism-media__body ism-table--el__primary-text">
                <a href="#" class="ism-table--el__name">Giroud</a>
                <span class="ism-table--el__strong"><abbr title="Arsenal">ARS</abbr></span>
            </div>
        </div>

    </td>
    <td class="ism-table--el__strong">£9.0</td>
    <td class="ism-table--el__strong">0</td>
</tr><tr class="ismjs-menu ism-row-select ism-element-list__info--0">
    <td class="ism-table--el__status">
        
            <a href="#" class="ismjs-info ism-table--el__status-link" title="Unlikely to play next match"><svg class="ism-icon--element ism-icon--status-0">
                <title>Unlikely to play next match</title>
                <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#ism-status"></use>
            </svg></a>
        
    </td>
    <td class="ism-table--el__primary">
        <div class="ism-media ism-media--centred">
            <div class="ism-media__figure">

                <picture>
                    <source type="image/webp" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-110.webp 110w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-66.webp 66w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-33.webp 33w" sizes="16px">
                    <img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-33.png" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-110.png 110w,
                            https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-66.png 66w,
                            https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-33.png 33w" sizes="16px" alt="Arsenal" title="Arsenal" class="ism-shirt">
                </picture>
            </div>

            <div class="ism-media__body ism-table--el__primary-text">
                <a href="#" class="ism-table--el__name">Welbeck</a>
                <span class="ism-table--el__strong"><abbr title="Arsenal">ARS</abbr></span>
            </div>
        </div>

    </td>
    <td class="ism-table--el__strong">£7.5</td>
    <td class="ism-table--el__strong">0</td>
</tr>
<tr class="ismjs-menu ism-row-select">
    <td class="ism-table--el__status">
        
            <a href="#" class="ismjs-info ism-table--el__status-link" title="View player information"><svg class="ism-icon--element ism-icon--info" aria-labelledby="ism-title-info" aria-describedby="ism-desc-info">
                <title id="ism-title-info">View player information</title>
                <desc id="ism-desc-info">Information about the player, their season history and upcoming fixtures</desc>
                <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#ism-info"></use>
            </svg></a>
        
    </td>
    <td class="ism-table--el__primary">
        <div class="ism-media ism-media--centred">
            <div class="ism-media__figure">

                <picture>
                    <source type="image/webp" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-110.webp 110w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-66.webp 66w,
                                https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-33.webp 33w" sizes="16px">
                    <img src="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-33.png" srcset="https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-110.png 110w,
                            https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-66.png 66w,
                            https://ismdj.scdn5.secure.raxcdn.com/static/libsass/plfpl/dist/img/shirts/shirt_3-33.png 33w" sizes="16px" alt="Arsenal" title="Arsenal" class="ism-shirt">
                </picture>
            </div>

            <div class="ism-media__body ism-table--el__primary-text">
                <a href="#" class="ism-table--el__name">Akpom</a>
                <span class="ism-table--el__strong"><abbr title="Arsenal">ARS</abbr></span>
            </div>
        </div>

    </td>
    <td class="ism-table--el__strong">£5.5</td>
    <td class="ism-table--el__strong">0</td>
</tr></tbody>
        </table>
    </div>
</div></div>

    

</div></div>
                </section>

            </div>
        </div>

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
   
  </body>

</html>