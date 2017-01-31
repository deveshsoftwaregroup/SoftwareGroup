package com.sportmgmt.utility.common;

import java.math.BigInteger;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import org.apache.log4j.Logger;

import com.sportmgmt.model.manager.GameManager;
import com.sportmgmt.model.manager.PlayerManager;
import com.sportmgmt.model.manager.PointRankManager;
import com.sportmgmt.utility.constrant.SportConstrant;
import com.sportmgmt.utility.exception.SportMgmtException;

public class PointRankingUtility {
	private Logger logger = Logger.getLogger(PointRankingUtility.class);
	private ApplicationDataUtility applicationDataUtility;
	
	public ApplicationDataUtility getApplicationDataUtility() {
		return applicationDataUtility;
	}
	public void setApplicationDataUtility(ApplicationDataUtility applicationDataUtility) {
		this.applicationDataUtility = applicationDataUtility;
	}
	
	private String logMessage;
	
	public String getlogMessage()
	{
		return logMessage;
	}
	private Integer getCurrentGameWeek(String gameId)
	{
		Integer gameWeekId = null;
		List<Object[]> currentGameWeek = GameManager.fetchCurrenGametWeek(new Integer(gameId));
		if(currentGameWeek != null && currentGameWeek.size() > 0)
		 {
			 gameWeekId = (Integer)currentGameWeek.get(0)[0];
		 }
	 return gameWeekId;
	}
	
	
	private boolean isDeadlineStart(String gameWeekId)
	{
		List<Timestamp> firstMatchOfGameWeek = GameManager.fetchFirstMatchOfGameWeek(new Integer(gameWeekId));
		if(firstMatchOfGameWeek != null && firstMatchOfGameWeek.size() >=0)
		 {
			Timestamp startTimeOfFirstMatch = firstMatchOfGameWeek.get(0);
			 int deadLineHrsBeforeStart = 0;
			 try
			 {
				 PropertyFileUtility  propFileUtility = new PropertyFileUtility();
				 deadLineHrsBeforeStart = Integer.parseInt(propFileUtility.getEnvProperty().getString(SportConstrant.DEADLINE_START_HRS));
			 }
			 catch(Exception ex)
			 {
				 logger.error("Exception from reading and parsing : "+ex.getMessage());
			 }
			 
			 long startDeadlineMils = startTimeOfFirstMatch.getTime() - TimeUnit.HOURS.toMillis(deadLineHrsBeforeStart);
			 long currentTimeMils = System.currentTimeMillis();
			 logger.debug("----------- startDeadlineMils: "+startDeadlineMils);
			 logger.debug("----------- currentTimeMils: "+currentTimeMils);
			 if(currentTimeMils >= startDeadlineMils)
			 {
				 logger.debug("----------- isUderDeadline: is true ");
				 return true;
			 }
		 }
		return false;
	}
	
	private String getLatestGameWeekId(String gameId)
	{
		Integer currentGameWeekId =getCurrentGameWeek(gameId);
		Integer lastGameWeekId = null; 
		if(currentGameWeekId == null || !isDeadlineStart(currentGameWeekId.toString()))
		{
			lastGameWeekId = getLastGameWeekId(gameId);
			if(lastGameWeekId !=null)
			{
				return lastGameWeekId.toString();
			}
		}
		else
		{
			return currentGameWeekId.toString();
		}
		return null;
	}
	
	private Integer getLastGameWeekId(String gameId)
	{
		return PointRankManager.getLastGameWeekId(gameId);
	}
	
	private boolean createPlayerHistoryForGameWeek(String gameId,String gameWeekId,String userId) throws SportMgmtException
	{
		logMessage = "";
		boolean isSuccess = true;
		if(PlayerManager.isGameWeekPlayerHistoryExist(userId, gameWeekId))
		{
			logger.info("Game Week Player Group history already found for user: "+userId+" and gameWeekId: "+gameWeekId);
		}
		else
		{
			List<Map<String,String>> userPlayersList = GameManager.userPlayerDetailsList(new Integer(userId),Integer.valueOf(gameId));
			if(userPlayersList != null && userPlayersList.size() !=0)
			{
				isSuccess = PlayerManager.createPlayerGroupWithPlayers(userPlayersList, userId, gameWeekId);
			}
			else
			{
				logger.info("player list of user is empty userId: "+userId);
				logMessage = "Failed to load player list for userId:"+userId;
				isSuccess = false;				
			}
		}
		
		return isSuccess;
	}
	
	public List<String> createPlayerHistoryForUsers(String gameId) throws SportMgmtException
	{
		try
		{
			List<Integer> userListOfGame = PlayerManager.userListOfGame(gameId);
			if(userListOfGame !=null && userListOfGame.size() !=0)
			{
				String gameWeekId =getLatestGameWeekId(gameId);
				if(gameWeekId != null && !gameWeekId.equals(""))
				{
					List<String> logList = new ArrayList<String>();
					for(Integer userIdBigInt:userListOfGame)
					{
						String userId = String.valueOf(userIdBigInt.intValue());
						logger.info("Going to create player history of user: "+userId+" for gameWeekId: "+gameWeekId+" of gameId: "+gameId);
						boolean isSuccess = createPlayerHistoryForGameWeek(gameId,gameWeekId,userId);
						logger.info("player history creation went :"+isSuccess);
						if(!isSuccess)
						{
							if(!logMessage.equals(""))
							{
								logList.add(logMessage);
							}
							else
							{
								logList.add("Failed userId="+userId+" gameWeekId="+gameWeekId);
							}
						}
						
					}
					return logList;
				}
				else
				{
					logger.info("skiping to create player history of users, becuase of game week id is empty:");
					throw new SportMgmtException("game week id is empty");
				}
			}
			else
			{
				logger.info("User List for game: "+gameId+" is empty");
				throw new SportMgmtException("User List for game: "+gameId+" is empty");
			}
		
		}
		catch(Exception ex)
		{
			logger.error(ex);
			throw new SportMgmtException(ex);
		}
	}
	
	private void createPlayerHistoryForGame()
	{
		List gameList =applicationDataUtility.getGames();
		for(int i=0; i< gameList.size();i++)
		{
			String gameId = (String)((HashMap)gameList.get(i)).get("gameId");
			logger.info("Going to create player history for gameId: "+gameId);
			//createPlayerHistoryForUsers(gameId);
			
		}
		
	}
}
