package com.techelevator.npgeek;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.model.Park;
import com.techelevator.model.ParkDAO;
import com.techelevator.model.Survey;
import com.techelevator.model.SurveyDAO;
import com.techelevator.model.Weather;
import com.techelevator.model.WeatherDAO;

@Controller
public class ParkController {
	
	@Autowired
	ParkDAO parkDAO;
	@Autowired
	SurveyDAO surveyDAO;
	@Autowired
	WeatherDAO weatherDAO;
	
	@RequestMapping(path="/", method= RequestMethod.GET)  // <--- the path ("/") and the method = GET
	public String displayHomePage(ModelMap map) {
		List<Park> parkList = parkDAO.getAllParks();
		map.addAttribute("parkList", parkList);
		return "homePage";
	}
	
//	@RequestMapping(path="/parkDetail", method= RequestMethod.GET)
//	public String showPark(HttpServletRequest request ) {
//		String parkCode = request.getParameter("parkCode");	// <-- "passed" the parkCode
//		List<Park> parkList = parkDAO.getAllParks();	// <-- change to Map<> ?
//		for (Park park : parkList) {
//			if(park.getParkcode().equals(parkCode)) {	// <-- (parkcode) name from Park.java
//				request.setAttribute("park", park);
//			}
//		}
//		return "park"; // <-- jsp name without ".jsp"
//	}
	
	@RequestMapping(path="/surveyInput", method= RequestMethod.GET)
	public String displaySurvey() {
		return "surveyInput";
	}
	
	@RequestMapping(path="/surveyInput", method= RequestMethod.POST)
	public String collectSurvey(Survey survey) {
		surveyDAO.save(survey);
		return "surveyResults";
	}
	
//	@RequestMapping(path="/weather", method= RequestMethod.GET)
//	public String displayWeather(@RequestParam String parkcode, HttpServletRequest request, ModelMap map) {
//		String tempUnit = request.getParameter("tempUnit");
//		if (tempUnit == null) {
//			if (map.containsKey("tempUnit")) {
//				tempUnit=(String)map.get("tempUnit");
//			} else {
//				tempUnit="fahrenheit";
//			}
//			map.put("tempUnit", tempUnit);
//			List<Weather> weather = WeatherDAO.getAllParkWeather(parkcode);
//			request.setAttribute("weather", weather);
//			return "park";
//		}
//	}
	
	@RequestMapping(path="/parkDetail", method=RequestMethod.GET)
	public String displayDetails(HttpServletRequest request) {
		String parkCode = request.getParameter("parkcode");
		
		//Get the parks
		Park park = parkDAO.getParkByParkCode(parkCode);
		request.setAttribute("park", park);
		
		
		//Get the weather
		List<Weather> weather = weatherDAO.getWeatherByParkCode(parkCode);
		request.setAttribute("weather", weather);
		
		return "park";
	}
}
