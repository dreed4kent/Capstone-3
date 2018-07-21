<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<c:import url="/WEB-INF/jsp/common/header.jsp" />
<style>
.forumPosts{
	background-color:white;

}

.row:nth-child(odd){
	background-color: lightgrey;
}

h1 {
	text-align: center;
}
.link {
	display: block;
	text-align: center;
}
</style>

<div class="surveyResult">
<h1>Favorite National Parks</h1><br />
<c:url var="surveyResultURL" value="/survey/surveyResult"/>
<a class="link" href="${surveyResultURL}"></a>
<c:forEach var="park" items="${parkId}">

<div class="row">

<h2>${survey.name}</h2>
<p>${survey.count}</p>

</div>

</c:forEach>


</div>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />