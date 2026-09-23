<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Suggestion"%>
<%
	String role = (String) session.getAttribute("role");
	if (!"admin".equals(role)) {
		response.sendRedirect("home.jsp");
		return;
	}
	List<Suggestion> pendingList = (List<Suggestion>) request.getAttribute("pendingList");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Admin - Review Suggestions</title>
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
		    <span>Admin: <%= session.getAttribute("user") %></span>					
		    <a href="logout" class="logout-link">Logout</a>
		</div>
	</header>

	<main>
		<div class="admin-container">
			<h2>Pending Suggestions</h2>

			<% if (pendingList == null || pendingList.isEmpty()) { %>
				<p class="msg success">No pending suggestions right now.</p>
			<% } else { %>
				<% for (Suggestion s : pendingList) { %>
					<div class="suggestion-card">
						<h3><%= s.getName() %></h3>
						<p><strong>Category:</strong> <%= s.getCategory() %></p>
						<p><strong>Subcategory:</strong> <%= s.getSubcategory() %></p>
						<p><strong>Recyclable:</strong> <%= s.isRecyclable() ? "Yes" : "No" %></p>
						<p><strong>Disposal:</strong> <%= s.getDisposal() %></p>
						<p class="submitted-by">Submitted by: <%= s.getSubmittedBy() %></p>

						<div class="action-buttons">
							<form action="admin" method="POST" style="display:inline;">
								<input type="hidden" name="id" value="<%= s.getId() %>">
								<input type="hidden" name="action" value="approve">
								<button type="submit" class="approve-btn">✅ Approve</button>
							</form>
							<form action="admin" method="POST" style="display:inline;">
								<input type="hidden" name="id" value="<%= s.getId() %>">
								<input type="hidden" name="action" value="reject">
								<button type="submit" class="reject-btn">❌ Reject</button>
							</form>
						</div>
					</div>
				<% } %>
			<% } %>
		</div>
	</main>

	<div class="back">
		<a href="home.jsp" class="back-link">⬅ Back to Home</a>
	</div>
</body>
</html>
