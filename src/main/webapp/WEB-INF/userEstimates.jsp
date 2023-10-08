<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Requests</title>
<link rel="stylesheet" type="text/css" href="dashboard.css">
<script type="text/javascript" src="/js/app.js"></script>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/main.css"/>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-xl navbar-light bg-light" style="color: gainsboro;">
  <div class="container-fluid">
    <a class="navbar-brand" href="/dashboard" style= "font-size: 2.5em; color: cornflowerblue;"><c:out value = "${user.username}"></c:out>'s Requests</a>
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
      </ul>
      <a href="/signin" class="btn btn-outline-secondary">Log In</a> 
      <c:if test="${user_id != null}">
      <a href="/logout" class="btn btn-outline-danger" style = "margin-left:10px;">Log Out</a>
      </c:if>
      </div>
  </div>
</nav>
	<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">Address</th>
      <th scope="col">Number of windows</th>
      <th scope="col">Number of floors</th>
      <th scope="col">Square Footage</th>
      <th scope="col">Plants around exterior?</th>
      <th scope="col">Extra Details</th>
      <th scope="col">Edit</th>
      <th scope="col">Delete</th>
    </tr>
  </thead>
  <tbody>
  
	  	<c:forEach var="estimate" items="${estimates}">
	  	<c:if test = "${user_id == estimate.user.id}">
	        <tr>
		        <td> <c:out value="${estimate.address}"/> </td>
		        <td> <c:out value="${estimate.windows}"/> </td>
		         <td> <c:out value="${estimate.floors}"/> </td>
		         <td> <c:out value="${estimate.hasPlants}"/> </td>
		         <td> <c:out value="${estimate.details}"/> </td>
		         <td> <c:out value="${estimate.squareFootage}"/> </td>
		         <td> <a href="/estimate/${estimate.id}/edit" class="btn btn-primary"> Edit</a> </td>
		         <td>
		         <form action="/estimate/${estimate.id}/delete" method="post" >
					    <input type="hidden" name="_method" value="delete">
					    <input type="submit" value="Delete" class="btn btn-danger">
					</form>
					</td>
	        </tr>
	        </c:if>
	    </c:forEach>
	   
  </tbody>
</table>

</body>
</html>