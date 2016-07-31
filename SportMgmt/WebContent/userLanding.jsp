<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Landing</title>
</head>
<body>
	isLogined:  ${param.isLogined}
	userId: ${sessionScope.userId}
	name: ${sessionScope.user.displayName}
	<br/><br/>
	gameDetailsJson:<br/> ${sessionScope.gameDetailsJson}
	<br/><br/>
	playerListJson:<br/> ${sessionScope.playerListJson}
	<br/><br/>
	clubListJson: <br/>${sessionScope.clubListJson}
	<br/><br/>
	userGameJson: <br/>${sessionScope.userGameJson}
	
</body>
</html>