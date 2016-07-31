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
					List userPlayersList = (List)userGameMap.get("playerList");
					userPlayersList.add(new Integer(gameClubPlayerId));
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
					List userPlayersList = (List)userGameMap.get("playerList");
					userPlayersList.remove(new Integer(gameClubPlayerId));
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

}
