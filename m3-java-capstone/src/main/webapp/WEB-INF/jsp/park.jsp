<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<%--		
		<c:url var="forecast" value="/forecastDetail">
			<c:param name="parkCode" value="${park.parkcode}" />
	
		</c:url>
		<c:url var="formAction" value="/forecastDetail"></c:url>
	
		<p><a href="${forecast}" id="clock"><span id="forecastLink">Click here to view your 5-day weather report</span></a></p>
		
		<c:out value="${park.parkdescription}" /> --%>		
	</div> 
</div>