package com.vindixit.toggl2timesheet.util;

import com.sun.jersey.api.client.ClientHandlerException;
import com.sun.jersey.api.client.ClientRequest;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.filter.ClientFilter;

public class DelayFilter extends ClientFilter {

	private long throttlePeriod;

	public DelayFilter(long throttlePeriod) {
		if (throttlePeriod <= 0L) {
			throw new IllegalArgumentException("Must be positive throttlePeriod");
		}
		this.throttlePeriod = throttlePeriod;
	}

	@Override
	public ClientResponse handle(ClientRequest cr) throws ClientHandlerException {
		try {
			Thread.sleep(throttlePeriod);
		} catch (InterruptedException e) {
			// ignore, except to propagate
			Thread.currentThread().interrupt();
		}
		return getNext().handle(cr);
	}

}