package com.vindixit.toggl2timesheet.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import com.vindixit.toggl2timesheet.model.ResponseWrapper;
import com.vindixit.toggl2timesheet.model.TimeEntry;
import com.vindixit.toggl2timesheet.model.TogglForm;
import com.vindixit.toggl2timesheet.service.TogglService;

@RestController
public class TogglRestController {

	@Autowired
	TogglService togglService;

	@RequestMapping(value = "/toggl/", method = RequestMethod.POST)
	public ResponseEntity<ResponseWrapper> findTimeEntries(@RequestBody TogglForm form,
			UriComponentsBuilder ucBuilder) {
		List<TimeEntry> timeEntries = togglService.findTimeEntries(form);
		if (timeEntries.isEmpty()) {
			return new ResponseEntity<ResponseWrapper>(HttpStatus.NO_CONTENT);
		}
		ResponseEntity<ResponseWrapper> responseEntity = new ResponseEntity<ResponseWrapper>(new ResponseWrapper(timeEntries), HttpStatus.OK);
		return responseEntity;
	}
	
	@RequestMapping(value = "/toggl/", method = RequestMethod.PUT)
	public ResponseEntity<ResponseWrapper> exportTimeEntries(@RequestBody TogglForm form,
			UriComponentsBuilder ucBuilder) {
		List<TimeEntry> timeEntries = togglService.findTimeEntries(form);
		if (timeEntries.isEmpty()) {
			return new ResponseEntity<ResponseWrapper>(HttpStatus.NO_CONTENT);
		}
		ResponseEntity<ResponseWrapper> responseEntity = new ResponseEntity<ResponseWrapper>(new ResponseWrapper(timeEntries), HttpStatus.OK);
		return responseEntity;
	}
	
}