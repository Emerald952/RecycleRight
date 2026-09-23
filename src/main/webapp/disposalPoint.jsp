<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <title>RecycleRight - Disposal Points</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/leaflet.css" />
    
    <style>
        /* Give the map a height so it's visible */
        #map { 
            height: 600px; 
            width: 100%; 
            border-radius: 15px; 
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        }
        body { font-family: 'Poppins', sans-serif; background: radial-gradient(circle at center, #ffffff 0%, #fdfdfd 30%, #e9f0e6 50%,#bed1b0 100%); }
    </style>
    <link href="css/result.css" rel="stylesheet">
</head>
<body>
    <div style="padding: 20px; max-width: 800px; margin: auto;">
        <h2 style="text-align: center;">Disposal Points in Raipur</h2>

        <c:forEach items="${points}" var="p">
            <div class="place-card" onclick="toggleMap('${p.name}', ${p.latitude}, ${p.longitude}, this)">
                <div class="card-header">
                    <strong>${p.name}</strong>
                    <span class="category-tag">${p.getCategory()}</span>
                </div>
                
                <div class="card-details" style="display: none;">
                    <p>${p.getAddress()}</p>
                    <div id="map-container-${p.name}" class="mini-map" style="height: 250px; width: 100%;"></div>
                    <a href="${p.getWebURL()}" target="_blank" class="visit-btn">Visit Website</a>
                </div>
            </div>
        </c:forEach>
    </div>

    <style>
        .place-card {
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(10px);
            border-radius: 12px;
            padding: 15px;
            margin-bottom: 15px;
            cursor: pointer;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            transition: 0.3s;
        }
        .card-header { display: flex; justify-content: space-between; align-items: center; }
        .category-tag { background: #b2dfdb; padding: 4px 8px; border-radius: 5px; font-size: 0.8em; }
        .visit-btn { display: inline-block; margin-top: 10px; color: #00796b; text-decoration: none; font-weight: bold; }
    </style>

    <script src="${pageContext.request.contextPath}/js/leaflet.js"></script>
    <script>
        var activeMap = null;

        function toggleMap(name, lat, lng, cardElement) {
            var details = cardElement.querySelector('.card-details');
            var isOpening = details.style.display === 'none';

            // Close all other open cards first
            document.querySelectorAll('.card-details').forEach(el => el.style.display = 'none');

            if (isOpening) {
                details.style.display = 'block';
                
                // Initialize Leaflet on the specific div for this card
                // Note: We destroy and recreate to save memory
                if (activeMap) { activeMap.remove(); }
                
                activeMap = L.map('map-container-' + name).setView([lat, lng], 15);
                L.tileLayer('https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png').addTo(activeMap);
                L.marker([lat, lng]).addTo(activeMap);
            }
        }
    </script>
    
    	<div class="back">
		<a href="home.jsp" class="back-link">⬅ Back to Home</a>
	</div>
</body>
</html>