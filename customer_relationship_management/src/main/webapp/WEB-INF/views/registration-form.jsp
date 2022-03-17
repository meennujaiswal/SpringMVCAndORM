<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>

<head>
<!-- Required meta tags -->
<meta charset="utf-8">

<style>
#header {
	font-family: Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
	overflow-x: auto;
}

#customers {
	font-family: Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
	overflow-x: auto;
}

#customers h2 {
	max-width: 761px;
	overflow: hidden;
}

input[type=text], select {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

.button {
	background-color: #0F5B8D;
	border: none;
	color: white;
	padding: 10px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
	border-radius: 6px;
}

div {
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 10px;
	width: 20%;
}
</style>
<title>Customer Tracker</title>
</head>
<body>
	<div id="header">
		<h2>Customer Relationship Management</h2>
		<hr>
	</div>
	<div id="customers">
		<h3>Registration Form</h3>
		<form action="/customer_relationship_management/customers/save"
			method="POST">
			<!-- Add hidden form field to handle update -->
			<input type="hidden" name="id" value='${Customer.id}' />

			<div>
				<input type="text" name="firstName" value="${Customer.firstName}"
					placeholder="First Name">
			</div>
			<div>
				<input type="text" name="lastName" value="${Customer.lastName}"
					placeholder="Last Name">
			</div>
			<div>
				<input type="text" name="email" value="${Customer.email}"
					placeholder="Email Address">
			</div>
			<button type="submit" class="button">Save</button>
		</form>
		<hr>
		<a href="/customer_relationship_management/customers/list">Back to
			Registration List</a>
	</div>
</body>

</html>