package com.sportmgmt.model.manager;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

import com.sportmgmt.controller.bean.ActivePlan;
import com.sportmgmt.model.entity.Game;
import com.sportmgmt.model.entity.LeaguePlan;
import com.sportmgmt.model.entity.PlanDiscount;
import com.sportmgmt.model.entity.User;
import com.sportmgmt.model.entity.UserGame;
import com.sportmgmt.model.entity.UserPayment;
import com.sportmgmt.model.entity.UserPlan;
import com.sportmgmt.utility.constrant.ErrorConstrant;
import com.sportmgmt.utility.constrant.QueryConstrant;
import com.sportmgmt.utility.constrant.SportConstrant;

public class PlanManager {
	private static Logger logger = Logger.getLogger(PlanManager.class);
	private static String errorCode;
	private static String errorMessage;
	public static String getErrorCode() {
		return errorCode;
	}
	public static void setErrorCode(String errorCode) {
		PlanManager.errorCode = errorCode;
	}
	public static String getErrorMessage() {
		return errorMessage;
	}
	public static void setErrorMessage(String errorMessage) {
		PlanManager.errorMessage = errorMessage;
	}
	private static SessionFactory factory = null;
	static
	{
		try
		{
			if(factory == null)
			{
				setErrorMessage("");
				factory = HibernateSessionFactory.getSessionFacotry();
			}
		}
		catch(Exception ex)
		{
			logger.error("Exception fetch factory "+ex.getMessage());
		}
	}
	public static LeaguePlan fetchLeaguePlan(Integer leaguePlanId)
	{
		logger.debug("--------------- fetchLeaguePlan -------------");
		LeaguePlan leaguePlan = null;
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
					
					leaguePlan	 = (LeaguePlan)session.get(LeaguePlan.class,leaguePlanId);
				}
				catch(Exception ex)
				{
					logger.error("Exception fetch leaguePlan: "+ex.getMessage());
					setErrorMessage("Technical Error");
					setErrorCode(ErrorConstrant.TRANSACTION_ERROR);
				}
				finally
				{
					session.close();
					//factory.close();
				}
			}
			else
			{
				setErrorCode(ErrorConstrant.SESS_NULL);
				setErrorMessage("Technical Error");
			}
		}
		logger.info("--------------- Returning leaguePlan -------------"+leaguePlan);
		return leaguePlan;
	}
	public static PlanDiscount fetchPlanDiscount(Integer planDiscountId)
	{
		logger.debug("--------------- fetchPlanDiscount -------------");
		PlanDiscount planDiscount = null;
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
					
					planDiscount	 = (PlanDiscount)session.get(PlanDiscount.class,planDiscountId);
				}
				catch(Exception ex)
				{
					logger.error("Exception fetch fetchPlanDiscount: "+ex.getMessage());
					setErrorMessage("Technical Error");
					setErrorCode(ErrorConstrant.TRANSACTION_ERROR);
				}
				finally
				{
					session.close();
					//factory.close();
				}
			}
			else
			{
				setErrorCode(ErrorConstrant.SESS_NULL);
				setErrorMessage("Technical Error");
			}
		}
		logger.info("--------------- Returning planDiscount -------------"+planDiscount);
		return planDiscount;
	}
	
	public static Integer createTransaction(Map<String,String> paymentDetails)
	{
		logger.debug("--------------- createTransaction ------------: plndId: "+paymentDetails.get("leaguePlanId")+" , discount Id: "+paymentDetails.get("planDiscountId")+ " , userId: "+paymentDetails.get("userId"));
		Integer transactionId =null;
		logger.debug("----- fetching plan------------------ ");
		LeaguePlan leaguePlan = fetchLeaguePlan(Integer.valueOf((String)paymentDetails.get("leaguePlanId")));
		logger.debug("----- fetching discount------------------ ");
		PlanDiscount planDiscount = fetchPlanDiscount(Integer.valueOf((String)paymentDetails.get("planDiscountId")));
		logger.debug("----- fetching user------------------ ");
		User user = UserManager.getUserModel((String)paymentDetails.get("userId"));
		UserPayment userPayment = null;
		if(leaguePlan !=null && planDiscount != null && user != null)
		{
			userPayment = new UserPayment();
			userPayment.setAmount(Double.valueOf((String)paymentDetails.get("amount")));
			userPayment.setPlan(leaguePlan);
			userPayment.setPlanDiscount(planDiscount);
			userPayment.setUser(user);
			if(paymentDetails.get("merchantId") != null && !paymentDetails.get("merchantId").equals(""))
			userPayment.setMerchantId((String)paymentDetails.get("merchantId"));
			userPayment.setStatus(SportConstrant.INITIATED);
			userPayment.setCurrency("INR");
			userPayment.setDate(new Date(System.currentTimeMillis()));
			userPayment.setPaymentMode("DEFAULT");
			//userPayment.setPaymentMsg(paymentMsg);
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
						//session.beginTransaction().begin();;
						session.save(userPayment);
						transactionId = userPayment.getTransactionId();
						session.beginTransaction().commit();
					}
					catch(Exception ex)
					{
						logger.error("Exception to create new user transaction: "+ex.getMessage());
						setErrorMessage("Technical Error");
						setErrorCode(ErrorConstrant.TRANSACTION_ERROR);
						//session.beginTransaction().rollback();
					}
					finally
					{
						session.close();
						//factory.close();
					}
				}
				else
				{
					setErrorCode(ErrorConstrant.SESS_NULL);
					setErrorMessage("Technical Error");
				}
			}

		}
		logger.info("--------------- createTransaction returning transactionId: -------------"+transactionId);
		return transactionId;
	}
	public static boolean updateTransaction(Map<String,String> paymentDetails)
	{
		logger.debug("--------------- updateTransaction ------------: transactionId: "+paymentDetails.get("transactionId")+" ,  status : "+paymentDetails.get("status")+ " , message: "+paymentDetails.get("message"));
		boolean updateTransaction =false;
		String transactionId = paymentDetails.get("transactionId");
		if(transactionId !=null && !transactionId.equals(""))
		{
			UserPayment userPayment = new UserPayment();
			userPayment.setTransactionId(Integer.valueOf(transactionId));
			if(paymentDetails.get("amount") != null && !paymentDetails.get("amount").equals(""))
			userPayment.setAmount(Double.valueOf((String)paymentDetails.get("amount")));
			if(paymentDetails.get("status") != null && !paymentDetails.get("status").equals(""))
			userPayment.setStatus(paymentDetails.get("status"));
			if(paymentDetails.get("message") != null && !paymentDetails.get("message").equals(""))
			userPayment.setPaymentMsg(paymentDetails.get("message"));
			if(paymentDetails.get("payUId") != null && !paymentDetails.get("payUId").equals(""))
			userPayment.setPayUId(paymentDetails.get("payUId"));
			if(paymentDetails.get("extraCharge") != null && !paymentDetails.get("extraCharge").equals(""))
			{
				double extraCharge = Double.valueOf(paymentDetails.get("extraCharge"));
				double amount = userPayment.getAmount();
				double totalAmount = amount + extraCharge;
				userPayment.setExtraCharge(extraCharge);
				userPayment.setTotalAmount(totalAmount);
			}
			if(paymentDetails.get("mode") != null && !paymentDetails.get("mode").equals(""))
			userPayment.setPaymentMode(paymentDetails.get("mode"));
			if(paymentDetails.get("bankcode") != null && !paymentDetails.get("bankcode").equals(""))
			userPayment.setBankCode(paymentDetails.get("bankcode"));
			if(paymentDetails.get("PG_TYPE") != null && !paymentDetails.get("PG_TYPE").equals(""))
			userPayment.setPgType(paymentDetails.get("PG_TYPE"));
			if(paymentDetails.get("bank_ref_num") != null && !paymentDetails.get("bank_ref_num").equals(""))
			userPayment.setBankReferenceNo(paymentDetails.get("bank_ref_num"));
				
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
						//session.beginTransaction().begin();;
						session.update(userPayment);
						session.beginTransaction().commit(); 
						updateTransaction = true;
					}
					catch(Exception ex)
					{
						logger.error("Exception to update transaction: "+ex.getMessage());
						setErrorMessage("Technical Error");
						setErrorCode(ErrorConstrant.TRANSACTION_ERROR);
						//session.beginTransaction().rollback();
					}
					finally
					{
						session.close();
						//factory.close();
					}
				}
				else
				{
					setErrorCode(ErrorConstrant.SESS_NULL);
					setErrorMessage("Technical Error");
				}
			}

		}
		logger.info("--------------- update returning -------------"+updateTransaction);
		return updateTransaction;
	}
	public static ActivePlan getActivePlans(String userId)
	{
		ActivePlan activePlan = null;
		setErrorMessage("");
		SessionFactory factory = HibernateSessionFactory.getSessionFacotry();
		logger.debug("--------------- fetchActivePlans ------------> userId:  "+userId);
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
					Criteria cr = session.createCriteria(UserPlan.class);
					User user = new User();
					user.setUserId(new Integer(userId));
					cr.add(Restrictions.eq("isActive", SportConstrant.YES));
					cr.add(Restrictions.eq("user", user));
					List results = cr.list();
					if(results == null || results.size() ==0)
					{
						logger.debug(" ------- Active Plans does not found--");
					}
					else
					{
						
							UserPlan userPlan = (UserPlan)results.get(0);
							activePlan = new ActivePlan();
							activePlan.setUserPlanId(userPlan.getUserPlanId());
							if(userPlan.getPlan().getPlanName() != null)
							activePlan.setPlanName(userPlan.getPlan().getPlanName());
							if(userPlan.getPlan().getPlanTypeVal() != null)
							activePlan.setPlanTypeVal(userPlan.getPlan().getPlanTypeVal());
							activePlan.setIsFree(userPlan.getPlan().getIsFree());
							if(userPlan.getStartDate() != null)
							{
								activePlan.setStartDay(userPlan.getStartDate().getDay());
								activePlan.setStartMonth(userPlan.getStartDate().getMonth());
								activePlan.setStartMonth(userPlan.getStartDate().getMonth());
							}
							if(userPlan.getEndDate() != null)
							{
								activePlan.setEndDay(userPlan.getEndDate().getDay());
								activePlan.setEndMonth(userPlan.getEndDate().getMonth());
								activePlan.setEndMonth(userPlan.getEndDate().getMonth());
							}
							if(userPlan.getBalanceAmount() != null)
							activePlan.setBalance(userPlan.getBalanceAmount());							
					}
				}
				catch(Exception ex)
				{
					logger.error("Exception fetch fetchActivePlans: "+ex.getMessage());
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
		return activePlan;
	}
	public static boolean deActivateUserPlan(Integer userPlanId)
	{
		boolean isSuccess = false;
		setErrorMessage("");
		SessionFactory factory = HibernateSessionFactory.getSessionFacotry();
		logger.debug("--------------- deActivateUserPlan ------------> userPlanId:  "+userPlanId);
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
					
					UserPlan userPlan = new UserPlan();
					userPlan.setUserPlanId(userPlanId);
					userPlan.setIsActive(SportConstrant.NO);
					session.update(userPlan);
					session.beginTransaction().commit();
					isSuccess = true;
				}
				catch(Exception ex)
				{
					logger.error("Exception fetch deActivateUserPlan: "+ex.getMessage());
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
		logger.debug("--------------- Returning DeActiveate Success:  "+isSuccess);
		return isSuccess;
	}
	public static double deductPointFromUserPlan(Integer userPlanId,double point) throws Exception
	{
		double balance =0;
		setErrorMessage("");
		SessionFactory factory = HibernateSessionFactory.getSessionFacotry();
		logger.debug("--------------- deductPointFromUserPlan ------------> userPlanId:  "+userPlanId+" , point: "+point);
		if(factory == null)
		{
			setErrorCode(ErrorConstrant.SESS_FACT_NULL);
			setErrorMessage("Technical Error");
			throw new Exception("Session Facoty is null");
		}
		else
		{
			Session session = factory.openSession();
			if(session != null)
			{
				try
				{
					
					UserPlan userPlan = (UserPlan)session.load(UserPlan.class, userPlanId);
					balance = userPlan.getBalanceAmount() - point;
					userPlan.setBalanceAmount(balance);
					//session.update(userPlan);
					session.beginTransaction().commit();
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
				throw new Exception("Session  is null");
			}
		}
		logger.debug("--------------- Returning balance After Deduction:  "+balance);
		return balance;
	}
	
	public static boolean addDefaultPlanToUser(String userId)
	{
		double balance =0;
		setErrorMessage("");
		SessionFactory factory = HibernateSessionFactory.getSessionFacotry();
		logger.debug("--------------- addDefaultPlanToUser ------------> userId:  "+userId);
		if(factory == null)
		{
			setErrorCode(ErrorConstrant.SESS_FACT_NULL);
			setErrorMessage("Technical Error");
			logger.error("Session Facoty is null");
			return false;
		}
		else
		{
			Session session = factory.openSession();
			if(session != null)
			{
				try
				{
					
					logger.debug("----- Trying to insert defaul plan for user");
					SQLQuery query = session.createSQLQuery(QueryConstrant.INSERT_DEFAULT_USER_PLAN);
					query.setParameter("userId", new Integer(userId));
					query.executeUpdate();
					session.beginTransaction().commit();
				}
				catch(Exception ex)
				{
					logger.error("---- Getting error to inser defualt plan to user: "+ex);
					setErrorCode(ErrorConstrant.TRANSACTION_ERROR);
					setErrorMessage("Technical Error");
					return false;
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
				logger.error("Session  is null");
				return false;
			}
		}
		logger.debug("--------------- Defualt Plan for user is added  ");
		return true;
	}
	public static double addPointToUserPlan(Integer userPlanId,double point) throws Exception
	{
		double balance =0;
		setErrorMessage("");
		SessionFactory factory = HibernateSessionFactory.getSessionFacotry();
		logger.debug("--------------- addPointToUserPlan ------------> userPlanId:  "+userPlanId+" , point: "+point);
		if(factory == null)
		{
			setErrorCode(ErrorConstrant.SESS_FACT_NULL);
			setErrorMessage("Technical Error");
			throw new Exception("Session Facoty is null");
		}
		else
		{
			Session session = factory.openSession();
			if(session != null)
			{
				try
				{
					
					UserPlan userPlan = (UserPlan)session.load(UserPlan.class, userPlanId);
					balance = userPlan.getBalanceAmount() + point;
					userPlan.setBalanceAmount(balance);
					//session.update(userPlan);
					session.beginTransaction().commit();
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
				throw new Exception("Session  is null");
			}
		}
		logger.debug("--------------- Returning balance After Adding:  "+balance);
		return balance;
	}

}
