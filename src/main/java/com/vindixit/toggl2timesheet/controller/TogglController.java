package com.vindixit.toggl2timesheet.controller;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import com.google.api.services.sheets.v4.Sheets.Spreadsheets;
import com.google.api.services.sheets.v4.model.Spreadsheet;
import com.google.api.services.sheets.v4.model.ValueRange;
import com.vindixit.toggl2timesheet.model.TogglForm;

@Controller
public class TogglController {

	private static HttpTransport HTTP_TRANSPORT;
	private static GoogleAuthorizationCodeFlow flow;
	private static Credential credential;
	/*
	 * masaru@logusinfo.com.br
	 */
	private static String CLIENT_ID = "521236566498-56aiij0qacfflsf9fd7ct1fqoju2apnp.apps.googleusercontent.com";
	private static String CLIENT_SECRET = "VfC8T3K1ZHdABQCfDbqAl1el";
	private static String REDIRECT_URI = "http://localhost:8080/Toggl2TimeSheet/toggl";
	private static final JsonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();
	private static final String APPLICATION_NAME = "Toggl2TimeSheet";

	@RequestMapping(value = "/toggl.do", method = RequestMethod.GET)
	public RedirectView service(Model model) {
		TogglForm togglForm = new TogglForm();
		model.addAttribute("toggl", togglForm);
		if (credential != null) {
			Sheets service;
			try {
				service = getSheetsService();
				String spreadsheetId = togglForm.getUrl();
				Spreadsheets spreadsheets = service.spreadsheets();

				Spreadsheet spreadsheet = spreadsheets.get(spreadsheetId).setIncludeGridData(false).execute();
				String gridName = spreadsheet.getSheets().get(spreadsheet.getSheets().size() - 1).getProperties()
						.getTitle();
				System.out.println(gridName);
				String range = gridName + "!A2:AT";
				ValueRange response = service.spreadsheets().values().get(spreadsheetId, range).execute();
				List<List<Object>> values = response.getValues();
				return new RedirectView("toggl");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
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

	public static Sheets getSheetsService() throws IOException {
		return new Sheets.Builder(HTTP_TRANSPORT, JSON_FACTORY, credential).setApplicationName(APPLICATION_NAME)
				.build();
	}

}