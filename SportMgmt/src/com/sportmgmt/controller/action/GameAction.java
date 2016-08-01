package com.sportmgmt.controller.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sportmgmt.model.manager.GameManager;
import com.sportmgmt.utility.common.MailUtility;
import com.sportmgmt.utility.common.PropertyFileUtility;
import com.sportmgmt.utility.constrant.ErrorConstrant;
import com.sportmgmt.utility.constrant.SportConstrant;

@Controller
@RequestMapping("/game")
public class GameAction {
	private Logger logger = Logger.getLogger(UserAction.class);
	@Autowired
	MailUtility mailUtility;
	public MailUtility getMailUtility() {
		return mailUtility;
	}
	public void setMailUtility(MailUtility mailUtility) {
		this.mailUtility = mailUtility;
	}
	@Autowired
	PropertyFileUtility propFileUtility;
	public PropertyFileUtility getPropFileUtility() {
		return propFileUtility;
	}
	public void setPropFileUtility(PropertyFileUtility propFileUtility) {
		this.propFileUtility = propFileUtility;
	}
	@RequestMapping(value = "AddPlayer", method = RequestMethod.GET)
	public @ResponseBody Map addPlayer(@RequestParam("userId") String userId, @RequestParam("gameClubPlayerId") String gameClubPlayerId,HttpServletRequest request)
	{
		Map resultMap = new HashMap();
		boolean isSuccess = false;
		String errorMessage = "";
		String errorCode = "";
		logger.debug("------------ addPlayer ");
		if(userId == null || userId.equals("") || gameClubPlayerId == null || gameClubPlayerId.equals(""))
		{
			errorMessage = "Parameter missing";
			errorCode = ErrorConstrant.INVALID_PARAMETER;
			logger.debug("------------ Parameter is invalid/missing ");
		}
		else
		{
			isSuccess = GameManager.addPlayeOfEventToUserAccount(userId, gameClubPlayerId);
			logger.debug("------------ Add Player Call isSuccess: "+isSuccess);
			if(isSuccess)
			{
				logger.debug("------------ Updating session and json value");
				try
				{
					HttpSession session = request.getSession();
					Map userGameMap = (Map)session.getAttribute("userGameDetails");
					String gameId = (String)((Map)session.getAttribute("gameDetails")).get("gameId");
					List<Map<String,String>> userPlayersList = (List<Map<String,String>>)userGameMap.get("playerList");
					Map<String,String> playerDetails = new HashMap<String,String>();
					playerDetails.put("gameClubPlayerId", gameClubPlayerId);
					playerDetails.put("isPlaying", SportConstrant.NO);
					playerDetails.put("playerType", SportConstrant.NULL);
					List playersList = (List)session.getAttribute("playerList");
					if(playersList.size()>0)
					{
						for(Object playerDetailObj :playersList)
						{
							Map playerDetailMap = (Map)playerDetailObj;
							if(playerDetailMap.get("gameClubPlayerId") !=null && playerDetailMap.get("gameClubPlayerId").equals(gameClubPlayerId))
							{
								playerDetails.put("playerType", (String)playerDetailMap.get("type"));
							}
						}
					}
					userPlayersList.add(playerDetails);
					Map totalMap = (Map)userGameMap.get("total");
					totalMap.put("player", (Integer)totalMap.get("player")+1);
					totalMap.put("price", GameManager.totalPlayersPriceOfUserByGame(Integer.valueOf(userId),Integer.valueOf(gameId)));
					GameManager.updateTotalPlayerByPostion(Integer.valueOf(userId),Integer.valueOf(gameId),totalMap);
					session.setAttribute("userGameDetails", userGameMap);
					resultMap.put("userGameJson", userGameMap);
				}
				catch(Exception ex)
				{
					logger.error("error to creating userGameJson: "+ex.getMessage());
					ex.printStackTrace();
				}
				
			}
			else
			{
				errorMessage = GameManager.getErrorMessage();
				errorCode = GameManager.getErrorCode();
			}
		}
		resultMap.put("isSuccess", isSuccess);
		resultMap.put("errorMessage", errorMessage);
		resultMap.put("errorCode", errorCode);
		logger.debug("Returning action: with reuslt-- : "+resultMap);
		return resultMap;
	}
	@RequestMapping(value = "RemovePlayer", method = RequestMethod.GET)
	public @ResponseBody Map removePlayer(@RequestParam("userId") String userId, @RequestParam("gameClubPlayerId") String gameClubPlayerId,HttpServletRequest request)
	{
		Map resultMap = new HashMap();
		boolean isSuccess = false;
		String errorMessage = "";
		String errorCode = "";
		logger.debug("------------ RemovePlayer ");
		if(userId == null || userId.equals("") || gameClubPlayerId == null || gameClubPlayerId.equals(""))
		{
			errorMessage = "Parameter missing";
			errorCode = ErrorConstrant.INVALID_PARAMETER;
			logger.debug("------------ Parameter is invalid/missing ");
		}
		else
		{
			isSuccess = GameManager.removePlayeOfEventFromUserAccount(userId, gameClubPlayerId);
			logger.debug("------------ Remove Player Call isSuccess: "+isSuccess);
			if(isSuccess)
			{
				logger.debug("------------ Updating session and json value");
				try
				{
					HttpSession session = request.getSession();
					Map userGameMap = (Map)session.getAttribute("userGameDetails");
					String gameId = (String)((Map)session.getAttribute("gameDetails")).get("gameId");
					List<Map<String,String>> userPlayersList = (List<Map<String,String>>)userGameMap.get("playerList");
					Map<String,String> playerDetails = null;
					for(Object userPlayerObj:userPlayersList)
					{
						Map<String,String> userPlayerMap = (Map<String,String>)userPlayerObj;
						if(userPlayerMap.get("gameClubPlayerId") !=null && userPlayerMap.get("gameClubPlayerId").equals(gameClubPlayerId))
						{
							playerDetails = userPlayerMap;
						}
					}
					if(playerDetails !=null)
					{
						userPlayersList.remove(playerDetails);
					}
					Map totalMap = (Map)userGameMap.get("total");
					totalMap.put("player", (Integer)totalMap.get("player")-1);
					totalMap.put("price", GameManager.totalPlayersPriceOfUserByGame(Integer.valueOf(userId),Integer.valueOf(gameId)));
					GameManager.updateTotalPlayerByPostion(Integer.valueOf(userId),Integer.valueOf(gameId),totalMap);
					session.setAttribute("userGameDetails", userGameMap);
					resultMap.put("userGameJson", userGameMap);
				}
				catch(Exception ex)
				{
					logger.error("error to creating userGameJson: "+ex.getMessage());
					ex.printStackTrace();
				}
				
			}
			else
			{
				errorMessage = GameManager.getErrorMessage();
				errorCode = GameManager.getErrorCode();
			}
		}
		resultMap.put("isSuccess", isSuccess);
		resultMap.put("errorMessage", errorMessage);
		resultMap.put("errorCode", errorCode);
		logger.debug("Returning action: with reuslt-- : "+resultMap);
		return resultMap;
	}
	@RequestMapping(value = "ActivatePlayer", method = RequestMethod.GET)
	public @ResponseBody Map activatePlayer(@RequestParam("userId") String userId, @RequestParam("gameClubPlayerId") String gameClubPlayerId,HttpServletRequest request)
	{
		logger.debug("------------ activate Player :-- calling update player");
		return updatePlayer(userId,gameClubPlayerId,SportConstrant.YES,request);
	}
	@RequestMapping(value = "DeActivatePlayer", method = RequestMethod.GET)
	public @ResponseBody Map deActivatePlayer(@RequestParam("userId") String userId, @RequestParam("gameClubPlayerId") String gameClubPlayerId,HttpServletRequest request)
	{
		logger.debug("------------ de-activate Player :-- calling update player");
		return updatePlayer(userId,gameClubPlayerId,SportConstrant.NO,request);
	}
	public Map updatePlayer(String userId, String gameClubPlayerId,String isPlaying, HttpServletRequest request)
	{
		Map resultMap = new HashMap();
		boolean isSuccess = false;
		String errorMessage = "";
		String errorCode = "";
		logger.debug("------------ update Player ");
		if(userId == null || userId.equals("") || gameClubPlayerId == null || gameClubPlayerId.equals(""))
		{
			errorMessage = "Parameter missing";
			errorCode = ErrorConstrant.INVALID_PARAMETER;
			logger.debug("------------ Parameter is invalid/missing ");
		}
		else
		{
			isSuccess = GameManager.updatePlayeOfEventFromUserAccount(userId, gameClubPlayerId,isPlaying);
			logger.debug("------------ update Player Call isSuccess: "+isSuccess);
			if(isSuccess)
			{
				logger.debug("------------ Updating session and json value");
				try
				{
					HttpSession session = request.getSession();
					Map userGameMap = (Map)session.getAttribute("userGameDetails");
					String gameId = (String)((Map)session.getAttribute("gameDetails")).get("gameId");
					List<Map<String,String>> userPlayersList = (List<Map<String,String>>)userGameMap.get("playerList");
					for(Object userPlayerObj:userPlayersList)
					{
						Map<String,String> userPlayerMap = (Map<String,String>)userPlayerObj;
						if(userPlayerMap.get("gameClubPlayerId") !=null && userPlayerMap.get("gameClubPlayerId").equals(gameClubPlayerId))
						{
							userPlayerMap.put("isPlaying", isPlaying);
						}
					}
					
					/*Map totalMap = (Map)userGameMap.get("total");
					totalMap.put("player", (Integer)totalMap.get("player")-1);
					totalMap.put("price", GameManager.totalPlayersPriceOfUserByGame(Integer.valueOf(userId),Integer.valueOf(gameId)));
					GameManager.updateTotalPlayerByPostion(Integer.valueOf(userId),Integer.valueOf(gameId),totalMap);*/
					session.setAttribute("userGameDetails", userGameMap);
					//resultMap.put("userGameJson", userGameMap);
				}
				catch(Exception ex)
				{
					logger.error("error to creating userGameJson: "+ex.getMessage());
					ex.printStackTrace();
				}
				
			}
			else
			{
				errorMessage = GameManager.getErrorMessage();
				errorCode = GameManager.getErrorCode();
			}
		}
		resultMap.put("isSuccess", isSuccess);
		resultMap.put("errorMessage", errorMessage);
		resultMap.put("errorCode", errorCode);
		logger.debug("Returning action: with reuslt-- : "+resultMap);
		return resultMap;
	}
}
