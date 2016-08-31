package com.vindixit.toggl2timesheet.controller;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.ws.rs.core.MultivaluedMap;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.google.api.client.auth.oauth2.AuthorizationCodeRequestUrl;
import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.auth.oauth2.TokenResponse;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.drive.DriveScopes;
import com.google.api.services.sheets.v4.Sheets;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.core.util.MultivaluedMapImpl;
import com.vindixit.toggl2timesheet.model.TimeEntry;
import com.vindixit.toggl2timesheet.model.Toggl;
import com.vindixit.toggl2timesheet.model.TogglForm;
import com.vindixit.toggl2timesheet.util.DateUtil;

@Controller
public class TogglController {

	private static HttpTransport HTTP_TRANSPORT;
	private static GoogleAuthorizationCodeFlow flow;
	private static Credential credential;
	/*
	 * masaru@vindixit.com
	 */
//	private static String CLIENT_ID = "466497924499-js8fap6fktmrao13btga74ibjt4pl438.apps.googleusercontent.com";
//	private static String CLIENT_SECRET = "sbTA1m5fVAT1BMF2tO9hTu4g";
	/*
	 * masaru@logusinfo.com.br
	 */
	 private static String CLIENT_ID = "44576340185-2u983rv38nm19taqv4msoeadf6s1ra4k.apps.googleusercontent.com";
	 private static String CLIENT_SECRET = "BwjE-DEJlTxv2ivC9N9kh9Za";
	private static String REDIRECT_URI = "http://localhost:8080/Toggl2TimeSheet/toggl";
	private static final JsonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();
	private static final String APPLICATION_NAME = "Toggl2TimeSheet";
	private static final String PATTERN = "dd/MM/yyyy";

	@RequestMapping(value = "/toggl.do", method = RequestMethod.GET)
	public RedirectView service(Model model) {
		TogglForm togglForm = new TogglForm();
		model.addAttribute("toggl", togglForm);
		if (credential != null) {
			return new RedirectView("toggl");
		}
		return new RedirectView(authorize());
	}

	@RequestMapping(value = "/toggl", method = RequestMethod.GET)
	public String toggl(Model model) {
		return "toggl";
	}

	@RequestMapping(value = "/toggl", method = RequestMethod.GET, params = "code")
	public ModelAndView oauth2Callback(@RequestParam(value = "code") String code, ModelAndView mv) {
		TokenResponse response;
		try {
			response = flow.newTokenRequest(code).setRedirectUri(REDIRECT_URI).execute();
			credential = flow.createAndStoreCredential(response, "userID");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return mv;
	}

	private String authorize() {
		AuthorizationCodeRequestUrl authorizationUrl;
		if (flow == null) {
			try {
				HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();
			} catch (GeneralSecurityException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			flow = new GoogleAuthorizationCodeFlow.Builder(HTTP_TRANSPORT,
					JSON_FACTORY, CLIENT_ID, CLIENT_SECRET, Arrays.asList(DriveScopes.DRIVE,
							"https://spreadsheets.google.com/feeds", "https://docs.google.com/feeds"))
									.setAccessType("online").setApprovalPrompt("auto").build();
		}
		authorizationUrl = flow.newAuthorizationUrl().setRedirectUri(REDIRECT_URI);
		return authorizationUrl.build();
	}

	@RequestMapping(value = "/toggl", method = RequestMethod.POST)
	public String togglSubmit(@ModelAttribute TogglForm togglForm, Model model) {
		Toggl toggl = new Toggl("masaru@logusinfo.com.br", "Kawasemi123");
        Client client = toggl.prepareClient();
        WebResource webResource = client.resource(Toggl.TIME_ENTRIES);
        Date startDate = null;
        Date endDate = null;
		try {
			startDate = new SimpleDateFormat(PATTERN).parse("01/01/2015");
			endDate = new SimpleDateFormat(PATTERN).parse("31/01/2015");
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
	            TimeEntry timeEntry = new TimeEntry(entryObject.toJSONString());
				entries.add(timeEntry);
	        }
        }
		model.addAttribute("timeEntries", entries);
		return "exportResult";
	}
	
	public static Sheets getSheetsService() throws IOException {
		return new Sheets.Builder(HTTP_TRANSPORT, JSON_FACTORY, credential).setApplicationName(APPLICATION_NAME)
				.build();
	}
	
/*	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model) {
		return "index";
	}*/

}