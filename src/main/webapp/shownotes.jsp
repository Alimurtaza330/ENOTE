<%@page import="com.UserDeatil.mynotes"%>
<%@page import="java.util.List"%>
<%@page import="com.connection.DBConnection"%>
<%@page import="com.database.mynotesDatabase"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Notes</title>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet" />
<style>
body {
	margin: 0;
	font-family: 'Almarai', serif;
	background: #5C5C5C;
}

.body {
	margin: 0;
	font-family: Arial, sans-serif;
}

.paper {
	position: relative;
	width: 90%;
	max-width: 800px;
	height: 480px;
	margin: 0 auto;
	background: #fafafa;
	border-radius: 10px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, .3);
	overflow: hidden;
	margin-bottom: 20px;
}

.paper:before {
	content: '';
	position: absolute;
	top: 0;
	bottom: 0;
	right: 0;
	width: 60px;
	background: radial-gradient(#575450 6px, transparent 7px) repeat-y;
	background-size: 30px 30px;
	border-left: 3px solid #D44147;
	box-sizing: border-box;
}

.paper-content {
	position: absolute;
	top: 30px;
	left: 0;
	bottom: 30px;
	right: 60px;
	background: linear-gradient(transparent, transparent 28px, #91D1D3 28px);
	background-size: 30px 30px;
	display: flex;
	flex-direction: column;
}

.info {
	margin: 5px;
	color: #333;
}

.paper-content textarea {
	flex-grow: 1;
	width: 100%;
	max-width: 100%;
	height: 100%;
	max-height: 100%;
	line-height: 30px;
	padding: 0 10px;
	border: 0;
	outline: 0;
	background: transparent;
	color: mediumblue;
	font-family: 'Almarai', cursive;
	text-align: right;
	font-weight: bold;
	font-size: 14px;
	box-sizing: border-box;
	z-index: 1;
}

.edit-btn, .delete-btn {
	margin-left: 10px;
	padding: 10px 20px;
	cursor: pointer;
	font-size: 14px;
	font-weight: bold;
	border: none;
	border-radius: 5px;
	transition: background-color 0.3s ease-in-out, color 0.3s ease-in-out;
}

.edit-btn {
	background-color: #3498db;
	color: #fff;
	text-decoration: none;
}

.delete-btn {
	background-color: #e74c3c;
	color: #fff;
	text-decoration: none;
}

.edit-btn:hover, .delete-btn:hover {
	background-color: #2c3e50;
}

@media screen and (max-width: 600px) {
	.paper {
		width: 100%;
		max-width: none;
	}
}

@media screen and (max-width: 768px) {
	.paper {
		width: 90%;
	}
}

.titlesetting {
	margin-top: 20px;
	text-align: center;
}

.success-box {
	width: 90%;
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
	background-color: #d4edda;
	border: 1px solid #c3e6cb;
	color: #155724;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
.fail-box {
	width: 90%;
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
	background-color: 	#e54141;
	border: 1px solid #c3e6cb;
	color: #155724;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.success-box h2 {
	margin-top: 0;
}

.success-box p {
	margin-bottom: 0;
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<%
	String msg = (String) session.getAttribute("updatemsg");
	if (msg != null) {
	%>
	<div class="success-box" id="mySuccessBox">
		<h2>Success!</h2>
		<p>Your operation was successful.</p>
	</div>

	<%
	session.removeAttribute("updatemsg");
	}
	%>


	<%
	String failsms = (String) session.getAttribute("failsms");
	if (failsms != null) {
	%>
	<div class="fail-box" id="mySuccessBox">
		<h2>Failed!</h2>
		<p>Your operation failed.</p>
	</div>

	<%
	session.removeAttribute("failsms");
	}
	%>



	<%
	UserDetail us = (UserDetail) session.getAttribute("userDetails");
	%>

	<%
	if (us != null) {

		mynotesDatabase notes = new mynotesDatabase(DBConnection.getConnection());
		List<mynotes> post = notes.getData(us.getId());
		for (mynotes mn : post) {
	%>

	<div class="paper">
		<div class="paper-content">
			<div class="info">


				<h3>
					Name:
					<%=us.getName().toUpperCase()%></h3>
				<p>
					Published By :<%=mn.getPdate()%>
				</p>

				<h3 class="titlesetting">
					Title:
					<%=mn.getTitle()%></h3>
			</div>
			<textarea autofocus name="discription"><%=mn.getDiscription()%></textarea>
			<div class="buttons">
				<a href="edit.jsp?noteid=<%=mn.getId()%>" class="edit-btn">Edit</a>
				<a href="deletenote?noteid=<%=mn.getId()%>" class="delete-btn">Delete</a>
			</div>
		</div>
	</div>
	<%
	}

	}
	%>



	<%@include file="component/footer.jsp"%>
	<script>
		setTimeout(function() {
			document.getElementById('mySuccessBox').style.display = 'none';
		}, 1500);
	</script>
</body>
</html>