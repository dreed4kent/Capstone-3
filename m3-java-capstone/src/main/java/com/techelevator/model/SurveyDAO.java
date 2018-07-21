package com.techelevator.model;

import java.util.List;

public interface SurveyDAO {
	
	public List<Survey> getParkSurveys();

	void visitorInput(Survey survey);

	void save(Survey survey);
	
}