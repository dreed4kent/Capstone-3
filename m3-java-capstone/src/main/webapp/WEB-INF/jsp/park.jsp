<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "func" %>


<div class="park">
	<div class = "container">
	<div class ="text-center">

 	 <%-- <c:url var="parkPicture" value="img/parks/${park.parkcode}.jpg"/>   --%> 
		<img class="homepage-parks-image detail-park-image img-fluid" src="img/parks/${func:toLowerCase(park.parkcode)}.jpg"/>   
		</div>
	</div>
	<div class = "container">
	<div class = "text-center">
		<h3><span class ="displayed-details" id="name"><c:out value="${park.parkname}" /></span></h3>

		<p> "<span class ="displayed-details" id="quote"><c:out value="${park.inspirationalquote}" /></span>" -<span class ="displayed-details" id="source"> <c:out value="${park.inspirationalquotesource}" /></span></p><br>
	</div>
		<p><span class ="displayed-details" id="description" ><c:out value="${park.parkdescription}" /></span></p><br>

		<p>Acreage: <span class ="displayed-details" id="description" ><c:out value="${park.acreage}" /></span></p>
		<p>Annual Visitors: <span class ="displayed-details" id="description" ><c:out value="${park.annualvisitorcount}" /></span></p>
		<p>Climate: <span class ="displayed-details" id="description" ><c:out value="${park.climate}" /></span></p>
		<p>Elevation: <span class ="displayed-details" id="description" ><c:out value="${park.elevationinfeet}" /></span></p>
		<p>Entry Fee: $<span class ="displayed-details" id="description" ><c:out value="${park.entryfee}" /></span></p>
		<p>Miles Of Trail: <span class ="displayed-details" id="description" ><c:out value="${park.milesoftrail}" /></span></p>
		<p>Animal Species: <span class ="displayed-details" id="description" ><c:out value="${park.numberofanimalspecies}" /></span></p>
		<p>Number Of Campsites: <span class ="displayed-details" id="description" ><c:out value="${park.numberofcampsites}" /></span></p>
		<p>Year Founded: <span class ="displayed-details" id="description" ><c:out value="${park.yearfounded}" /></span></p>
		</div>

<%-- Weather Section (below) --%>

 	<div class = "container">
		<div class = "text-center">
		<h4>Your 5-day Weather Report</h4> <%-- working --%>
		</div>
		<div>
			<table>
				<tr>
					<td></td>			<%-- working --%>
					<td>Day</td>		<%-- working --%>
					<td>Low</td>		<%-- working --%>
					<td>High</td>		<%-- working --%>
					<td>Forecast</td>	<%-- working --%>
					<td>Advisory</td>	<%-- working --%>
				</tr>
			<c:forEach var="weather" items="${weatherList}">
				<tr>
					<c:choose>
						<c:when test="${weather.forecast == 'partly cloudy'}">
							<img src="img/weather/${weather.forecast}.png" />
						</c:when>
						<c:otherwise>
							<img src="img/weather/${weather.forecast}.png" />
						</c:otherwise>
					</c:choose>
					<td><img src="${weatherPicture}" /></td>
					<td><span id="dayNum"><c:out value="${weather.fivedayforecastvalue}" /></span></td>
					<c:choose>
						<c:when test = "${tempUnit == 'farenheit'}">
							<td><span id="low"><c:out value="${weather.low}" /></span></td>
							<td><span id="high"><c:out value="${weather.high}" /></span></td>
						</c:when>
						<c:otherwise>
							<td><span id="low"><fmt:formatNumber type="number" maxFractionDigits="2" value="${(weather.low-32)*5/9}" /></span></td>
							<td><span id="high"><fmt:formatNumber type="number" maxFractionDigits="2" value="${(weather.high-32)*5/9}" /></span></td>
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
						<c:when test="${tempUnit =='farenheit'}">
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
</div>