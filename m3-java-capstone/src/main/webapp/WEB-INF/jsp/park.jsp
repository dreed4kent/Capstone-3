<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div class="park">
	<div>
		<c:url var="parkPicture" value="img/parks/${park.parkCode}.jpg"/>
		<img src="${parkPicture}"/>
	</div>
	<div>
		<p><span id="description" ><c:out value="${park.parkDescription}" /></span></p><br>
		
		<p> <span id="quote"><c:out value="${park.inspirationalQuote}" /></span></p><br>
		<p>By <span id="source"> <c:out value="${park.inspirationalQuoteSource}" /></span></p><br>
	
		<c:url var= "parkDescription"/> <c:out value="${park.parkDescription}" /><br>
		<p>Acreage: <span id="description" ><c:out value="${park.acreage}" /></span></p><br>
		<p>Annual Visitors: <span id="description" ><c:out value="${park.annualVisitorCount}" /></span></p><br>
		<p>Climate: <span id="description" ><c:out value="${park.climate}" /></span></p><br>
		<p>Elevation: <span id="description" ><c:out value="${park.elevationInFeet}" /></span></p><br>
		<p>Entry Fee: <span id="description" ><c:out value="${park.entryFee}" /></span></p><br>
		<p>Miles Of Trail: <span id="description" ><c:out value="${park.milesOfTrail}" /></span></p><br>
		<p>Animal Species: <span id="description" ><c:out value="${park.numberOfAnimalSpecies}" /></span></p><br>
		<p>Number Of Campsites: <span id="description" ><c:out value="${park.numberOfCampsites}" /></span></p><br>
		<p>Year Founded: <span id="description" ><c:out value="${park.yearFounded}" /></span></p><br>
		
		<c:url var="forecast" value="/forecastDetail">
			<c:param name="parkCode" value="${park.parkCode}" />
	
		</c:url>
		<c:url var="formAction" value="/forecastDetail"></c:url>
	
		<p><a href="${forecast}" id="clock"><span id="forecastLink">Click here to view your 5-day weather report</span></a></p>
		
		<c:out value="${park.parkDescription}" />
	</div>
</div>