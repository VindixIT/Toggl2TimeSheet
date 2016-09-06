package com.vindixit.toggl2timesheet.model;

import java.util.List;

public class ResponseWrapper {

	List<TimeEntry> timeEntries;
	
	List<String> abas;

	public ResponseWrapper(List<TimeEntry> timeEntries) {
		this.timeEntries = timeEntries;
	}

	public List<TimeEntry> getTimeEntries() {
		return timeEntries;
	}

	public void setTimeEntries(List<TimeEntry> timeEntries) {
		this.timeEntries = timeEntries;
	}

	public List<String> getAbas() {
		return abas;
	}

	public void setAbas(List<String> abas) {
		this.abas = abas;
	}

}
