<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Fixtures</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/SportMgmt/css/font-awesome.css" type="text/css">
	<link rel="stylesheet" href="/SportMgmt/css/team.css" type="text/css">
</head>
<body>
<main id="mainContent" tabindex="0" class="league">
        <div class="league-container">
            <div class="league-pusher leaguejs-page-transition">
                <!-- Primary content -->
                <div id="leaguer-main" class="league-main">
					<div>
						<div class="fixtures league-bordered league-bordered--highlight">
							<div class="fixtures-head">
								<h5>Gameweek 4 - 10 Sep 11:30</h5>
								<div class="head-main">
									<div class="fixtures-logo">
										The 12th Man League <span>Fixtures</span>
									</div>
									<div class="fixtures-pegination">
										<a class="peg-lnk" href="#">Previous <i class="fa fa-angle-left"></i></a>
										<a class="peg-lnk" href="#">Next <i class="fa fa-angle-right"></i></a>
									</div>
								</div>
							</div>
							<div class="fixtures-team">
								<div class="team-row date">Saturday 10 September</div>
								<div class="team-row">
									<div class="row-lft">Man Utd <span class="badge-25 MUN"></span></div>
									<div class="row-mid">12:30</div>
									<div class="row-rgt"><span class="badge-25 MCI"></span> Man City</div>
								</div>
								<div class="team-row">
									<div class="row-lft">Arsenal <span class="badge-25 ARS"></span></div>
									<div class="row-mid">15:00</div>
									<div class="row-rgt"><span class="badge-25 SOU"></span> Southampton</div>
								</div>
								<div class="team-row">
									<div class="row-lft">Bournemouth <span class="badge-25 BOU"></span></div>
									<div class="row-mid">15:00</div>
									<div class="row-rgt"><span class="badge-25 WBA"></span> West Brom</div>
								</div>
								<div class="team-row">
									<div class="row-lft">Burnley <span class="badge-25 BUR"></span></div>
									<div class="row-mid">15:00</div>
									<div class="row-rgt"><span class="badge-25 HUL"></span> Hull</div>
								</div>
								<div class="team-row">
									<div class="row-lft">Middlesbrough <span class="badge-25 MID"></span></div>
									<div class="row-mid">15:00</div>
									<div class="row-rgt"><span class="badge-25 CRY"></span> Crystal Palace</div>
								</div>
								<div class="team-row">
									<div class="row-lft">Stoke <span class="badge-25 STK"></span></div>
									<div class="row-mid">15:00</div>
									<div class="row-rgt"> <span class="badge-25 TOT"></span> Spurs</div>
								</div>
								<div class="team-row">
									<div class="row-lft">West Ham <span class="badge-25 WHU"></span></div>
									<div class="row-mid">15:00</div>
									<div class="row-rgt"> <span class="badge-25 WAT"></span> Watford</div>
								</div>
								<div class="team-row">
									<div class="row-lft">Liverpool <span class="badge-25 LIV"></span></div>
									<div class="row-mid">17:30</div>
									<div class="row-rgt"> <span class="badge-25 LEI"></span> Leicester</div>
								</div>
								<div class="team-row date">
									Sunday 11 September
								</div>
								<div class="team-row">
									<div class="row-lft">Swansea <span class="badge-25 SWA"></span></div>
									<div class="row-mid">16:00</div>
									<div class="row-rgt"> <span class="badge-25 CHE"></span> 00 Chelsea</div>
								</div>
								<div class="team-row">
									<div class="row-lft">Liverpool <span class="badge-25 LIV"></span></div>
									<div class="row-mid">17:30</div>
									<div class="row-rgt"> <span class="badge-25 LEI"></span> Leicester</div>
								</div>
								<div class="team-row date">
									Monday 12 September
								</div>
								<div class="team-row">
									<div class="row-lft">Sunderland <span class="badge-25 SUN"></span></div>
									<div class="row-mid">22:00</div>
									<div class="row-rgt"> <span class="badge-25 EVE"></span> Everton</div>
								</div>
							</div>
						</div>
					</div>
				</div>

                <!-- Secondary content -->
                
			</div>
		</div>
	</main>

 <script src="/SportMgmt/js/jquery.js"></script> 
  <script src="/SportMgmt/js/bootstrap.min.js"></script> 
<script type="text/javascript">
	$(window).load(function(){
	ToggleShow('.1-box', '.check_1'); ToggleShow('.2-box', '.check_2');
	ToggleShow('.3-box', '.check_3');
	ToggleShow('.4-box', '.check_4');
	ToggleShow('.5-box', '.check_5');
	ToggleShow('.6-box', '.check_6');
	ToggleShow('.7-box', '.check_7');
	ToggleShow('.8-box', '.check_8');
	ToggleShow('.9-box', '.check_9');
	ToggleShow('.10-box', '.check_10');
	ToggleShow('.11-box', '.check_11');
	ToggleShow('.12-box', '.check_12');
	ToggleShow('.13-box', '.check_13');
	ToggleShow('.14-box', '.check_14');
	ToggleShow('.15-box', '.check_15');
	ToggleShow('.16-box', '.check_16');

	function ToggleShow(checkbox, div) {
		$(checkbox).change(function () {
			$(div).toggleClass('enable');
		});
	}
	});
</script>
</body>
</html>