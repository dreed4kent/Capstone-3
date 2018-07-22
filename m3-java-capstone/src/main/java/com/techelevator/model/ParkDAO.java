package com.techelevator.model;

import java.util.List;

public interface ParkDAO {
	
	List<Park> getAllParks();
	public Park getParkByParkCode(String parkCode);
	
//	public Park createPark(int acreage, int annualvisitorcount, String climate, int elevationinfeet, int entryfee,
//			String inspirationalquote, String inspirationalquotesource, float milesoftrail, int numberofanimalspecies,
//			int numberofcampsites, String parkcode, String parkdescription, String parkname, String state,
//			int yearfounded);
}