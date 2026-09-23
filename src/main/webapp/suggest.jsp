<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user = (String) session.getAttribute("user");
	if (user == null) {
		response.sendRedirect("home.jsp?LoginError=true");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Suggest a Waste Item</title>
	<link href="css/home.css" rel="stylesheet">
	<link href="css/suggest.css" rel="stylesheet">
</head>
<body>
	<header>
		<div class="logo">
			<img src="images/logo.png">
			<span>Recycle Right</span>
		</div>
		<div class="user-nav">
		    <a href="logout" class="logout-link">Logout</a>
		</div>
		
	</header>

	<main>
		<div class="form-container">
			<h2>Suggest a Missing Waste Item</h2>
			<p class="form-subtitle">Can't find an item? Help us grow our database!</p>

			<% if ("success".equals(request.getParameter("status"))) { %>
				<p class="msg success">✅ Your suggestion has been submitted for review!</p>
			<% } else if ("error".equals(request.getParameter("status"))) { %>
				<p class="msg error">❌ Something went wrong. Please try again.</p>
			<% } %>

			<form action="suggestItem" method="POST">
				<label>Item Name:</label>
				<input type="text" name="name" placeholder="e.g. Styrofoam cup" required>

				<label>Category:</label>
				<select name="category" required>
					<option value="">-- Select Category --</option>
					<option value="Wet">Wet</option>
					<option value="Dry">Dry</option>
					<option value="Electronic">Electronic</option>
					<option value="Hazardous">Hazardous</option>
				</select>

				<label>Subcategory:</label>
				<input type="text" name="subcategory" placeholder="e.g. Packaging, Food Waste">

				<label>Recyclable?</label>
				<select name="recyclable">
					<option value="true">Yes</option>
					<option value="false" selected>No</option>
				</select>

				<label>Disposal Method:</label>
				<textarea name="disposal" rows="3" placeholder="e.g. Rinse and place in dry waste bin" required></textarea>

				<button type="submit">Submit Suggestion</button>
			</form>
		</div>
	</main>

	<div class="back">
		<a href="home.jsp" class="back-link">⬅ Back to Home</a>
	</div>
</body>
</html>
