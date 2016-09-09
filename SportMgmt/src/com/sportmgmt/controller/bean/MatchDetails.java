package com.sportmgmt.controller.bean;

import java.util.Date;

public class MatchDetails implements Comparable{
private Date startTime;
private Date endTime;
private String firstClubName;
private String secondClubName;
public Date getStartTime() {
	return startTime;
}
public void setStartTime(Date startTime) {
	this.startTime = startTime;
}
public Date getEndTime() {
	return endTime;
}
public void setEndTime(Date endTime) {
	this.endTime = endTime;
}
public String getFirstClubName() {
	return firstClubName;
}
public void setFirstClubName(String firstClubName) {
	this.firstClubName = firstClubName;
}
public String getSecondClubName() {
	return secondClubName;
}
public void setSecondClubName(String secondClubName) {
	this.secondClubName = secondClubName;
}
@Override
public int compareTo(Object arg0) {
	// TODO Auto-generated method stub
	MatchDetails matchDetail = (MatchDetails)arg0;
	return this.startTime.compareTo(matchDetail.getStartTime());
}
}
