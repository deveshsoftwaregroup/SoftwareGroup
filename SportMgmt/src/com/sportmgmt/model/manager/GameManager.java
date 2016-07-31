package com.sportmgmt.model.manager;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

import com.sportmgmt.model.entity.Club;
import com.sportmgmt.model.entity.Game;
import com.sportmgmt.model.entity.GameClubPlayer;
import com.sportmgmt.model.entity.Player;
import com.sportmgmt.model.entity.UserPlayer;
import com.sportmgmt.utility.constrant.ErrorConstrant;
import com.sportmgmt.utility.constrant.QueryConstrant;
import com.sportmgmt.utility.constrant.SportConstrant;

public class GameManager {
	private static Logger logger = Logger.getLogger(UserManager.class);
	private static String errorCode;
	private static String errorMessage;
	public static String getErrorCode() {
		return errorCode;
	}
	public static void setErrorCode(String errorCode) {
		GameManager.errorCode = errorCode;
	}
	public static String getErrorMessage() {
		return errorMessage;
	}
	public static void setErrorMessage(String errorMessage) {
		GameManager.errorMessage = errorMessage;
	}
	public static List<Game>fetchActiveGames()
	{
		List<Game> gameList = null;
		setErrorMessage("");
		SessionFactory factory = HibernateSessionFactory.getSessionFacotry();
		logger.debug("--------------- fetchActiveGameList -------------");
		if(factory == null)
		{
			setErrorCode(ErrorConstrant.SESS_FACT_NULL);
			setErrorMessage("Technical Error");
		}
		else
		{
			Session session = factory.openSession();
			if(session != null)
			{
				try
				{
					
					Query query	 = session.createQuery(QueryConstrant.SELECT_ACTIVE_GAME);
					query.setParameter("isActive", SportConstrant.YES);
					gameList =query.list();
				}
				catch(Exception ex)
				{
					logger.error("Exception fetch active event list: "+ex.getMessage());
					setErrorMessage("Technical Error");
					setErrorCode(ErrorConstrant.TRANSACTION_ERROR);
				}
				finally
				{
					session.close();
				}
			}
			else
			{
				setErrorCode(ErrorConstrant.SESS_NULL);
				setErrorMessage("Technical Error");
			}
		}
		logger.info("--------------- Returning game List -------------"+gameList);
		return gameList;
	}
	public static List fetchGames()
	{
		logger.info("--------------- fetchGames: ---"); 
		List<Game> gameListObj = fetchActiveGames();
		ArrayList gamelist = new ArrayList();
		if(gameListObj != null && gameListObj.size() > 0)
		{
			Iterator gameListItr = gameListObj.iterator();
			while(gameListItr.hasNext())
			{
				Game game = (Game)gameListItr.next();
				HashMap gameMap = new HashMap();
				gameMap.put("gameId", String.valueOf(game.getGameId()));
				gameMap.put("gameName", game.getGameName());
				gameMap.put("gameDesc", "");
				gameMap.put("totalClub", 0);
				gameMap.put("totalPlayer", 0);
				gameMap.put("startDate", "");
				gameMap.put("endDate", "");
				if(game.getGameDesc() !=null)
				{
					gameMap.put("gameDesc", game.getGameDesc());
				}
				if(game.getTotalClub() != null)
				{
					gameMap.put("totalClub", game.getTotalClub());
				}
				if(game.getTotaPlyers() != null)
				{
					gameMap.put("totalPlayer", game.getTotaPlyers());
				}
				if(game.getStartDate() != null)
				{
					gameMap.put("startDate", game.getStartDate().toString());
				}
				if(game.getEndDate() != null)
				{
					gameMap.put("endDate", game.getEndDate().toString());
				}
				gamelist.add(gameMap);
			}
		}
		logger.info("--------------- Returning game List ---: "+gamelist); 
		return gamelist;
	}

