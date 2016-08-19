package com.sportmgmt.utility.common;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.log4j.Logger;

import com.sportmgmt.controller.action.UserAction;

public class SportMgmtExtTag extends TagSupport{
	private Logger logger = Logger.getLogger(SportMgmtExtTag.class);
	private String retrieve;
	
	public String getRetrieve() {
		return retrieve;
	}

	public void setRetrieve(String retrieve) {
		this.retrieve = retrieve;
	}

	public int doStartTag() throws JspException {  
	    //JspWriter out=pageContext.getOut();//returns the instance of JspWriter  
	    try{  
	     //out.print(Calendar.getInstance().getTime());//printing date and time using JspWriter
	    	
		    	//pageContext.setAttribute("name", "My name is Gentle Man");
		    	boolean isPlayerAvail = false;
		    	String gameClubPlayerId = "";
		    	if(retrieve !=null && !retrieve.equals(""))
		    	{
		    		switch(retrieve)
		    		{
		    			case "priceList": pageContext.setAttribute(retrieve, getPriceList());
		    			break;
		    		}
		    	}
	    	}
	    	catch(Exception ex)
	    	{
	    		logger.error("--- Error: "+ex);
	    	}
	    	return SKIP_BODY;//will not evaluate the body content of the tag  
	}  
	public HashSet getPriceList()
	{
		logger.debug("---------- Entry in getPriceList: ");
		HttpServletRequest request = (HttpServletRequest)pageContext.getRequest();
    	HttpSession session = request.getSession();
		HashSet priceList = new HashSet();
		ArrayList playerList = (ArrayList)session.getAttribute("playerList");
		if(playerList != null && playerList.size() > 0)
		{
			for(Object playerObj:playerList)
			{
				Map<String,String> playerMap = (Map<String,String>)playerObj;
				priceList.add(playerMap.get("price"));
			}
		
		}
		logger.debug("---------- Returning in price List: "+priceList);
	return priceList;
	}
}
