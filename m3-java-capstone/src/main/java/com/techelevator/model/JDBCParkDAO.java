package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCParkDAO implements ParkDAO {
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCParkDAO(DataSource datasource) {
		jdbcTemplate = new JdbcTemplate(datasource);	// lowercase, its passing the variables
	}
	
	@Override
	public List<Park> getAllParks() {
		ArrayList<Park> parks = new ArrayList<Park>();
		String sqlGetAllParks = "SELECT * FROM park";
		
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllParks);
		while(results.next()){
			Park park = mapRowToPark(results);
			parks.add(park);
		}
		return parks;
	}

//	@Override
//	public List<Park> getAllParks() {
//		String sqlRequestAllParks = "SELECT * FROM park ORDER BY parkname ASC";
//		SqlRowSet allParks = jdbcTemplate.queryForRowSet(sqlRequestAllParks);
//		List<Park> parkList = new ArrayList<>();
//		
//		while(allParks.next()) {
//			Park park = new Park();
//			park.setParkcode(allParks.getString("parkcode"));
//			park.setParkname(allParks.getString("parkname"));
//			park.setState(allParks.getString("state"));
//			park.setAcreage(allParks.getInt("acreage"));
//			park.setElevationinfeet(allParks.getInt("elevationinfeet"));
//			park.setMilesoftrail(allParks.getFloat("milesoftrail"));
//			park.setNumberofcampsites(allParks.getInt("numberofcampsites"));
//			park.setClimate(allParks.getString("climate"));
//			park.setYearfounded(allParks.getInt("yearfounded"));
//			park.setAnnualvisitorcount(allParks.getInt("annualvisitorcount"));
//			park.setInspirationalquote(allParks.getString("inspirationalquote"));
//			park.setInspirationalquotesource(allParks.getString("inspirationalquotesource"));
//			park.setParkdescription(allParks.getString("parkdescription"));
//			park.setEntryfee(allParks.getInt("entryfee"));
//			park.setNumberofanimalspecies(allParks.getInt("numberofanimalspecies"));
//			parkList.add(park);
//		}
//		return parkList;
//	}

//	@Override
//	public Park createPark(int acreage, int annualvisitorcount, String climate, int elevationinfeet, int entryfee,
//			String inspirationalquote, String inspirationalquotesource, float milesoftrail, int numberofanimalspecies,
//			int numberofcampsites, String parkcode, String parkdescription, String parkname, String state,
//			int yearfounded) {
//		// TODO Auto-generated method stub
//		return null;
//	}
	
	private Park mapRowToPark(SqlRowSet results){
		Park park;
		park = new Park();
		
		park.setParkcode(results.getString("parkcode"));
		park.setParkname(results.getString("parkname"));
		park.setState(results.getString("state"));
		park.setAcreage(results.getInt("acreage"));
		park.setElevationinfeet(results.getInt("elevationinfeet"));
		park.setMilesoftrail(results.getFloat("milesoftrail"));
		park.setNumberofcampsites(results.getInt("numberofcampsites"));
		park.setClimate(results.getString("climate"));
		park.setYearfounded(results.getInt("yearfounded"));
		park.setAnnualvisitorcount(results.getInt("annualvisitorcount"));
		park.setInspirationalquote(results.getString("inspirationalquote"));
		park.setInspirationalquotesource(results.getString("inspirationalquotesource"));
		park.setParkdescription(results.getString("parkdescription"));
		park.setEntryfee(results.getInt("entryfee"));
		park.setNumberofanimalspecies(results.getInt("numberofanimalspecies"));
		
		return park;
	}


	@Override
	public Park getParkByParkCode(String parkCode) {
		Park park = null;
		String sqlGetParkByParkCode = "SELECT * FROM park WHERE parkCode = ?";
		
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetParkByParkCode, parkCode.toUpperCase());
		if (results.next()){
			park = mapRowToPark(results);
		}
		return park;
	}

}
