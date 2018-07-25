package com.techelevator.model;

import java.util.List;

public interface SurveyDAO {
	
	public List<Survey> getParkSurveys();
	public List<Survey> getSurveyByParkCode(String parkCode);
	public void save(Survey survey);
	
}