	public static List<GameClubPlayer> fetchGameClubPlayers(Integer gameId)
	{
		List<GameClubPlayer> gameClubPlayersList = null;
		setErrorMessage("");
		SessionFactory factory = HibernateSessionFactory.getSessionFacotry();
		logger.debug("--------------- fetchGamePlayers -------------");
		if(factory == null)
		{
			setErrorCode(ErrorConstrant.SESS_FACT_NULL);
			setErrorMessage("Technical Error");
		}
		else
		{
			Session session = factory.openSession();
			if(session != null)
			{
				try
				{
					
					SQLQuery query = session.createSQLQuery(QueryConstrant.SELECT_PLAYERS_CLUBD_OF_EVENT);
					query.addEntity(GameClubPlayer.class);
					query.setParameter("gameId", gameId);
					gameClubPlayersList =query.list();
				}
				catch(Exception ex)
				{
					logger.error("Exception fetch gameClubPlayer: "+ex.getMessage());
					setErrorMessage("Technical Error");
					setErrorCode(ErrorConstrant.TRANSACTION_ERROR);
				}
				finally
				{
					session.close();
				}
			}
			else
			{
				setErrorCode(ErrorConstrant.SESS_NULL);
				setErrorMessage("Technical Error");
			}
		}
		logger.info("--------------- Returning gameClubPlayersList: -------------"+gameClubPlayersList);
		return gameClubPlayersList;
	}
	public static void updateClubListAndPlayersList(List playersList, List clubList,String gameId)
	{
		logger.debug("--------------- updateClubListAndPlayersList: ---gameId: "+gameId); 
		List<GameClubPlayer> gameClubPlayersList = fetchGameClubPlayers(Integer.parseInt(gameId));
		
		if(gameClubPlayersList != null && gameClubPlayersList.size() > 0)
		{
			logger.debug("--------Started Updating Club List---: "+clubList); 
			logger.debug("--------------- Started Updating Player List ---: "+playersList);
			Iterator gameClubPlayerItr = gameClubPlayersList.iterator();
			while(gameClubPlayerItr.hasNext())
			{
				GameClubPlayer gameClubPlayer = (GameClubPlayer)gameClubPlayerItr.next();
				Player player = gameClubPlayer.getPlayer();
				Club club = gameClubPlayer.getClub();
				HashMap playerMap = null;
				HashMap clubMap = null;
				if(player != null)
				{
					playerMap = new HashMap();
					
					playerMap.put("gameClubPlayerId", gameClubPlayer.getGameClubPlayerId().toString());
					
					playerMap.put("playerId", player.getPlayerId().toString());
					
					playerMap.put("type", "");
					if(gameClubPlayer.getPlayingPosition() != null)
					playerMap.put("type", gameClubPlayer.getPlayingPosition());
					
					playerMap.put("bestPostion", "");
					if(player.getBestPosition() !=null)
					playerMap.put("bestPostion", player.getBestPosition());
								
					playerMap.put("price", 0);
					if(gameClubPlayer.getPrice() !=null)
					playerMap.put("price", gameClubPlayer.getPrice());
					
					playerMap.put("currency", "");
					if(gameClubPlayer.getPriceCurrency() != null)
					playerMap.put("currency", gameClubPlayer.getPriceCurrency());
					
					playerMap.put("totalPoint", 0);
					if(gameClubPlayer.getPlayerTotalPoint()!=null)
					playerMap.put("totalPoint", gameClubPlayer.getPlayerTotalPoint());
					
					playerMap.put("name", player.getPlayerName());
					
					playerMap.put("status", "");
					if(player.getStatus() != null)
					playerMap.put("status", player.getStatus());
					
					playerMap.put("worldRanking", 0);
					if(player.getWorldRanking() !=null)
					playerMap.put("worldRanking", player.getWorldRanking());
					
					playerMap.put("highestScore", 0);
					if(player.getHeighetScore() !=null)
					playerMap.put("highestScore", player.getHeighetScore());
					
					playerMap.put("totalScore", 0);
					if(player.getTotalScore() !=null)
					playerMap.put("totalScore", player.getTotalScore());
					
				}
				if(club != null)
				{
					clubMap = new HashMap();
					clubMap.put("clubId", club.getClubID().toString());
					clubMap.put("name", club.getClubName());
					if(playerMap != null)
					{
						playerMap.put("clubId", club.getClubID().toString());
						playerMap.put("clubName", club.getClubName());
					}
					
					clubMap.put("desc", "");
					if(club.getClubDesc() != null)
					clubMap.put("desc", club.getClubDesc());
					
					clubMap.put("createdDate", "");
					if(club.getCreatedDate() != null)
					clubMap.put("createdDate", club.getCreatedDate().toString());
					
					clubMap.put("logoPath", "");
					if(club.getClubLogoPath() != null)
					clubMap.put("logoPath", club.getClubLogoPath());
					
				}
				if(playerMap !=null)
				{
					playersList.add(playerMap);
				}
				if(clubMap != null)
				{
					boolean isClubExist = false;
					for(Object tempClubObj:clubList)
					{
						if(((HashMap)tempClubObj).get("clubId").equals(clubMap.get("clubId")))
							isClubExist = true;
					}
					if(!isClubExist)
					clubList.add(clubMap);
				}
			}
		
		}
		logger.info("-------- Updated Club List ---: "+clubList); 
		logger.info("--------------- Updated Player List ---: "+playersList);
	}
	public static List<String> fetchUserPlayersList(Integer userId, Integer gameId)
	{
		List<String> userPlayersList = null;
		setErrorMessage("");
		SessionFactory factory = HibernateSessionFactory.getSessionFacotry();
		logger.debug("--------------- userPlayersList ------------> userId:  "+userId+" gameId: "+gameId);
		if(factory == null)
		{
			setErrorCode(ErrorConstrant.SESS_FACT_NULL);
			setErrorMessage("Technical Error");
		}
		else
		{
			Session session = factory.openSession();
			if(session != null)
			{
				try
				{
					
					//SQLQuery query = session.createSQLQuery("select gcp.game_club_player_id from game_club_player gcp, user_player up where gcp.game_club_player_id = up.game_club_player_id and up.user_id =20 and gcp.game_id =1");
					SQLQuery query = session.createSQLQuery(QueryConstrant.SELECT_USER_PLAYER_LIST);
					query.setParameter("userId", userId);
					query.setParameter("gameId", gameId);
					userPlayersList =(List<String>)query.list();
				}
				catch(Exception ex)
				{
					logger.error("Exception fetch userPlayersList: "+ex.getMessage());
					setErrorMessage("Technical Error");
					setErrorCode(ErrorConstrant.TRANSACTION_ERROR);
				}
				finally
				{
					session.close();
				}
			}
			else
			{
				setErrorCode(ErrorConstrant.SESS_NULL);
				setErrorMessage("Technical Error");
			}
		}
		logger.info("--------------- Returning user Player List: -------------"+userPlayersList);
		return userPlayersList;
	}
	public static List<Object[]> fetchTotalPlayerByPostion(Integer userId, Integer gameId)
	{
		List<Object[]> totalPlayerByPisitionList = null;
		setErrorMessage("");
		SessionFactory factory = HibernateSessionFactory.getSessionFacotry();
		logger.debug("--------------- fetchTotalPlayerByPostion ------------> userId:  "+userId+" gameId: "+gameId);
		if(factory == null)
		{
			setErrorCode(ErrorConstrant.SESS_FACT_NULL);
			setErrorMessage("Technical Error");
		}
		else
		{
			Session session = factory.openSession();
			if(session != null)
			{
				try
				{
					
					//SQLQuery query = session.createSQLQuery("select gcp.game_club_player_id from game_club_player gcp, user_player up where gcp.game_club_player_id = up.game_club_player_id and up.user_id =20 and gcp.game_id =1");
					SQLQuery query = session.createSQLQuery(QueryConstrant.SELECT_TOTAL_PLAYER_BY_POSITION);
					query.setParameter("userId", userId);
					query.setParameter("gameId", gameId);
					totalPlayerByPisitionList =query.list();
				}
				catch(Exception ex)
				{
					logger.error("Exception fetch fetchTotalPlayerByPostion: "+ex.getMessage());
					setErrorMessage("Technical Error");
					setErrorCode(ErrorConstrant.TRANSACTION_ERROR);
				}
				finally
				{
					session.close();
				}
			}
			else
			{
				setErrorCode(ErrorConstrant.SESS_NULL);
				setErrorMessage("Technical Error");
			}
		}
		logger.info("--------------- Returning user totalPlayerByPisitionList: -------------"+totalPlayerByPisitionList);
		return totalPlayerByPisitionList;
	}
	
