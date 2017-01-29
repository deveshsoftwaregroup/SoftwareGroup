package com.sportmgmt.model.manager;

import java.math.BigInteger;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.sportmgmt.model.entity.Game;
import com.sportmgmt.model.entity.Match;
import com.sportmgmt.model.entity.Point;
import com.sportmgmt.utility.constrant.QueryConstrant;
import com.sportmgmt.utility.constrant.SportConstrant;
import com.sportmgmt.utility.exception.ErrorConstrant;

public class PointRankManager {
	private static Logger logger = Logger.getLogger(PointRankManager.class);
	private static String errorCode;
	private static String errorMessage;
	
	public static String getErrorCode() {
		return errorCode;
	}

	public static void setErrorCode(String errorCode) {
		PointRankManager.errorCode = errorCode;
	}

	public static String getErrorMessage() {
		return errorMessage;
	}

	public static void setErrorMessage(String errorMessage) {
		PointRankManager.errorMessage = errorMessage;
	}

	public static List<Point> getMPointByGame(String gameId)
	{
		logger.debug("----- Inside getMatchesByGame ---- gameId: "+gameId);
		setErrorMessage(SportConstrant.NULL);
		setErrorCode(SportConstrant.NULL);
		List<Point> pointList = null;
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
				
					Query query	 = session.createQuery(QueryConstrant.SELECT_POINT_BY_GAME);
					query.setParameter("gameId", new Integer(gameId));
					logger.debug("----------- Executing query to point list by game");
					pointList = query.list();
					
				}
				catch(Exception ex)
				{
					logger.error("Exception in fetching point list: "+ex);
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
		logger.debug("----- Returning Match List  ---- : "+pointList);
		return pointList;
	}
	
	public static Integer getLastGameWeekId(String gameId)
	{
		logger.debug("----- Inside getLastGameWeekId ---- gameId: "+gameId);
		setErrorMessage(SportConstrant.NULL);
		setErrorCode(SportConstrant.NULL);
		List lastGameWeekIdList = null;
		SessionFactory factory = HibernateSessionFactory.getSessionFacotry();
		if(factory == null)
		{
			setErrorCode(ErrorConstrant.SESS_FACT_NULL);
			setErrorMessage("Technical Error");
			logger.debug("----- Factory Object is null----");
			return null;
		}
		else
		{
			Session session = factory.openSession();
			if(session != null)
			{
				try
				{
				
					Query query	 = session.createQuery(QueryConstrant.SELECT_LAST_GAME_WEEK);
					query.setParameter("gameId", new Integer(gameId));
					logger.debug("----------- Executing query to point list by game");
					lastGameWeekIdList = query.list();
					
				}
				catch(Exception ex)
				{
					logger.error("Exception in fetching last game week: "+ex);
					setErrorMessage("Technical Error");
					setErrorCode(ErrorConstrant.TRANSACTION_ERROR);
					return null;
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
				return null;
			}
		}
		logger.debug("----- Returning Match List  ---- : "+lastGameWeekIdList);
		return ((BigInteger)lastGameWeekIdList.get(0)).intValue();
	}


}
