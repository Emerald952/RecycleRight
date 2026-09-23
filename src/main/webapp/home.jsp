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
		<div class="logo">
			<img src="images/logo.png">
			<span>Recycle Right</span>
		</div>
		<div id="signupLogin">
			<%
				String name = (String) session.getAttribute("user");
				String role = (String) session.getAttribute("role");
				if (name == null){ %>
				<button onclick="showSignUp()" class="signupBtn">Sign Up</button>
			<%} else{ %>
					<div class="user-nav">
					    <span class="welcome">Welcome, <%= name %>!</span>
					
					    <a href="suggestItem" class="suggest-btn">Suggest Item</a>
					
					    <% if ("admin".equals(role)) { %>
					        <a href="admin" class="admin-link">Admin Panel</a>
					    <% } %>
					
					    <a href="logout" class="logout-link">Logout</a>
					</div>
			<%} %>
		</div>

	</header>
	
	<main>
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
					<p>New here? <a href="javascript:void(0)" onclick="toggleForms()">Create an Account</a></p>
				</div>
			</div>
		</div>
		<h3 class ="tagline">Know Where Your <span class="highlight">Waste Belongs</span></h3>
		<p class="subtitle">Search any waste items and learn how to dispose of it responsibly.</p>
		
		<form action="searchWaste" method="get" id="searchBox">
			<input type="text" name="waste" placeholder="Search any waste item... (e.g. banana, battery, bottle)">
			<button type="submit" class="searchBtn">Search</button>
		</form>
	
		<div id="categories">
			<a href="searchWaste?category=Wet" class="catCard" id="wet-waste">
				<h2>Wet Waste</h2>
			</a>
			<a href="searchWaste?category=Dry" class="catCard" id="dry-waste">
				<h2>Dry Waste</h2>
			</a>
			<a href="searchWaste?category=Electronic" class="catCard" id="e-waste">
				<h2>E-Waste</h2>
			</a>
			<a href="searchWaste?category=Hazardous" class="catCard" id="hazardous-waste">
				<h2>Hazardous Waste</h2>
			</a>
		</div>
		

	</main>
	
	<footer>
		<a href="searchWaste?all=true" class="view-all-btn"> View All Waste Items</a>
		<!-- <a href="recycleInfo">Recycling Number</a>
		<a href="disposeGuide">Guide to Dispose</a>-->
		<a href="DisposalPointServlet">Disposal Points</a>
	</footer>
	
	
</body>
</html>