	public static int totalPlayersOfUserByGame(Integer userId, Integer gameId)
	{
		int totalPlayers = 0;
		List<Object> totalPlayerFetchList = null;
		setErrorMessage("");
		SessionFactory factory = HibernateSessionFactory.getSessionFacotry();
		logger.debug("--------------- totalPlayersOfUserByEvent ------------> userId:  "+userId+" gameId: "+gameId);
		if(factory == null)
		{
			setErrorCode(ErrorConstrant.SESS_FACT_NULL);
			setErrorMessage("Technical Error");
		}
		else
		{
			Session session = factory.openSession();
			if(session != null)
			{
				try
				{
					
					//SQLQuery query = session.createSQLQuery("select gcp.game_club_player_id from game_club_player gcp, user_player up where gcp.game_club_player_id = up.game_club_player_id and up.user_id =20 and gcp.game_id =1");
					SQLQuery query = session.createSQLQuery(QueryConstrant.SELECT_USER_TOTAL_PLAYER);
					query.setParameter("userId", userId);
					query.setParameter("gameId", gameId);
					totalPlayerFetchList =query.list();
				}
				catch(Exception ex)
				{
					logger.error("Exception fetch totalPlayersOfUserByEvent: "+ex.getMessage());
					setErrorMessage("Technical Error");
					setErrorCode(ErrorConstrant.TRANSACTION_ERROR);
				}
				finally
				{
					session.close();
				}
			}
			else
			{
				setErrorCode(ErrorConstrant.SESS_NULL);
				setErrorMessage("Technical Error");
			}
		}
		logger.info("--------------- Returning user totalPlayerFetchList: -------------"+totalPlayerFetchList);
		if(totalPlayerFetchList !=null && totalPlayerFetchList.size() >=0)
		{
			totalPlayers = ((java.math.BigInteger)totalPlayerFetchList.get(0)).intValue();
		}
		return totalPlayers;
	}
	public static double totalPlayersPriceOfUserByGame(Integer userId, Integer gameId)
	{
		double totalPlayersPrice = 0;
		List<Object> totalPlayerPriceFetchList = null;
		setErrorMessage("");
		SessionFactory factory = HibernateSessionFactory.getSessionFacotry();
		logger.debug("--------------- totalPlayersPriceOfUserByEvent ------------> userId:  "+userId+" gameId: "+gameId);
		if(factory == null)
		{
			setErrorCode(ErrorConstrant.SESS_FACT_NULL);
			setErrorMessage("Technical Error");
		}
		else
		{
			Session session = factory.openSession();
			if(session != null)
			{
				try
				{
					
					//SQLQuery query = session.createSQLQuery("select gcp.game_club_player_id from game_club_player gcp, user_player up where gcp.game_club_player_id = up.game_club_player_id and up.user_id =20 and gcp.game_id =1");
					SQLQuery query = session.createSQLQuery(QueryConstrant.SELECT_USER_PLAYER_TOTAL_PRICE);
					query.setParameter("userId", userId);
					query.setParameter("gameId", gameId);
					totalPlayerPriceFetchList =query.list();
				}
				catch(Exception ex)
				{
					logger.error("Exception fetch totalPlayersPriceOfUserByEvent: "+ex.getMessage());
					setErrorMessage("Technical Error");
					setErrorCode(ErrorConstrant.TRANSACTION_ERROR);
				}
				finally
				{
					session.close();
				}
			}
			else
			{
				setErrorCode(ErrorConstrant.SESS_NULL);
				setErrorMessage("Technical Error");
			}
		}
		logger.info("--------------- Returning user totalPlayerPriceFetchList: -------------"+totalPlayerPriceFetchList);
		if(totalPlayerPriceFetchList !=null && totalPlayerPriceFetchList.size() >=0)
		{
			totalPlayersPrice = ((java.math.BigDecimal)totalPlayerPriceFetchList.get(0)).doubleValue();
		}
		return totalPlayersPrice;
	}
	
