<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

#customers td, #customers th {
	border: 1px solid #ddd;
	padding: 8px;
}

#customers tr:nth-child(even) {
	background-color: #f2f2f2;
}

#customers tr:hover {
	background-color: #ddd;
}

#customers th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #0F5B8D;
	color: white;
}

.button {
	background-color: #0F8D5E;
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

.update {
	color: white;
	padding: 8px;
	font-family: Arial;
	background-color: #0F8D5E;
	border-radius: 2px;
}

.delete {
	color: white;
	padding: 8px;
	font-family: Arial;
	background-color: #f44336;
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
		<h3>Customer List</h3>
		<table>
			<thead>
				<tr>
					<th>S.No.</th>
					<th>Customer Id</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email ID</th>
					<th>Action</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${Customers}" var="customer" varStatus="counter">
					<tr>
						<td>${counter.count}</td>
						<td><c:out value="${customer.id}" /></td>
						<td><c:out value="${customer.firstName}" /></td>
						<td><c:out value="${customer.lastName}" /></td>
						<td><c:out value="${customer.email}" /></td>
						<td><a
							href="/customer_relationship_management/customers/showFormForUpdate?id=${customer.id}"
							class="update"> Update </a> <a
							href="/customer_relationship_management/customers/delete?id=${customer.id}"
							class="delete"
							onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">
								Delete </a></td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
			<!-- Add a button -->
		<form>
			<a href="/customer_relationship_management/customers/showFormForAdd"
				class="button"> Add Customer </a>
		</form>
	</div>
</body>
</html>


