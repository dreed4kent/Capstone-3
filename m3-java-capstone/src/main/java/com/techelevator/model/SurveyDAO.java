package com.techelevator.model;

import java.util.List;

public interface SurveyDAO {
	
	public List<Survey> getParkSurveys();
	public List<Survey> getSurveyByParkCode(String parkCode);
	void save(Survey survey);
	
}