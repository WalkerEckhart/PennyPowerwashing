<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login/Register</title>
<link rel="stylesheet" type="text/css" href="dashboard.css">
<script type="text/javascript" src="/js/app.js"></script>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/main.css"/>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container-*" style="background-color: silver; height:800px">
<nav class="navbar navbar-expand-xl navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="/dashboard" style= "font-size: 2.5em; color: cornflowerblue;">Welcome!</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse show" id="navbarText" style="color:">
      <ul class="navbar-nav me-auto mb-2 mb-xl-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/dashboard">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/dashboard">About Us (backlog)</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/dashboard">Pricing (backlog)</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/dashboard">Contact Us (backlog)</a>
        </li>
      </ul>
      </div>
  </div>
</nav>

<div class="container" style="display: flex; justify-content: space-evenly; margin-top: 100px; border-radius: 15px; border: 1px solid black; background-color:white;">
<div class="d-flex p-2 bd-highlight" style="width: 500px">
<h2 class="display-6" style="margin-right:20px">Register:</h2>
<form:form action="/register" mode="POST" modelAttribute="newUser">
		
		<form:label path="username"> Name:</form:label> <br>
		<form:errors path="username" class="text-danger"/> <br>
		<form:input path="username" class="form-floating" style="width: 300px;"/> <br>
		
		<form:label path="email">Email:</form:label><br>
		<form:errors path="email" class="text-danger"/> <br>
		<form:input path="email" class="form-floating" style="width: 300px;"/> <br>

		<form:label path="password">Password:</form:label><br>
		<form:errors path="password" class="text-danger"/> <br>
		<form:password path="password" class="form-floating" style="width: 300px;"/> <br>

		<form:label path="confirmPassword">Confirm Password:</form:label><br>
		<form:errors path="confirmPassword" class="text-danger"/> <br>
		<form:password path="confirmPassword" class="form-floating" style="width: 300px;"/> <br>
<br>
		<input type="submit" class ="btn btn-success" value="Register"/>
</form:form>
	</div>
<div class="d-flex p-2 bd-highlight">
<h2 class="display-6" style="margin-right:20px">Sign In:</h2>
<form:form action="/login" mode="POST" modelAttribute="newLogin">
		
		<form:label path="email">Email:</form:label><br>
		<form:errors path="email" class="text-danger"/> <br>
		<form:input path="email" class="form-floating" style="width: 300px;"/> <br>

		<form:label path="password">Password:</form:label><br>
		<form:errors path="password" class="text-danger"/> <br>
		<form:password path="password" class="form-floating" style="width: 300px;"/> <br>
<br>
		<input type="submit" class ="btn btn-success" value="Login"/>
</form:form>
</div>
</div>
</div>
</body>
</html>