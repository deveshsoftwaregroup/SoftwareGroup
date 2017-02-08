package com.sportmgmt.model.manager;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.sportmgmt.model.entity.Game;
import com.sportmgmt.model.entity.Match;
import com.sportmgmt.utility.constrant.ErrorConstrant;
import com.sportmgmt.utility.constrant.QueryConstrant;
import com.sportmgmt.utility.constrant.SportConstrant;

public class GameWeeKManager {
	private static Logger logger = Logger.getLogger(GameWeeKManager.class);
	private static String errorCode;
	private static String errorMessage;
	
	public static String getErrorCode() {
		return errorCode;
	}

	public static void setErrorCode(String errorCode) {
		GameWeeKManager.errorCode = errorCode;
	}

	public static String getErrorMessage() {
		return errorMessage;
	}

	public static void setErrorMessage(String errorMessage) {
		GameWeeKManager.errorMessage = errorMessage;
	}

	public static List<Match> getMatchesByGame(String gameId)
	{
		logger.info("----- Inside getMatchesByGame ---- gameId: "+gameId);
		setErrorMessage(SportConstrant.NULL);
		setErrorCode(SportConstrant.NULL);
		List<Match> matchList = null;
		SessionFactory factory = HibernateSessionFactory.getSessionFacotry();
		if(factory == null)
		{
			setErrorCode(ErrorConstrant.SESS_FACT_NULL);
			setErrorMessage("Technical Error");
			logger.info("----- Factory Object is null----");
		}
		else
		{
			Session session = factory.openSession();
			if(session != null)
			{
				try
				{
				
					Game game = new Game();
					game.setGameId(new Integer(gameId));
					Query query	 = session.createQuery(QueryConstrant.SELECT_MATCH_BY_GAME);
					query.setParameter("game", game);
					logger.info("----------- Executing query to match list by game");
					matchList = query.list();
					
				}
				catch(Exception ex)
				{
					logger.error("Exception in fetching match list by game: "+ex);
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
				logger.info("----- Session Object is null----");
			}
		}
		logger.info("----- Returning Match List  ---- : "+matchList);
		return matchList;
	}
	
	public static List<Integer> sortedGameWeekIds(String gameId)
	{
		logger.info("----- Inside sortedGameWeekIds ---- gameId: "+gameId);
		setErrorMessage(SportConstrant.NULL);
		setErrorCode(SportConstrant.NULL);
		List<Integer> sortedGameWeekIds = null;
		SessionFactory factory = HibernateSessionFactory.getSessionFacotry();
		if(factory == null)
		{
			setErrorCode(ErrorConstrant.SESS_FACT_NULL);
			setErrorMessage("Technical Error");
			logger.info("----- Factory Object is null----");
		}
		else
		{
			Session session = factory.openSession();
			if(session != null)
			{
				try
				{
				
					SQLQuery query	 = session.createSQLQuery(QueryConstrant.FETCH_SORTED_GAME_WEEK);
					query.setParameter("gameId", new Integer(gameId));
					logger.info("----------- Executing query to match list by game");
					sortedGameWeekIds = query.list();
					logger.info("----- sortedGameWeekIds  ---- : "+sortedGameWeekIds);
					return sortedGameWeekIds;
					
				}
				catch(Exception ex)
				{
					logger.error("Exception in sortedGameWeekIds: "+ex);
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
				logger.info("----- Session Object is null----");
			}
		}
		return null;
	}
}
