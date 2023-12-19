<%@page import="com.Servlet.loginServlet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   
    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Book</title>
<style>
body {
	margin: 30px 0 0;
	background: #5C5C5C;
	font-family: 'Almarai', serif;
}

.title {
	position: relative;
	width: 90%;
	max-width: 800px;
	padding: 10px 15px;
	margin: 0 auto;
	box-shadow: 0 2px 8px rgba(0, 0, 0, .5);
	overflow: hidden;
	display: flex;
	flex-direction: column;
	color: white;
	margin-top: 20px
}

.inputbox {
	margin-top: 0;
	margin-bottom: 20px;
	color: black;
	outline: none;
	padding: 20px 15px;
	font-size: 18px;
	font-family: 'Almarai', cursive;
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
	margin-bottom: 20px
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
}

.paper-content textarea {
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

@media screen and (max-width: 600px) {
	.title, .inputbox, .paper {
		width: 100%;
		max-width: none;
	}
}

@media screen and (max-width: 768px) {
	.title, .inputbox, .paper {
		width: 90%;
	}
}

.btndiv {
	display: flex;
	justify-content: center;
	margin: 20px;
}

.btn {
	padding: 10px;
	cursor: pointer;
	background-color: #3498db;
	color: #fff;
	border: none;
	border-radius: 5px;
	font-size: 16px;
}

.btn:hover {
	background-color: #2980b9;
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<form action="addNote" method="post">
		<%
		UserDetail us = (UserDetail) session.getAttribute("userDetails");
		
		%>
		
	<input type="hidden" value="<%=us.getId()%>" name="uid">

		
		<Label class="title">Note Title</Label> <input class="title inputbox"
			type="text" name="title" required="required">
		<div class="paper">
			<div class="paper-content">
				<textarea autofocus name="discription" required="required"></textarea>
			</div>
		</div>

		<div class="btndiv">
			<button type="submit" class="btn">Save</button>
		</div>
	</form>
	<%@include file="component/footer.jsp"%>
</body>
</html>