	public static void updateTotalPlayerByPostion(Integer userId, Integer gameId,Map totalMap)
	{
		logger.debug("---------- Inside updateTotalPlayerByPostion: ");
		List<Object[]> totalPlayerByPisitionList = fetchTotalPlayerByPostion(userId,gameId);
		if(totalPlayerByPisitionList != null && totalPlayerByPisitionList.size() >0)
		{
			logger.debug("---------- Started updating totalMap -------- ");
			for(Object[] row:totalPlayerByPisitionList)
			{
				totalMap.put(row[0], row[1]);
			}
		}
		else
		{
			logger.debug("------------ no update found due to totalPlayerByPisitionList is empty ");
		}
		
	}
	public static boolean addPlayeOfEventToUserAccount(String userId,String gameClubPlayerId)
	{
		boolean isAdded =  false;
		setErrorMessage("");
		SessionFactory factory = HibernateSessionFactory.getSessionFacotry();
		logger.debug("--------------- addPlayeOfEventToUserAccount ------------> userId:  "+userId+" gameClubPlayerId: "+gameClubPlayerId);
		if(factory == null)
		{
			setErrorCode(ErrorConstrant.SESS_FACT_NULL);
			setErrorMessage("Technical Error");
		}
		else
		{
			Session session = factory.openSession();
			if(session != null)
			{
				try
				{
					Criteria cr = session.createCriteria(UserPlayer.class);
					cr.add(Restrictions.eq("gameClubPlayerId", new Integer(gameClubPlayerId)));
					cr.add(Restrictions.eq("userId", new Integer(userId)));
					List results = cr.list();
					if(results == null || results.size() ==0)
					{
						UserPlayer userPlayer = new UserPlayer();
						userPlayer.setGameClubPlayerId(new Integer(gameClubPlayerId)); 
						userPlayer.setUserId(new Integer(userId));
						userPlayer.setIsPlaying(SportConstrant.NO);
						session.save(userPlayer);
						session.beginTransaction().commit();
						isAdded = true;
					}
					else
					{
						logger.debug(" ------- Player is already asssociated with user ");
						setErrorMessage("Player is already added");
						setErrorCode(ErrorConstrant.TRANSACTION_ERROR);
					}
					
				}
				catch(Exception ex)
				{
					logger.error("Exception fetch addPlayeOfEventToUserAccount: "+ex.getMessage());
					setErrorMessage("Technical Error");
					setErrorCode(ErrorConstrant.DUPLICATE_ENTRY);
				}
				finally
				{
					session.close();
				}
			}
			else
			{
				setErrorCode(ErrorConstrant.SESS_NULL);
				setErrorMessage("Technical Error");
			}
		}
		
		return isAdded;
	}
	
