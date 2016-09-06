package com.vindixit.toggl2timesheet.model;

import java.util.Date;

public class SimpleTimeEntry extends TimeEntry {

	public SimpleTimeEntry(String jsonString) {
		super(jsonString);
	}

	public String getDuration() {
	    return new Long(duration).toString();
	}

	public String getStart() {
	    return start.toString();
	}

	public String getStop() {
	    return stop.toString();
	}

	public Long getRawDuration() {
		return duration;
	}
	
	public Date getRawStart() {
		return start;
	}
	
	public Date getRawStop() {
		return stop;
	}
	
	public String getDescription() {
	    return description;
	}

}
