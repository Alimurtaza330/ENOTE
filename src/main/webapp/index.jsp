<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>E-NOTEBOOK</title>
<style>  
.img {
	background: url('component/homepage.avif') no-repeat;
	width: 100%;
	height: 100vh;
	background-size: cover;
	background-position: center;
	position: relative;
}

.img::before {
	content: '';
	position: absolute;
	height: 100%;
	width: 100%;
	background: rgba(0, 0, 0, 0.4);
}

.center {
	position: absolute;
	top: 52%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 100%;
	padding: 0 20px;
	text-align: center;
}

.center .title {
	color: #fff;
	font-size: 3rem;
	font-weight: 600;
}

.center .sub_title {
	color: #fff;
	font-size: 2rem;
	font-weight: 600;
	text-decoration: underline;
}

.center .btns {
	margin-top: 20px;
}

.center .btns a {
	height: 55px;
	width: 170px;
	border-radius: 5px;
	border: none;
	margin: 0 10px;
	border: 2px solid white;
	font-size: 20px;
	font-weight: 500;
	padding: 0 10px;
	cursor: pointer;
	outline: none;
	transition: all 0.3s ease;
	text-decoration: none;
}

.center .btns a:first-child {
	color: #fff;
	background: none;
}

.btns a:first-child:hover {
	background: white;
	color: black;
}

.center .btns a:last-child {
	background: white;
	color: black;
}
</style>
</head>
<body>
	<%@include file="./component/navbar.jsp"%>
	

	<div class="img"></div>
	<div class="center">
		<div class="title">I take notes like some people take drugs.</div>
		<div class="sub_title">Author: Tim Ferriss</div>
		<div class="btns">
			<a href="login.jsp">LOGIN</a> 
			<a href="register.jsp">REGISTER</a>
		</div>
	</div>
	<%@include file="./component/footer.jsp"%>

</body>
</html>