	public static boolean removePlayeOfEventFromUserAccount(String userId,String gameClubPlayerId)
	{
		boolean isRemoved =  false;
		setErrorMessage("");
		SessionFactory factory = HibernateSessionFactory.getSessionFacotry();
		logger.debug("--------------- removePlayeOfEventFromUserAccount ------------> userId:  "+userId+" gameClubPlayerId: "+gameClubPlayerId);
		if(factory == null)
		{
			setErrorCode(ErrorConstrant.SESS_FACT_NULL);
			setErrorMessage("Technical Error");
		}
		else
		{
			Session session = factory.openSession();
			if(session != null)
			{
				try
				{
					Criteria cr = session.createCriteria(UserPlayer.class);
					cr.add(Restrictions.eq("gameClubPlayerId", new Integer(gameClubPlayerId)));
					cr.add(Restrictions.eq("userId", new Integer(userId)));
					List results = cr.list();
					if(results == null || results.size() ==0)
					{
						logger.debug(" ------- Player is not found to remove ");
						setErrorMessage("Player is  not associated with user");
						setErrorCode(ErrorConstrant.RECORD_NOT_FOUND);
					}
					else
					{
						UserPlayer userPlayer = (UserPlayer)results.get(0);
						session.delete(userPlayer);
						session.beginTransaction().commit();
						isRemoved = true;
					}
				}
				catch(Exception ex)
				{
					logger.error("Exception fetch totalPlayersOfUserByEvent: "+ex.getMessage());
					setErrorMessage("Technical Error");
					setErrorCode(ErrorConstrant.TRANSACTION_ERROR);
				}
				finally
				{
					session.close();
				}
			}
			else
			{
				setErrorCode(ErrorConstrant.SESS_NULL);
				setErrorMessage("Technical Error");
			}
		}
		
		return isRemoved;
	}

}
