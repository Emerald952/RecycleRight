<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport' content="width=device-width, initial-scale=1.0">
	<title>RecycleRight</title>
	<link href="css/home.css" rel="stylesheet">
	<script src="js/home.js"></script>
</head>
<body>
	<header>
		<div id="signupLogin">
			<%
				String name = (String) session.getAttribute("user");
				if (name == null){ %>
				<button onclick="showSignUp()">Sign Up</button>
			<%} else{ %>
				<span> Welcome, <%= name %>! </span>
			<%} %>
		</div>
		
		<div id="hamburgerMenu" class="hamburger" onclick="toggleSidebar()">&#9776;</div>
		<div id="sidebar">
			<a href="searchWaste?all=true" class="view-all-btn"> View All Waste Items</a>
			<a href="recycleInfo">Recycling Number</a>
			<a href="disposeGuide">Guide to Dispose</a>
			<a href="disposalPoint">Disposal Points</a>
			<%if(name != null){ %>
				<a href="logout">Logout</a>
			<%} %>
		</div>
		<div id="signupModal" class = "modal-overlay" style = "display:none;">
			<div class="signup-cont">
				<span class="close-btn" onclick="hideSignUp()">&times;</span>
				<div id="registerSec">
					<h2>Contribute to Us</h2>
					<form action="signup" method="POST" name="validForm" onsubmit="return validateForm()">
						<label>Enter Name: </label><input type = "text" name="username" placeholder="Username" required>
						<span id="nameErr" style="color:red"></span>
						<label>Enter Password: </label><input type = "password" name="password" placeholder="Password" required>
						<span id="pwdErr" style="color:red"></span>
						<label>Enter Email ID: </label><input type = "email" name="email" placeholder="Email" required>
						<span id="emailErr" style="color:red"></span>
						<button type = "submit">Sign Up</button>
					</form>
					<%if("taken".equals(request.getParameter("SignupError"))){ %>
						<p style="color:red;">UserName already taken!</p>
					<%} %>
					<p>Already a user? <a href="javascript:void(0)" onclick="toggleForms()">Login here</a></p>
				</div>
				<div id="loginSec" style="display:none">
					<h2>Welcome Back</h2>
					<form action="login" method="POST">
						<label>Email:</label><input type="email" name="email" required>
						<label>Password:</label><input type="password" name="password" required>
						<button type="submit">Login</button>
					</form>
					<%if("true".equals(request.getParameter("LoginError"))){ %>
						<p style="color:red;">Invalid Email or Password. Please try again</p>
					<%} %>
					<p>New here?<a href="javascript:void(0)" onclick="toggleForms()">Create an Account</a></p>
				</div>
			</div>
		</div>
		
		<div id = "heading">
			<h1>Recycle Right</h1>
			<h3>Know Where Your Waste Belongs</h3>
		</div>

	</header>
	
	<main>
		
		<form action="searchWaste" method="get" id="searchBox">
			<input type="text" name="waste" placeholder="Enter Waste Item...">
			<button type="submit">Search</button>
		</form>
	
		<div id="categories">
			<a href="searchWaste?category=Wet" class="catCard">
				<h2>Wet Waste</h2>
			</a>
			<a href="searchWaste?category=Dry" class="catCard">
				<h2>Dry Waste</h2>
			</a>
			<a href="searchWaste?category=Electronic" class="catCard">
				<h2>E-Waste</h2>
			</a>
			<a href="searchWaste?category=Hazardous" class="catCard">
				<h2>Hazardous Waste</h2>
			</a>
		</div>
		

	</main>
	
	<footer>
	
	</footer>
	
	
</body>
</html>