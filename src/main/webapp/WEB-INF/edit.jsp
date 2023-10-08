<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<script type="text/javascript" src="/js/app.js"></script>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/main.css"/>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container-*" style = "background-color: silver;">
<nav class="navbar navbar-expand-xl navbar-light bg-light" style="color: gainsboro; margin-bottom:50px">
  <div class="container-fluid">
    <a class="navbar-brand" href="/dashboard" style= "font-size: 2.5em; color: cornflowerblue;">Penny's Powerwashing</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse show" id="navbarText">
      <ul class="navbar-nav me-auto mb-2 mb-xl-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/addEstimate">Request an Estimate</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/dashboard">Contact Us</a>
        </li>
      </ul>
      <a href="/signin" class="btn btn-outline-secondary">Log In</a> 
      <c:if test="${user_id != null}">
      <a href="/logout" class="btn btn-outline-danger" style="margin-left:10px;">Log Out</a>
      </c:if>
      </div>
  </div>
</nav>
<div class="container-*" style="background-color: silver; height: 750px"> 
	<div class="card" style = "width:65%; margin-left:250px; border: 2px solid black">
		<div class = "card-header" style = "background-color: cornflowerblue; border-bottom: 2px solid black ">
			Your Request:
		</div>
		<div class="card-body" style = "padding: 5px">
<form:form action="/estimate/${estimate.id}" mode="POST" modelAttribute="estimate">
			
	    <input type="hidden" name="_method" value="put">
		
		<form:label path="address">Home Address:</form:label><br>
		<form:errors path="address" class="text-danger"/>
		<form:input path="address" class="form-floating" style="width: 300px;"/> <br>
		
		<form:label path="windows"> Number of Windows:</form:label>
		<form:errors path="windows" class="text-danger"/> <br>
		<form:input path="windows" class="form-floating" style="width: 300px;"/> <br>
		
		<form:label path="squareFootage">Sq. Ft:</form:label><br>
		<form:errors path="squareFootage" class="text-danger"/>
		<form:input path="squareFootage" class="form-floating" style="width: 300px;"/> <br>

		<form:label path="floors">Number of floors:</form:label><br>
		<form:errors path="floors" class="text-danger"/>
		<form:input type ="number" path="floors" class="form-floating" style="width: 300px;"/> <br>
		
		<form:label path="hasPlants">Are there plants around the exterior of your home?</form:label><br>
		<form:errors path="hasPlants" class="text-danger"/>
		<form:radiobutton path="hasPlants" value="Yes"/> Yes<br>
		<form:radiobutton path="hasPlants" value="No" /> No<br>
		
		<form:label path="details">Please provide extra information such as pets, concerns, special requests, etc.</form:label><br>
		<form:errors path="details" class="text-danger"/>
		<form:input type="textbox" path="details" class="form-floating" style="width: 650px"/> <br>
		
		<form:errors path="user" class="error"/>
		<form:input type="hidden" path="user" value="${user.id}"/>
		
		<input type="submit" class="btn btn-primary" style ="margin-top: 5px;"value="Update"/>
</form:form>
		</div>
	</div>
</div>
</div>
</body>
</html>