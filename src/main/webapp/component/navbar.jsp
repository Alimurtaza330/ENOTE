<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="com.UserDeatil.UserDetail"%>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title></title>
<link rel="stylesheet"
	href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Averia+Sans+Libre:ital@1&display=swap"
	rel="stylesheet">

<style>
* {
	box-sizing: border-box;
}

body {
	margin: 0px;
	font-family: 'Averia Sans Libre', sans-serif;
}

.nav {
	height: 50px;
	width: 100%;
	background-color: #4d4d4d;
	position: relative;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.nav>.nav-header {
	display: inline;
}

.nav>.nav-header>.nav-title {
	display: inline-block;
	font-size: 22px;
	color: #fff;
	padding: 10px;
}

.nav>.nav-btn {
	display: none;
}

.nav>.nav-links {
	display: flex;
	justify-content: flex-end;
	align-items: center;
	font-size: 18px;
}

.nav>.nav-links>a {
	display: inline-block;
	padding: 13px 10px;
	text-decoration: none;
	color: #efefef;
}

.nav>.nav-links>a:hover {
	background-color: rgba(0, 0, 0, 0.3);
}

#nav-check {
	display: none;
}

.nav-btn {
	display: none;
	flex-direction: column;
	cursor: pointer;
}

.nav-btn label {
	background-color: #333;
	padding: 10px;
	cursor: pointer;
}

.nav-btn label:hover {
	background-color: rgba(0, 0, 0, 0.3);
}

.nav-btn span {
	background-color: #fff;
	display: block;
	height: 3px;
	margin: 6px 0;
	transition: 0.4s;
}

#profile-modal {
	display: none;
	position: fixed;
	top: -100%;
	left: 50%;
	transform: translate(-50%, 0);
	background: linear-gradient(to bottom right, #333, #222);
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.8);
	z-index: 1000;
	max-width: 400px;
	width: 100%;
	text-align: center;
	transition: top 0.5s ease-in-out, background 0.6s ease-in-out;
}

#close-modal {
	cursor: pointer;
	float: right;
	font-size: 24px;
	color: #fff;
}

#close-modal:hover {
	color: #ff0000;
}

#profile-modal div {
	margin-top: 20px;
}

#profile-modal i {
	font-size: 36px;
	color: #fff; 
	margin-bottom: 10px;
}

#profile-modal p {
	font-size: 18px;
	color: #fff; 
	margin: 0;
}

#profile-modal p:first-child {
	font-weight: bold;
}

#profile-modal, #close-modal, #profile-modal i, #profile-modal p {
	transition: 0.3s ease-in-out;
}

#close-modal:hover, #close-modal:focus {
	transform: scale(1.2);
}

#profile-modal.fade-in {
	top: 50%;
	background: linear-gradient(to bottom right, #222, #111);
	
}


</style>
</head>

<body>

	<div class="nav">
		<input type="checkbox" id="nav-check">
		<div class="nav-header">
			<div class="nav-title">ENOTE</div>
		</div>
		<div class="nav-btn">
			<label for="nav-check"> <span></span> <span></span> <span></span>
			</label>
		</div>

		<div class="nav-links">
			<%
			UserDetail user = (UserDetail) session.getAttribute("userDetails");
			if (user != null) {
			%>
			<a href="#" onclick="openUserProfileModal()"> <i
				class="uil uil-user"><%=user.getName().toUpperCase()%>
			</a></i>
			<a href="shownotes.jsp"> <i class="uil uil-book-open">Show Notes</i></a>
			<a href="logout"> <i class="uil uil-signout">Logout</i></a>
			<%
			} else {
			%>
			<a href="login.jsp">LOGIN</a> <a href="register.jsp">REGISTER</a>
			<%
			}
			%>
		</div>
	</div>

	<div id="profile-modal">
		<span id="close-modal" onclick="closeUserProfileModal()">&times;</span>
		<div>
			<%
			if (user != null) {
			%>
			<i class="uil uil-user"></i>
			<p>
				User ID:
				<%=user.getId()%></p>
			<p>
				Email:
				<%=user.getEmail()%></p>
			<%
			}
			%>
		</div>
	</div>

	<script>
		function openUserProfileModal() {
			document.getElementById('profile-modal').style.display = 'block';
			document.getElementById('profile-modal').classList.add('fade-in');
		}

		function closeUserProfileModal() {
			document.getElementById('profile-modal').classList
					.remove('fade-in');
			setTimeout(
					function() {
						document.getElementById('profile-modal').style.display = 'none';
					}, 500);
		}
	</script>

</body>

</html>
