package com.techelevator.npgeek;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ParkController {
	
	@RequestMapping("/")
	public String displayHomePage() {
		return "homePage";
	}
}
