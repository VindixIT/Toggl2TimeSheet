package com.vindixit.toggl2timesheet.model;

import java.util.List;

import com.vindixit.toggl2timesheet.TimeEntry;

public class TogglForm {

	private String urlSpreadSheet;
	private String startDate;
	private String endDate;
	private List<TimeEntry> timeEntries;

	public String getUrlSpreadSheet() {
		return urlSpreadSheet;
	}

	public void setUrlSpreadSheet(String urlSpreadSheet) {
		this.urlSpreadSheet = urlSpreadSheet;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public List<TimeEntry> getTimeEntries() {
		return timeEntries;
	}

	public void setTimeEntries(List<TimeEntry> timeEntries) {
		this.timeEntries = timeEntries;
	}
	
	

}
