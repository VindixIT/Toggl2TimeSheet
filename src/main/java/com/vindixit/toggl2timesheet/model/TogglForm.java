package com.vindixit.toggl2timesheet.model;

import java.util.List;

public class TogglForm {

	private String urlSpreadSheet;
	private String login;
	private String senha;
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

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}
	
}
