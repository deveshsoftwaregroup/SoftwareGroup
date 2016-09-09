package com.sportmgmt.model.manager;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.sportmgmt.model.entity.Game;
import com.sportmgmt.model.entity.Match;
import com.sportmgmt.utility.constrant.ErrorConstrant;
import com.sportmgmt.utility.constrant.QueryConstrant;
import com.sportmgmt.utility.constrant.SportConstrant;

public class MatchManager {
	private static Logger logger = Logger.getLogger(MatchManager.class);
	private static String errorCode;
	private static String errorMessage;
	
	public static String getErrorCode() {
		return errorCode;
	}

	public static void setErrorCode(String errorCode) {
		MatchManager.errorCode = errorCode;
	}

	public static String getErrorMessage() {
		return errorMessage;
	}

	public static void setErrorMessage(String errorMessage) {
		MatchManager.errorMessage = errorMessage;
	}

	public static List<Match> getMatchesByGame(String gameId)
	{
		logger.debug("----- Inside getMatchesByGame ---- gameId: "+gameId);
		setErrorMessage(SportConstrant.NULL);
		setErrorCode(SportConstrant.NULL);
		List<Match> matchList = null;
		SessionFactory factory = HibernateSessionFactory.getSessionFacotry();
		if(factory == null)
		{
			setErrorCode(ErrorConstrant.SESS_FACT_NULL);
			setErrorMessage("Technical Error");
			logger.debug("----- Factory Object is null----");
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
					logger.debug("----------- Executing query to match list by game");
					matchList = query.list();
					
				}
				catch(Exception ex)
				{
					logger.error("Exception in fetching country state city: "+ex);
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
				logger.debug("----- Session Object is null----");
			}
		}
		logger.debug("----- Returning Match List  ---- : "+matchList);
		return matchList;
	}

}
