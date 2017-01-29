package com.sportmgmt.controller.response;

import java.util.List;

import com.sportmgmt.utility.exception.SportMgmtException;

public class SportMgmtResponse {
	
	private boolean isSuccess;
	private String message;
	private List<String> logList;
	private SportMgmtException error;
	public boolean isSuccess() {
		return isSuccess;
	}
	public void setSuccess(boolean isSuccess) {
		this.isSuccess = isSuccess;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public List<String> getLogList() {
		return logList;
	}
	public void setLogList(List<String> logList) {
		this.logList = logList;
	}
	public SportMgmtException getError() {
		return error;
	}
	public void setError(SportMgmtException error) {
		this.error = error;
	}
	
}
