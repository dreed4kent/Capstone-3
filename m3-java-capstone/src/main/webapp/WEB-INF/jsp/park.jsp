<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div class="park">
	<div>
		<c:import url var="parkPicture" value="img/parks/${park.parkCode}.jpg"/>
		<img src="${parkPicture}"/>
	</div>
</div>