package com.vindixit.toggl2timesheet.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DateUtil {

	public static final String DATE_FORMAT = "yyyy-MM-dd'T'HH:mm:ss";

	private DateUtil() {
	}

	public static Date convertStringToDate(String dateString) {
		if (dateString == null)
			return null;

		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
		sdf.setTimeZone(TimeZone.getTimeZone("UTC-3"));
		Date date = null;
		try {
			date = sdf.parse(dateString);
		} catch (ParseException ex) {
			Logger.getLogger(DateUtil.class.getName()).log(Level.SEVERE, null, ex);
		}
		return date;
	}

	public static String convertDateToString(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
		int timezoneOffset = date.getTimezoneOffset();
		int hour = Math.abs(timezoneOffset / 60);
		int min = Math.abs(timezoneOffset % 60);
		String dateTime = sdf.format(date);
		String timeOffset = (timezoneOffset <= 0 ? "+" : "-") + (hour < 10 ? "0" : "") + hour + ":"
				+ (min < 10 ? "0" : "") + min;
		return dateTime + timeOffset;
	}
}