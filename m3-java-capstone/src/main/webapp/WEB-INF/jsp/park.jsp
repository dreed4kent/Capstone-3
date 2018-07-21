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
		
		<%-- Weather Section (below) --%>
		
		<h4>Your 5-day Weather Report</h4>
		<div>
			<table>
				<tr>
					<td></td>
					<td>Day</td>
					<td>Low</td>
					<td>High</td>
					<td>Forecast</td>
					<td>Advisory</td>
				</tr>
			<c:forEach var="weather" items="${weatherList}">
				<tr>
					<c:choose>
						<c:when test="${weather.forecast == 'partly cloudy'}">
							<c:url var="weatherPicture" value="img/weather/partlyCloudy.png" />
						</c:when>
						<c:otherwise>
							<c:url var="weatherPicture" value="img/weather/${weather.forecast}.png" />
						</c:otherwise>
					</c:choose>
					<td><img src="${weatherPicture}" /></td>
					<td><span id="dayNum"><c:out value="${weather.fiveDayForecastValue}" /></span></td>
					<c:choose>
						<c:when test = "${tempUnit=='farenheit'}">
							<td><span id="low"><c:out value="${weather.low}" /></span></td>
							<td><span id="high"><c:out value="${weather.high}" /></span></td>
						</c:when>
						<c:otherwise>
							<td><span id="clow"><fmt:formatNumber type="number" maxFractionDigits="2" value="${(weather.low-32)*5/9}" /></span></td>
							<td><span id="chigh"><fmt:formatNumber type="number" maxFractionDigits="2" value="${(weather.low-32)*5/9}" /></span></td>
						</c:otherwise>
					</c:choose>
					<ul>
					<td><span id="weather"><c:out value="${weather.forecast}" /></span></td>
				</tr>
			</c:forEach>
			</table>
			
			<form method="GET" action="${formAction}" id="forecastSubmit">
				<div>
					<c:choose>
						<c:when test="${tempUnit=='farenheit'}">
							<input type="hidden" name="tempUnit" value="celsius" />
							<input type="submit" value="Change to Celsius" id="button" />
						</c:when>
						<c:otherwise>
							<input type="hidden" name="tempUnit" value="farenheit" />
							<input type="submit" value="Change to Fahrenheit" />
						</c:otherwise>
					</c:choose>
				<input type = "hidden" name="parkcode" value="${param.parkcode}" />
				</div>
			</form>
		</div>
	</div> 
</div>