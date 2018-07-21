<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<c:import url="/WEB-INF/jsp/common/header.jsp" />

<style>

.survey {
	background-color: white;
}

</style>

<div class="survey">

<c:url var="surveyFormURL" value="/survey/newSurvey"/>

<h2 class = "survey-title">Favorite Park Survey</h2>
<form method="POST" class="forms" action="${SurveyFormURL}">

	<div class="form-group">
	 <label for="favoritenationalpark">Vote for your Favorite National Park!</label>
	 <select class="form-control" id="favoritenationalpark" name="favoritenationalpark" >

	 	<option value="CVNP">Cuyahoga Valley National Park </option>
	 	<option value="ENP">Everglades National Park </option>
	 	<option value="GNP">Glacier National Park </option>
	 	<option value="GCNP">Grand Canyon National Park </option>
	 	<option value="GSMNP">Great Smoky Mountain National Park </option>
	 	<option value="GTNP">Grand Teton National Park </option>
	 	<option value="MRNP">Mount Ranier National Park </option>
	 	<option value="RMNP">Rocky Mountain National Park </option>
	 	<option value="YNP">Yellowstone National Park </option>
	 	<option value="YNP2">Yosemite National Park </option>
	 
	 
	 </select>
	 </div>

	 <label for="email">E-mail address:</label>
	 <input type="email" id="emailaddress" name="emailaddress">
	 
	 <div class="form-group">
	<label for="state" class="col-sm-2 control-label">State:</label>
	<div class="col-sm-10">
		<select class="form-control" id="state" name="state">
			<option value="">N/A</option>
			<option value="AK">Alaska</option>
			<option value="AL">Alabama</option>
			<option value="AR">Arkansas</option>
			<option value="AZ">Arizona</option>
			<option value="CA">California</option>
			<option value="CO">Colorado</option>
			<option value="CT">Connecticut</option>
			<option value="DC">District of Columbia</option>
			<option value="DE">Delaware</option>
			<option value="FL">Florida</option>
			<option value="GA">Georgia</option>
			<option value="HI">Hawaii</option>
			<option value="IA">Iowa</option>
			<option value="ID">Idaho</option>
			<option value="IL">Illinois</option>
			<option value="IN">Indiana</option>
			<option value="KS">Kansas</option>
			<option value="KY">Kentucky</option>
			<option value="LA">Louisiana</option>
			<option value="MA">Massachusetts</option>
			<option value="MD">Maryland</option>
			<option value="ME">Maine</option>
			<option value="MI">Michigan</option>
			<option value="MN">Minnesota</option>
			<option value="MO">Missouri</option>
			<option value="MS">Mississippi</option>
			<option value="MT">Montana</option>
			<option value="NC">North Carolina</option>
			<option value="ND">North Dakota</option>
			<option value="NE">Nebraska</option>
			<option value="NH">New Hampshire</option>
			<option value="NJ">New Jersey</option>
			<option value="NM">New Mexico</option>
			<option value="NV">Nevada</option>
			<option value="NY">New York</option>
			<option value="OH">Ohio</option>
			<option value="OK">Oklahoma</option>
			<option value="OR">Oregon</option>
			<option value="PA">Pennsylvania</option>
			<option value="PR">Puerto Rico</option>
			<option value="RI">Rhode Island</option>
			<option value="SC">South Carolina</option>
			<option value="SD">South Dakota</option>
			<option value="TN">Tennessee</option>
			<option value="TX">Texas</option>
			<option value="UT">Utah</option>
			<option value="VA">Virginia</option>
			<option value="VT">Vermont</option>
			<option value="WA">Washington</option>
			<option value="WI">Wisconsin</option>
			<option value="WV">West Virginia</option>
			<option value="WY">Wyoming</option>
		</select>
	</div>
</div>
	 
	 <div class = "activity-form">
	  <label for="activitylevel">Activity level:</label>
	  <div class ="container">
	  <div class ="row">
	  <div class ="col-md-3" ><label><input type="radio" name="activitylevel" value="inactive"> Inactive</label></div>
	  <div class ="col-md-3" ><label><input type="radio" name="activitylevel" value="sedentary"> Sedentary</label></div>
	  <div class ="col-md-3" ><label><input type="radio" name="activitylevel" value="active"> Active</label></div>
	  <div class ="col-md-3" ><label><input type="radio" name="activitylevel" value="extremelyactive"> Extremely Active</label></div> <br>
	</div>
	</div>
	</div>
	
	<input class="survey-submit" type="submit" value="submit" />

</form>	

</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />