package com.sportmgmt.utility.common;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
//import java.util.Calendar;  
import javax.servlet.jsp.JspException;  
import javax.servlet.jsp.JspWriter;  
import javax.servlet.jsp.tagext.TagSupport; 
public class SportMgmtTag extends TagSupport{
	
	private Integer position;  
	private String playerType;
	
	public Integer getPosition() {
		return position;
	}

	public void setPosition(Integer position) {
		this.position = position;
	}

	public String getPlayerType() {
		return playerType;
	}

	public void setPlayerType(String playerType) {
		this.playerType = playerType;
	}

	public int doStartTag() throws JspException {  
	    //JspWriter out=pageContext.getOut();//returns the instance of JspWriter  
	    try{  
	     //out.print(Calendar.getInstance().getTime());//printing date and time using JspWriter
	    	
	    	//pageContext.setAttribute("name", "My name is Gentle Man");
	    	boolean isPlayerAvail = false;
	    	String gameClubPlayerId = "";
	    	if(position !=null && playerType !=null && !playerType.equals(""))
	    	{
	    		HttpServletRequest request = (HttpServletRequest)pageContext.getRequest();
		    	HttpSession session = request.getSession();
				Map userGameMap = (Map)session.getAttribute("userGameDetails");
				if(userGameMap != null && userGameMap.size() >0)
				{
					List<Map<String,String>> userPlayersList = (List<Map<String,String>>)userGameMap.get("playerList");
					int count=1;
					for(Object userPlayerObj:userPlayersList)
					{
						Map<String,String> userPlayerMap = (Map<String,String>)userPlayerObj;
						if(userPlayerMap.get("playerType") !=null && userPlayerMap.get("playerType").equals(playerType))
						{
							if(count == position)
							{
								if(userPlayerMap.get("gameClubPlayerId") != null && !userPlayerMap.get("gameClubPlayerId").equals(""))
								{
									isPlayerAvail = true;
									gameClubPlayerId = (String)userPlayerMap.get("gameClubPlayerId");
									if(userPlayerMap.get("isPlaying") != null && !userPlayerMap.get("isPlaying").equals(""))
									pageContext.setAttribute("isPlaying", userPlayerMap.get("isPlaying"));
									if(userPlayerMap.get("playerType") != null && !userPlayerMap.get("playerType").equals(""))
									pageContext.setAttribute("playerType", userPlayerMap.get("playerType"));
									if(userPlayerMap.get("playerCategory") != null && !userPlayerMap.get("playerCategory").equals(""))
									pageContext.setAttribute("playerCategory", userPlayerMap.get("playerCategory"));
								}
								break;
							}
							count++;
						}
					}
				}
				
				if(isPlayerAvail)
				{
					pageContext.setAttribute("gameClubPlayerId", gameClubPlayerId);
					List<Map<Object,Object>> playerList = (List<Map<Object,Object>>)session.getAttribute("playerList");
					if(playerList !=null && playerList.size() >0)
					{
						for(Object playerObj:playerList)
						{
							Map playerMap = (Map)playerObj;
							if(playerMap.get("gameClubPlayerId") != null && playerMap.get("gameClubPlayerId").equals(gameClubPlayerId))
							{
									if(playerMap.get("name") != null && !playerMap.get("name").equals(""))
									pageContext.setAttribute("playerName", playerMap.get("name"));
									if(playerMap.get("price") != null)
									pageContext.setAttribute("price", playerMap.get("price"));
									pageContext.setAttribute("clubId", playerMap.get("clubId"));
							}
						}
					}
				}
			}
	    	pageContext.setAttribute("isPlayerAvail", new Boolean(isPlayerAvail));
	    	if(!isPlayerAvail)
	    	{
	    		pageContext.setAttribute("gameClubPlayerId", gameClubPlayerId);
	    		pageContext.setAttribute("playerName", "");
	    		pageContext.setAttribute("price", 0);
	    		pageContext.setAttribute("isPlaying", "");
	    		pageContext.setAttribute("playerType", "");
	    		pageContext.setAttribute("playerCategory", "");
	    		pageContext.setAttribute("clubId", "");
	    	}
	    	position = null;
	    	playerType = null;
	    }catch(Exception e){System.out.println(e);}  
	    return SKIP_BODY;//will not evaluate the body content of the tag  
	}  

}
