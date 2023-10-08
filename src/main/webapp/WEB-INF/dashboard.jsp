<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link rel="stylesheet" type="text/css" href="dashboard.css">
<script type="text/javascript" src="/js/app.js"></script>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/main.css"/>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container-*"> 
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
<div class="container-*" style="background-color: cornflowerblue; width:100%; height:800px">
	<div class="card bg-dark text-dark" style="height:960px; ">
	  <img src="/resources/img/dashboard.jpg" class="card-img" alt="card-img-overlay">
	  <div class="card-img-overlay">
	    <div class="bg-secondary p-5 text-light bg-opacity-75" 
	    style="background-color: grey; margin-top: 50px; font-size: 1.5em; height:800px; width:100%"> <p>Penny's Powerwashing is your premier choice for top-tier exterior cleaning services in Maryland. Our highly skilled team takes immense pride in their expertise, utilizing cutting-edge power washing techniques to thoroughly eliminate dirt, grime, and algae, ensuring that your property not only looks impeccable but also maintains its structural integrity. What truly sets Penny's apart is our unwavering commitment to environmental responsibility. We firmly believe in the principle of giving back to the community, which is why a significant portion of our proceeds is dedicated to supporting the Chesapeake Bay Wildlife Foundations—a cause we wholeheartedly embrace and cherish.</p>

<p>At Penny's, we are committed to providing not just a service but also making a positive impact on our environment. When you choose Penny's, you're not merely selecting a premier service; you're making a conscious choice to contribute to the preservation of the Chesapeake Bay's natural beauty. Our mission goes beyond cleanliness; it encompasses sustainability and community engagement. Join us in our mission to maintain the cleanliness and charm of Maryland, one power wash at a time, and together, we'll make a profound and lasting difference, ensuring that our beloved Chesapeake Bay thrives for generations to come. Thank you for entrusting Penny's Powerwashing with your property's care, and for joining us in our commitment to the environment and the community.</p></div>
	  </div>
	</div>
</div>
</div>
</body>
</html>