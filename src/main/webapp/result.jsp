<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.WasteItem"%>
<%@ page import="java.util.Set"%>

<% 
	List<WasteItem> results = (List<WasteItem>) request.getAttribute("results");

	Boolean isCategorySearch = (Boolean) request.getAttribute("isCategorySearch");
	if(isCategorySearch == null)isCategorySearch = false;

	Set<String> subCategory = (Set<String>) request.getAttribute("resultsSubcat");

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>
		Recycle Right:
		<%=
			request.getAttribute("resultsHeading") != null
			? request.getAttribute("resultsHeading")
			: "Search Result"
		%>
	</title>
	<link href="css/home.css" rel="stylesheet">
	<link href="css/result.css" rel="stylesheet">
	<script src="js/card.js" defer></script>
</head>
<body>
	<div class = "container">
		<h1><%= request.getAttribute("resultsHeading") %></h1>
		
		
		
		<% if(results != null && !results.isEmpty()){
			if(isCategorySearch && subCategory != null && !subCategory.isEmpty()){
				for(String currCat: subCategory){ %>
					<div class="card" onclick="toggleDetails(this)">
						<div class="card-header">
							<h2>
								<%=currCat%>
								<span class="arrow">▼</span>
							</h2>
							
						</div>
						<%for(WasteItem item: results){
							if(item.getSubcategory().equalsIgnoreCase(currCat)){ %>
								<div class="card-content" style="display: none">
									<h3><%= item.getName() %></h3>
									<p><strong>Recyclable: </strong> <%= item.isRecyclable() ? "Yes": "No" %></p>
									<p><strong>Disposal Method: </strong> <%= item.getDisposal() %></p>	
									<hr>
								</div>
							<%} 
							}%>
					</div>
			<%}
			}else {
				for(WasteItem item: results){ %>
					<div class="card">
						<div class="card-header">
							<h2><%= item.getName() %></h2>
						</div>
						<div class="card-content">
							<p><strong>Category: </strong> <%= item.getCategory() %></p>
							<p><strong>Sub-category: </strong> <%= item.getSubcategory() %></p>
							<p><strong>Recyclable: </strong> <%= item.isRecyclable() ? "Yes": "No" %></p>
							<p><strong>Disposal Method: </strong> <%= item.getDisposal() %></p>	
							<hr>
						</div>
					</div>
				<%}
			}
		} else{%>
			<p class="not-found">No items found for this selection</p>
		<%}%>
	</div>
	
	<div class="back">
		<a href="home.jsp" class="back-link">⬅ Back to Home</a>
	</div>

</body>
</html>