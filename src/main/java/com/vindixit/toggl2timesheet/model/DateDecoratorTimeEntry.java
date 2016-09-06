package com.vindixit.toggl2timesheet.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

public class DateDecoratorTimeEntry extends TimeEntry {

	private SimpleTimeEntry simpleTimeEntry;
	private SimpleDateFormat sdf;

	public DateDecoratorTimeEntry(SimpleTimeEntry simpleTimeEntry) {
		this.simpleTimeEntry = simpleTimeEntry;
		sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");
	}

	public String getDuration() {
	    long millis = (1000 * simpleTimeEntry.getRawDuration());
	    TimeZone tz = TimeZone.getTimeZone("UTC");
	    SimpleDateFormat df = new SimpleDateFormat("HH:mm:ss");
	    df.setTimeZone(tz);
	    return df.format(new Date(millis));
	}

	public String getStart() {
	    Date start = simpleTimeEntry.getRawStart();
		return sdf.format(start);
	}

	public String getStop() {
		Date stop = simpleTimeEntry.getRawStop();
		return sdf.format(stop);
	}

	public String getDescription() {
	    String description = simpleTimeEntry.getDescription();
		return description;
	}

}
