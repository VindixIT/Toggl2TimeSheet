package com.vindixit.toggl2timesheet.service;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.ws.rs.core.MultivaluedMap;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.stereotype.Service;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.core.util.MultivaluedMapImpl;
import com.vindixit.toggl2timesheet.model.DateDecoratorTimeEntry;
import com.vindixit.toggl2timesheet.model.SimpleTimeEntry;
import com.vindixit.toggl2timesheet.model.TimeEntry;
import com.vindixit.toggl2timesheet.model.Toggl;
import com.vindixit.toggl2timesheet.model.TogglForm;
import com.vindixit.toggl2timesheet.util.DateUtil;
 
 
@Service("togglService")
public class TogglServiceImpl implements TogglService{
	
	private static final String PATTERN = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";

	@Override
	public List<TimeEntry> findTimeEntries(TogglForm form) {
		Toggl toggl = new Toggl(form.getUsername(), form.getPassword());
        Client client = toggl.prepareClient();
        WebResource webResource = client.resource(Toggl.TIME_ENTRIES);
        Date startDate = null;
        Date endDate = null;
		try {
			startDate = new SimpleDateFormat(PATTERN).parse(form.getStart());
			endDate = new SimpleDateFormat(PATTERN).parse(form.getEnd());
		} catch (ParseException e) {
			e.printStackTrace();
		}
        if (startDate != null && endDate != null) {
            MultivaluedMap<String,String> queryParams = new MultivaluedMapImpl();
            queryParams.add("start_date", DateUtil.convertDateToString(startDate));
            queryParams.add("end_date", DateUtil.convertDateToString(endDate));
            webResource = webResource.queryParams(queryParams);
        }
        String response = webResource.get(String.class);
        JSONArray data = (JSONArray) JSONValue.parse(response);

        List<TimeEntry> entries = new ArrayList<TimeEntry>();
        if (data != null) {
	        for (Object obj : data) {
	            JSONObject entryObject = (JSONObject) obj;
	            TimeEntry timeEntry = new DateDecoratorTimeEntry(new SimpleTimeEntry(entryObject.toJSONString()));
				entries.add(timeEntry);
	        }
        }
		return entries;
	}
 
}