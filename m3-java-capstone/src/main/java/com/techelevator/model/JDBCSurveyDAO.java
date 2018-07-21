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
	public void visitorInput(Survey survey) {
		String sqlAddSurvey = "INSERT INTO survey_result(parkcode, emailaddress, state, activitylevel) VALUES (?, ?, ?, ?)";
		jdbcTemplate.update(sqlAddSurvey, survey.getParkcode(), survey.getEmailaddress(), survey.getState(), survey.getActivitylevel());
	}
	
	// this just gets it out of our website (below)
	
	@Override
	public List<Survey> getParkSurveys() {
		List<Survey> list = new ArrayList<>();
		String sqlParkSurveys = "SELECT *, COUNT parkcode FROM survey_result GROUP BY parkcode ORDER BY COUNT parkcode DESC LIMIT 1";
		SqlRowSet getParkSurveys = jdbcTemplate.queryForRowSet(sqlParkSurveys);
		// 1. loop through results
		// 2. create survey object
		// 3. set properties to survey object
		while (getParkSurveys.next()) {
			Survey survey = new Survey();
				survey.setParkcode(getParkSurveys.getString("parkcode"));
				survey.setActivitylevel(null);
				survey.setEmailaddress(null);
				survey.setState(null);
				survey.setSurveyid(0);
				list.add(survey);
		}
		// 4. add survey object to the list
//		for (Survey s : list) {
//		}
		// 5. return list
		return list;
	}

	@Override
	public void save(Survey survey) {
		// TODO Auto-generated method stub
		
	}
}