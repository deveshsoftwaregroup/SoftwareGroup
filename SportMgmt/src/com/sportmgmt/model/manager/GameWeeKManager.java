package com.sportmgmt.model.manager;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

import com.sportmgmt.model.entity.Game;
import com.sportmgmt.model.entity.GameWeekReport;
import com.sportmgmt.model.entity.Match;
import com.sportmgmt.model.entity.UserGame;
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
	
	public static Map<String,String> getGameWeekReport(String userId,String gameWeekId)
	{
		setErrorMessage("");
		SessionFactory factory = HibernateSessionFactory.getSessionFacotry();
		logger.info("--------------- getGameWeekReport ------------> userId:  "+userId+" gameWeekId: "+gameWeekId);
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
					Criteria cr = session.createCriteria(GameWeekReport.class);
					cr.add(Restrictions.eq("gameWeekId", new Integer(gameWeekId)));
					cr.add(Restrictions.eq("userId", new Integer(userId)));
					List<GameWeekReport> results = cr.list();
					if(results != null && !results.isEmpty())
					{
						logger.info(" ------- Enrty found in GameWeekReport table");
						GameWeekReport gameWeekReport = (GameWeekReport)results.get(0);
						Map<String,String> gameWeekReportMap = new HashMap<String,String>();
						gameWeekReportMap.put("rank", gameWeekReport.getRank().toString());
						gameWeekReportMap.put("point", gameWeekReport.getPoint().toString());
						gameWeekReportMap.put("finalPoint", gameWeekReport.getTotalPoint().toString());
						gameWeekReportMap.put("finalRank", gameWeekReport.getTotalRank().toString());
						SQLQuery sqlQuery = session.createSQLQuery(QueryConstrant.SELECT_HIEGHEST_RANK_OF_GAME_WEEK);
						sqlQuery.setParameter("gameWeekId", gameWeekId);
						List<Integer> highetRankList = sqlQuery.list();
						if(highetRankList != null && !highetRankList.isEmpty())
						{
							gameWeekReportMap.put("heighestRank", String.valueOf(highetRankList.get(0).intValue()));
						}
						
						sqlQuery = session.createSQLQuery(QueryConstrant.SELECT_AVERAGE_RANK_OF_GAME_WEEK);
						sqlQuery.setParameter("gameWeekId", gameWeekId);
						List<BigDecimal> averageRankList = sqlQuery.list();
						if(averageRankList != null && !averageRankList.isEmpty())
						{
							gameWeekReportMap.put("averageRank", String.valueOf(averageRankList.get(0)));
						}
						logger.info("Returning userGameMap: "+gameWeekReportMap);
						return gameWeekReportMap;
					
					}
					else
					{
						logger.info(" ------- Enty not found in GAME_WEEK_REPORT table ");
					}
									}
				catch(Exception ex)
				{
					logger.error("Exception  getGameWeekReport: "+ex.getMessage());
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
		return null;
	}
}
