package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCWeatherDAO implements WeatherDAO {
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCWeatherDAO(DataSource datasource) {
		jdbcTemplate = new JdbcTemplate(datasource);	// lowercase, its passing the variables
	}

	@Override
	public List<Weather> getAllWeather() {
		String sqlRequestWeather = "SELECT * FROM weather WHERE parkcode = ?";
		SqlRowSet allWeather = jdbcTemplate.queryForRowSet(sqlRequestWeather);
		List<Weather> weatherList = new ArrayList<>();
		
		while (allWeather.next()) {
			Weather weather = new Weather();
			weather.setParkcode(allWeather.getString("parkcode"));
			weather.setFivedayforecastvalue(allWeather.getInt("fivedayforecastvalue"));
			weather.setLow(allWeather.getInt("low"));
			weather.setHigh(allWeather.getInt("high"));
			weather.setForecast(allWeather.getString("forecast"));
		}
		return weatherList;
	}

}
