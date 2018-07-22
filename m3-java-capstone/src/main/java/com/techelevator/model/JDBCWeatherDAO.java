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
//		String sqlRequestWeather = "SELECT * FROM weather WHERE parkcode = ?";
//		SqlRowSet allWeather = jdbcTemplate.queryForRowSet(sqlRequestWeather);
//		List<Weather> weatherList = new ArrayList<>();
//		
//		while (allWeather.next()) {
//			Weather weather = new Weather();
//			weather.setParkcode(allWeather.getString("parkcode"));
//			weather.setFivedayforecastvalue(allWeather.getInt("fivedayforecastvalue"));
//			weather.setLow(allWeather.getInt("low"));
//			weather.setHigh(allWeather.getInt("high"));
//			weather.setForecast(allWeather.getString("forecast"));
//		}
		return null;
	}

	@Override
	public List<Weather> getWeatherByParkCode(String parkCode) {

		List<Weather> weatherByParkCode = new ArrayList<Weather>();
		String sqlGetWeatherByParkCode = "SELECT * FROM Weather JOIN park ON park.parkCode = weather.parkCode WHERE park.parkCode = ? ORDER BY park.parkName";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetWeatherByParkCode, parkCode);
		while(results.next()){
			Weather weather = mapRowToWeather(results);
			weatherByParkCode.add(weather);
		}
			
		return weatherByParkCode;
	}
	
	private Weather mapRowToWeather(SqlRowSet results){
		Weather weather;
		weather = new Weather();
		weather.setParkcode(results.getString("parkCode"));
		weather.setFivedayforecastvalue(results.getInt("fiveDayForecastValue"));
		weather.setLow(results.getInt("low"));
		weather.setHigh(results.getInt("high"));
		weather.setForecast(results.getString("forecast"));
		return weather;
	}
}
