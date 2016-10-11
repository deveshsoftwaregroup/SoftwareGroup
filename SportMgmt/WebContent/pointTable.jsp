<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div style="color: green;font-size: 20px; font-weight: bold;"> ${message}
<br/><br/>
<c:forEach var="pointMap" items="${pointList}">
  <c:out value="${pointMap['pointName']}"/>  <c:out value="${pointMap['pointToAdd']}"/>  <c:out value="${pointMap['pointToDeduct']}"/> 
  <br>  
</c:forEach>
</div>