<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "func" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div class="park">
<div class = "container">

	<c:forEach items="${parkList}" var="park">
		<c:url var="detail" value="/parkDetail">
			<c:param name="parkCode" value="${park.parkcode}"></c:param>
		</c:url>
		
	
		<div class = "container-fluid container-park-info">
		<div class = "row">
		<div class = "col-md-6">
		<div class = "parkpicturehome clearfix pull-left">
			<c:url var="parkpicture" value="img/parks/${func:toLowerCase(park.parkcode)}.jpg" />
			<a href="${detail}" id="parkDetailLinkPicture"> <img src="${parkpicture}" /></a>
		</div>
		</div>
		<div class = "col-md-6">
		<div class="park parkwords clearfix pull-right">
			<h4>
				<a href="${detail}" id="parkDetailLinkName"><c:out value="${park.parkname}"/> </a><c:out value=" - ${park.state}" />
			</h4>
			<p id="theParkDescription">
				<c:out value="${park.parkdescription}" />
			</p>
			</div>
			
			
			
			<hr id="spanner"></hr>
			
			</div>
			</div>
		
	</c:forEach>
	</div>
	</div>
	
	</div>
	

<c:import url="/WEB-INF/jsp/common/footer.jsp" />