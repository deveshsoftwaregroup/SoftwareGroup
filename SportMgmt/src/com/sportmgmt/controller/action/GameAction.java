package com.sportmgmt.controller.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sportmgmt.controller.bean.User;
import com.sportmgmt.model.manager.GameManager;
import com.sportmgmt.model.manager.PlanManager;
import com.sportmgmt.utility.common.MailUtility;
import com.sportmgmt.utility.common.PropertyFileUtility;
import com.sportmgmt.utility.constrant.ErrorConstrant;
import com.sportmgmt.utility.constrant.SportConstrant;

@Controller
@RequestMapping("/game")
public class GameAction {
	private Logger logger = Logger.getLogger(GameAction.class);
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
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("user");
			if(user != null)
			{
				boolean hasActivePlan = user.isHasActivePlan();
				if(hasActivePlan)
				{
					isSuccess = GameManager.addPlayeOfEventToUserAccount(userId, gameClubPlayerId);
					Integer price = null;
					logger.debug("------------ Add Player Call isSuccess: "+isSuccess);
					if(isSuccess)
					{
						
						logger.debug("------------ Updating session and json value");
						try
						{
							
							Map userGameMap = (Map)session.getAttribute("userGameDetails");
							String gameId = (String)((Map)session.getAttribute("gameDetails")).get("gameId");
							List<Map<String,String>> userPlayersList = (List<Map<String,String>>)userGameMap.get("playerList");
							Map<String,String> playerDetails = new HashMap<String,String>();
							playerDetails.put("gameClubPlayerId", gameClubPlayerId);
							playerDetails.put("isPlaying", SportConstrant.NO);
							playerDetails.put("playerType", SportConstrant.NULL);
							playerDetails.put("playerType", SportConstrant.NULL);
							playerDetails.put("playerCategory", SportConstrant.PLAYER_TYPE_NORMAL);
							playerDetails.put("playerSeqNum", "0");
							List playersList = (List)session.getAttribute("playerList");
							if(playersList.size()>0)
							{
								for(Object playerDetailObj :playersList)
								{
									Map playerDetailMap = (Map)playerDetailObj;
									if(playerDetailMap.get("gameClubPlayerId") !=null && playerDetailMap.get("gameClubPlayerId").equals(gameClubPlayerId))
									{
										playerDetails.put("playerType", (String)playerDetailMap.get("type"));
										price = (Integer)playerDetailMap.get("price");
									}
								}
							}
							userPlayersList.add(playerDetails);
							Map totalMap = (Map)userGameMap.get("total");
							totalMap.put("player", (Integer)totalMap.get("player")+1);
							totalMap.put("price", GameManager.totalPlayersPriceOfUserByGame(Integer.valueOf(userId),Integer.valueOf(gameId)));
							GameManager.updateTotalPlayerByPostion(Integer.valueOf(userId),Integer.valueOf(gameId),totalMap);
							session.setAttribute("userGameDetails", userGameMap);
							ObjectMapper mapperObj = new ObjectMapper();
							 try
							 {
								 
								 String userGameJson = mapperObj.writeValueAsString(userGameMap);
								 logger.debug("--------  : userGameJson: "+userGameJson);
								 session.setAttribute("userGameJson", userGameJson);
								 
							 }
							 catch(Exception ex)
							 {
								 logger.error("---------- Entry in parsing map to json: "+ex);
							 }


							resultMap.put("userGameJson", userGameMap);
							GameManager.increaseAddedPlayerCountToUserGame(userId,gameId);
							if((Integer)totalMap.get("player") ==15)
							{
								GameManager.checkAndIsertUserGameStatus(userId,gameId);
							}
							logger.debug("--------  : Starting deducting point: "+price);
							if(price != null && user.getActivePlan() != null && user.getActivePlan().getPlanTypeVal() == 0)
							{
								logger.debug("--------  : plan typ vlaue: "+user.getActivePlan().getPlanTypeVal());
								try
								{
									double balance = PlanManager.deductPointFromUserPlan(user.getActivePlan().getUserPlanId(), price.doubleValue());
									user.getActivePlan().setBalance(balance);
									resultMap.put("activePlanBalance", balance);
									logger.info("--------  : Now balance is: "+balance);
									if(balance <=0)
									{
										if(PlanManager.deActivateUserPlan(user.getActivePlan().getUserPlanId()))
										{
											logger.info("--------  :User Plan Deactivated ");
											user.setHasActivePlan(false);
										}
										else
										{
											logger.info("--------  :Failed to deactivate plan ");
										}
									}
								}
								catch(Exception ex)
								{
									logger.error("--------- Error in deducting point "+ex.getMessage());
								}
								
							}
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
				else
				{
					errorMessage = "No Plan is active to add the player";
					errorCode = "NO_PLAN_ACTIVE";
				}
			}
			else
			{
				errorMessage = "Invalid Sesison";
				errorCode = "ERROR_INVALID_SESSION";
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
					ObjectMapper mapperObj = new ObjectMapper();
					 try
					 {
						 
						 String userGameJson = mapperObj.writeValueAsString(userGameMap);
						 logger.debug("--------  : userGameJson: "+userGameJson);
						 session.setAttribute("userGameJson", userGameJson);
						 
					 }
					 catch(Exception ex)
					 {
						 logger.error("---------- Entry in parsing map to json: "+ex);
					 }


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
		return updatePlayer(userId,gameClubPlayerId,SportConstrant.YES,null,null,request);
	}
	@RequestMapping(value = "DeActivatePlayer", method = RequestMethod.GET)
	public @ResponseBody Map deActivatePlayer(@RequestParam("userId") String userId, @RequestParam("gameClubPlayerId") String gameClubPlayerId,HttpServletRequest request)
	{
		logger.debug("------------ de-activate Player :-- calling update player");
		return updatePlayer(userId,gameClubPlayerId,SportConstrant.NO,null,null,request);
	}
	@RequestMapping(value = "MakeCaptain", method = RequestMethod.GET)
	public @ResponseBody Map makeCaptain(@RequestParam("userId") String userId, @RequestParam("gameClubPlayerId") String gameClubPlayerId,HttpServletRequest request)
	{
		logger.debug("------------ MakeCaptain  :-- calling update player");
		List<Integer> playerList =GameManager.fetchUserPlayerOfEventByType(userId, SportConstrant.PLAYER_TYPE_CAPTAIN);
		Map updateMap = null;
		if(playerList != null && playerList.size() ==1)
		{
			updateMap= updatePlayer(userId,playerList.get(0).toString(),null,SportConstrant.PLAYER_TYPE_NORMAL,null,request);
		}
		if(updateMap == null || (Boolean)updateMap.get("isSuccess"))
		return updatePlayer(userId,gameClubPlayerId,null,SportConstrant.PLAYER_TYPE_CAPTAIN,null,request);
		else
		return updateMap;
	}
	@RequestMapping(value = "MakeViceCaptain", method = RequestMethod.GET)
	public @ResponseBody Map makeViceCaptain(@RequestParam("userId") String userId, @RequestParam("gameClubPlayerId") String gameClubPlayerId,HttpServletRequest request)
	{
		logger.debug("------------ MakeViceCaptain  :-- calling update player");
		List<Integer> playerList =GameManager.fetchUserPlayerOfEventByType(userId, SportConstrant.PLAYER_TYPE_VICE_CAPTAIN);
		Map updateMap = null;
		if(playerList != null && playerList.size() ==1)
		{
			updateMap= updatePlayer(userId,playerList.get(0).toString(),null,SportConstrant.PLAYER_TYPE_NORMAL,null,request);
		}
		if(updateMap == null || (Boolean)updateMap.get("isSuccess"))
		return updatePlayer(userId,gameClubPlayerId,null,SportConstrant.PLAYER_TYPE_VICE_CAPTAIN,null,request);
		else
		return updateMap;
	}
	public Map updatePlayer(String userId, String gameClubPlayerId,String isPlaying, String playerCategory,String seqNum,HttpServletRequest request)
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
			isSuccess = GameManager.updatePlayeOfEventFromUserAccount(userId, gameClubPlayerId,isPlaying,playerCategory,seqNum);
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
							if(isPlaying != null && !isPlaying.equals(""))
							userPlayerMap.put("isPlaying", isPlaying);
							if(playerCategory != null && !playerCategory.equals(""))
							{
								userPlayerMap.put("playerCategory",playerCategory);
							}
							if(seqNum != null && !seqNum.equals(""))
							{
								userPlayerMap.put("playerSeqNum",seqNum);
							}
						}
					}
					
					if(isPlaying != null && !isPlaying.equals(""))
					{
						 HashMap totalPlayingMap= new HashMap(); 
						 int player = GameManager.totalPlayingPlayersOfUserByGame(Integer.valueOf(userId),Integer.valueOf(gameId));
						 totalPlayingMap.put("player", player);
						 GameManager.updateTotalPlayingPlayerByPostion(Integer.valueOf(userId),Integer.valueOf(gameId),totalPlayingMap);
						 resultMap.put("totalPlayingJson", totalPlayingMap);;
					}
					
					/*totalMap.put("player", (Integer)totalMap.get("player")-1);
					totalMap.put("price", GameManager.totalPlayersPriceOfUserByGame(Integer.valueOf(userId),Integer.valueOf(gameId)));
					GameManager.updateTotalPlayerByPostion(Integer.valueOf(userId),Integer.valueOf(gameId),totalMap);*/
					session.setAttribute("userGameDetails", userGameMap);
					ObjectMapper mapperObj = new ObjectMapper();
					 try
					 {
						 
						 String userGameJson = mapperObj.writeValueAsString(userGameMap);
						 logger.debug("--------  : userGameJson: "+userGameJson);
						 session.setAttribute("userGameJson", userGameJson);
						 
					 }
					 catch(Exception ex)
					 {
						 logger.error("---------- Entry in parsing map to json: "+ex);
					 }

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
	@RequestMapping(value = "MyTeamView/{userId}/{gameId}", method = RequestMethod.GET)
	public  String changePasswordView(ModelMap modeMap,HttpServletRequest request,@PathVariable String userId,@PathVariable String gameId)
	{
		logger.debug("---------- IN MyTeamView to : ");
		 int player = GameManager.totalPlayingPlayersOfUserByGame(Integer.valueOf(userId),Integer.valueOf(gameId));
		 HashMap totalPlayingMap= new HashMap();
		 totalPlayingMap.put("player", player);
		 GameManager.updateTotalPlayingPlayerByPostion(Integer.valueOf(userId),Integer.valueOf(gameId),totalPlayingMap);
		 String totalPlayingJson = "";
		 modeMap.put("totalPlayingMap", totalPlayingMap);
		 logger.debug("-------- MyTeamView : totalPlayingMap: "+totalPlayingMap);
		 ObjectMapper mapperObj = new ObjectMapper();
		 try
		 {
			 
			 totalPlayingJson = mapperObj.writeValueAsString(totalPlayingMap);
			 logger.debug("-------- MyTeamView : totalPlayingJson: "+totalPlayingJson);
			 
		 }
		 catch(Exception ex)
		 {
			 logger.error("---------- Entry in parsing map to json: "+ex);
		 }
		 modeMap.put("totalPlayingJson", totalPlayingJson);
		 return SportConstrant.MY_TEAM_PAGE;
	}
}
