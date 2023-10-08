<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Request</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<script type="text/javascript" src="/js/app.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
    crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
    integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
    crossorigin="anonymous"></script>
<link rel="stylesheet" href="/css/main.css"/>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-xl navbar-light bg-light" style="color: gainsboro;">
  <div class="container-fluid">
    <a class="navbar-brand" href="/dashboard" style= "font-size: 2.5em; color: cornflowerblue;">Penny's Powerwashing</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse show" id="navbarText">
      <ul class="navbar-nav me-auto mb-2 mb-xl-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/dashboard">About Us (backlog)</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/addEstimate">Request an Estimate</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/dashboard">Contact Us (backlog)</a>
        </li>
      </ul>
      <a href="/signin" class="btn btn-outline-secondary">Log In</a> 
      <c:if test="${user_id != null}">
      <a href="/logout" class="btn btn-outline-danger">Log Out</a>
      </c:if>
      </div>
  </div>
</nav>
<div class="container">
	<h1>Your Address:<c:out value="${estimate.address}"/></h1>
	<h2>Price: <c:out value="${estimate.price})"/></h2>
	<p>Number of Floors: <c:out value="${estimate.floors}"/></p>
	<p>Number of windows: <c:out value = "${estimate.windows}"/></p>
	<p>Square footage estimate:<c:out value = "${estimate.squareFootage}"/></p>
	<p>Do you have plants around the exterior?: <c:out value="${estimate.hasPlants}"/></p>
	<p>Your request's details: <c:out value="${estimate.details}"/></p>
<a href="/dashboard" class="btn btn-primary">Dashboard</a>
</body>
</html>