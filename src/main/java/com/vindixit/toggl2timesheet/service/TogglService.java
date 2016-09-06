package com.vindixit.toggl2timesheet.service;

import java.util.List;

import com.vindixit.toggl2timesheet.model.TimeEntry;
import com.vindixit.toggl2timesheet.model.TogglForm;

public interface TogglService {

	List<TimeEntry> findTimeEntries(TogglForm form);

}