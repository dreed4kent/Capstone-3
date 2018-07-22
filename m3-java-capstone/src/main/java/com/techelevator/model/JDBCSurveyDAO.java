package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCSurveyDAO implements SurveyDAO {
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCSurveyDAO(DataSource datasource) {
		jdbcTemplate = new JdbcTemplate(datasource);
	}

	@Override
	public List<Survey> getParkSurveys() {
		List<Survey> surveys = new ArrayList<Survey>();
		String sqlGetParkSurveys = "SELECT COUNT (parkCode) parkcode, emailaddress, state, activitylevel FROM survey_result GROUP BY parkCode, emailaddress, state, activitylevel ORDER BY COUNT DESC LIMIT 5";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetParkSurveys);
		while(results.next()) {
			Survey survey = mapRowToSurvey(results);
			surveys.add(survey);
		}
		return surveys;
	}
	
//	@Override
//	public List<Survey> getSurveyByParkCode(String parkCode) {
//		List<Survey> surveys = new ArrayList<Survey>();
//		String sqlGetParkSurveys = "SELECT COUNT (parkCode) parkcode, emailaddress, state, activitylevel FROM survey_result GROUP BY parkCode, emailaddress, state, activitylevel ORDER BY COUNT DESC LIMIT 5";
//		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetSurveyByParkCode);
//		while(results.next()) {
//			Survey survey = mapRowToSurvey(results);
//			surveyByParkCode.add(survey);
//		}
//		return surveyByParkCode;
//	}
	
	// this just gets it out of our website (below)
	
	private Survey mapRowToSurvey(SqlRowSet results) {
		Survey survey;
		survey = new Survey();
		survey.setParkcode(results.getString("parkcode"));
		survey.setEmailaddress(results.getString("emailaddress"));
		survey.setState(results.getString("state"));
		survey.setActivitylevel(results.getString("activitylevel"));
		return survey;
	}

//	@Override
//	public List<Survey> getParkSurveys1() {
//		List<Survey> list = new ArrayList<>();
//		String sqlParkSurveys = "SELECT *, COUNT parkcode FROM survey_result GROUP BY parkcode ORDER BY COUNT parkcode DESC LIMIT 1";
//		SqlRowSet getParkSurveys = jdbcTemplate.queryForRowSet(sqlParkSurveys);
//		// 1. loop through results
//		// 2. create survey object
//		// 3. set properties to survey object
//		while (getParkSurveys.next()) {
//			Survey survey = new Survey();
//				survey.setParkcode(getParkSurveys.getString("parkcode"));
//				survey.setActivitylevel(null);
//				survey.setEmailaddress(null);
//				survey.setState(null);
//				survey.setSurveyid(0);
//				list.add(survey);
//		}
//		// 4. add survey object to the list
////		for (Survey s : list) {
////		}
//		// 5. return list
//		return list;
//	}

	@Override								// O k a y
	public void save(Survey survey) {
		String sqlAddSurvey = "INSERT INTO survey_result(parkcode, emailaddress, state, activitylevel) VALUES (?, ?, ?, ?)";
		jdbcTemplate.update(sqlAddSurvey, survey.getParkcode(), survey.getEmailaddress(), survey.getState(), survey.getActivitylevel());
	}

	@Override
	public void visitorInput(Survey survey) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public List<Survey> getSurveyByParkCode(String parkCode) {
		// TODO Auto-generated method stub
		return null;
	}
}