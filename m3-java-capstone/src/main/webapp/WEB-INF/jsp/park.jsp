<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "func" %>


<div class="park">
	<div>

 	 <%-- <c:url var="parkPicture" value="img/parks/${park.parkcode}.jpg"/>   --%> 
		<img class="homepage-parks-image" src="img/parks/${func:toLowerCase(park.parkcode)}.jpg"/>   
	</div>
	<div>
		<p><span id="name"><c:out value="${park.parkname}" /></span></p>
	
		<p><span id="description" ><c:out value="${park.parkdescription}" /></span></p><br>
		
		<p> <span id="quote"><c:out value="${park.inspirationalquote}" /></span></p><br>
		<p>By <span id="source"> <c:out value="${park.inspirationalquotesource}" /></span></p><br>
	 

		<p>Acreage: <span id="description" ><c:out value="${park.acreage}" /></span></p>
		<p>Annual Visitors: <span id="description" ><c:out value="${park.annualvisitorcount}" /></span></p>
		<p>Climate: <span id="description" ><c:out value="${park.climate}" /></span></p>
		<p>Elevation: <span id="description" ><c:out value="${park.elevationinfeet}" /></span></p>
		<p>Entry Fee: <span id="description" ><c:out value="${park.entryfee}" /></span></p>
		<p>Miles Of Trail: <span id="description" ><c:out value="${park.milesoftrail}" /></span></p>
		<p>Animal Species: <span id="description" ><c:out value="${park.numberofanimalspecies}" /></span></p>
		<p>Number Of Campsites: <span id="description" ><c:out value="${park.numberofcampsites}" /></span></p>
		<p>Year Founded: <span id="description" ><c:out value="${park.yearfounded}" /></span></p>
	</div>
</div>

<%-- Weather Section (below) --%>

<div id="weather"> rfrfrfrfrfrfr
	<c:forEach var="weather" items="${weather}">
		<div>
			<c:choose>
				<c:when test="${weather.fiveDayForecastValue == 1}">
					<h3><c:out value="Today"></c:out></h3>
				</c:when>
				<c:when test="${weather.fiveDayForecastValue == 2}">
					<h4><c:out value="Tomorrow"></c:out></h4>
				</c:when>
				<c:when test="${weather.fiveDayForecastValue == 3}">
					<h4><c:out value="Day 3"></c:out></h4>
				</c:when>
				<c:when test="${weather.fiveDayForecastValue == 4}">
					<h4><c:out value="Day 4"></c:out></h4>
				</c:when>
				<c:when test="${weather.fiveDayForecastValue == 5}">
					<h4><c:out value="Day 5"></c:out></h4>
				</c:when>
			</c:choose>
		<img src="/m3-java-capstone/img/weather/${weather.forecast}.png"/>
		<br>
			<c:out value="Low: ${weather.low}"></c:out><br>
			<c:out value="High: ${weather.high}"></c:out>
			<br>
			<br>
			<c:choose>
				<c:when test="${weather.forecast == 'snow'}">
					<c:out value="Make sure you bring a heavy coat!"></c:out>
				</c:when>
				<c:when test="${weather.forecast == 'rain'}">
					<c:out value="Pack an umbrella!"></c:out>
				</c:when>
				<c:when test="${weather.forecast == 'sunny'}">
					<c:out value="Put on your best sunglasses!"></c:out>
				</c:when>
				<c:when test="${weather.forecast == 'thunderstorms'}">
					<c:out value="Take cover and watch for lightening!"></c:out>
				</c:when>
			</c:choose>
		</div>
	</c:forEach>
</div>