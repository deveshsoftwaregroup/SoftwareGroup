package com.sportmgmt.controller.action;

import java.util.ArrayList;
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
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ravij.crypto.EncodeDecoder;
import com.sportmgmt.controller.bean.ActivePlan;
import com.sportmgmt.controller.bean.User;
import com.sportmgmt.controller.bean.WildCard;
import com.sportmgmt.model.manager.GameManager;
import com.sportmgmt.model.manager.PlanManager;
import com.sportmgmt.model.manager.UserManager;
import com.sportmgmt.utility.common.LeaguePlanUtil;
import com.sportmgmt.utility.common.MailUtility;
import com.sportmgmt.utility.common.PropertyFileUtility;
import com.sportmgmt.utility.constrant.ErrorConstrant;
import com.sportmgmt.utility.constrant.SportConstrant;

@Controller
@RequestMapping("/user")
public class UserAction {
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
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String userRegister(ModelMap modeMap,@RequestParam Map<String,String> userMap)
	{
		logger.debug("Entry in register method model Map: "+modeMap);
		if(userMap.get("emailId") == null || userMap.get("emailId").equals(SportConstrant.NULL))
		{
			modeMap.put("emailIdError", "emailId is required");
		}
		if(userMap.get("displayName") == null || userMap.get("displayName").equals(SportConstrant.NULL))
		{
			modeMap.put("displayName", "name is required");
		}
		/*if(userMap.get("dobDay") == null || userMap.get("dobDay").equals(SportConstrant.NULL))
		{
			modeMap.put("dobError", "Date of Birth is required");
		}
		if(userMap.get("dobMonth") == null || userMap.get("dobMonth").equals(SportConstrant.NULL))
		{
			modeMap.put("dobError", "Date of Birth is required");
		}
		if(userMap.get("dobYear") == null || userMap.get("dobYear").equals(SportConstrant.NULL))
		{
			modeMap.put("dobError", "Date of Birth is required");
		}*/
		if(userMap.get("logonId") == null || userMap.get("logonId").equals(SportConstrant.NULL))
		{
			userMap.put("logonId", userMap.get("emailId"));
		}
		if(userMap.get("logonPassword") == null || userMap.get("logonPassword").equals(SportConstrant.NULL))
		{
			modeMap.put("logonPasswordError", "User Password is required");
		}
		else
		{
			logger.debug("--------- password: "+userMap.get("logonPassword"));
			try
			{
				userMap.put("logonPassword", EncodeDecoder.encrypt(userMap.get("logonPassword")));
				logger.debug("--------- password: After Encoding:  "+userMap.get("logonPassword"));
			}
			catch(Exception ex)
			{
				logger.error("--------- Error in encoding password: "+ex);
			}
		}
		logger.debug("------------ Error Map: "+modeMap);
		if(modeMap.isEmpty())
		{
			boolean isRegistered = UserManager.saveUser(userMap);
			modeMap.put("isRegistered",isRegistered);
			if(isRegistered)
			{
				modeMap.put("message","You are registered");
				PlanManager.addDefaultPlanToUser(UserManager.getUserId());
				logger.debug("----------- start to send mail------");
				/*try
				{
					Map<String,Object> mailMap = new java.util.HashMap<String,Object>();
					
					mailMap.put(SportConstrant.FROM, propFileUtility.getEnvProperty().getString(SportConstrant.FROM));
					mailMap.put(SportConstrant.TO,userMap.get("emailId"));
					mailMap.put("displayName", userMap.get("displayName"));
					mailMap.put(SportConstrant.VELOCIYY_FILE_LOC,propFileUtility.getEnvProperty().getString(SportConstrant.USER_VER_EMAIL_LOC) );
					mailMap.put(SportConstrant.SUBJECT, propFileUtility.getEnvProperty().getString(SportConstrant.USER_VER_EMAIL_SUB));
					String userVerifyURL = propFileUtility.getEnvProperty().getString(SportConstrant.BASE_URL)+propFileUtility.getEnvProperty().getString(SportConstrant.USER_VER_URL)+"/"+UserManager.getUserId();
					mailMap.put(SportConstrant.USER_VER_URL,userVerifyURL);
					mailUtility.sendHtmlMail(mailMap);
					logger.debug("----------- end to send mail------");
				}
				catch (Exception ex)
				{
					logger.error("----------- Excepton in Sending Mail ----------"+ex);
				}*/
			}
			else
			{
				modeMap.put("message","Your Registration is failed due to "+UserManager.getErrorMessage());
			}
		}
		else
		{
			modeMap.put("isRegistered",false);
			modeMap.put("message","Your Registration is failed due to incomplete info");
		}
		//return "redirect:/login/loginSuccess.jsp";
		return "redirect:/"+SportConstrant.USER_REG_RESULT_PAGE+".jsp";

	}
	
	@RequestMapping(value = "validate", method = RequestMethod.GET)
	public @ResponseBody Map validateUser(@RequestParam("logonId") String logonId, @RequestParam("logonPassword") String logonPassword)
	{
	 java.util.Map resultMap = new java.util.HashMap();
	 boolean isValidUser = false;
	 if(logonId == null || logonId.equals(SportConstrant.NULL))
	 {
		 resultMap.put("errorCode", ErrorConstrant.EMPTY_LOGON);
		 resultMap.put("errorMessage", "Email Id cannot be blank");
	 }
	 if(logonPassword == null || logonPassword.equals(SportConstrant.NULL))
	 {
		 resultMap.put("errorCode", ErrorConstrant.EMPTY_PASS);
		 resultMap.put("errorMessage", "Password Can't be blank");
	 }
	 else
	 {
		 logger.debug("--------- password: "+logonPassword);
			try
			{
				logonPassword = EncodeDecoder.encrypt(logonPassword);
				logger.debug("--------- password: After Encoding:  "+logonPassword);
			}
			catch(Exception ex)
			{
				logger.error("--------- Error in encoding password: "+ex);
			}
	 }
	 if(resultMap.size() == 0)
	 {
		 isValidUser = UserManager.validateUser(logonId, logonPassword);
		 if(isValidUser)
		 {
			 resultMap.put("userId", UserManager.getUserId()); 
		 }
		 else
		 {
			 resultMap.put("errorCode", UserManager.getErrorCode());
			 resultMap.put("errorMessage", UserManager.getErrorMessage());
		 }
		
	}
	 resultMap.put("isValidUser", isValidUser);
	 return resultMap;
	}
	@RequestMapping(value = "verify/{userId}", method = RequestMethod.GET)
	public  String verifyUser(ModelMap modeMap,@PathVariable String userId)
	{
	 logger.debug("---------- Entry in verifyUser  -----Path Variable User Id:  "+userId);
	 modeMap.clear();
	 if(userId == null || userId.equals(SportConstrant.NULL))
	 {
		 modeMap.put("errorCode", ErrorConstrant.EMPTY_LOGON);
		 modeMap.put("errorMessage", "Invalid URL");
		 modeMap.put("isVerified", false);
	 }
	
	 if(modeMap.size() == 0)
	 {
		 if(UserManager.activateUser(userId))
		 {
			 modeMap.put("isVerified", true);
		 }
		 else
		 {
			 modeMap.put("isVerified", false);
			 modeMap.put("errorCode", UserManager.getErrorCode());
			 modeMap.put("errorMessage", UserManager.getErrorMessage());
			 if(UserManager.getErrorCode().equals(ErrorConstrant.TRANSACTION_ERROR))
			 modeMap.put("errorMessage", "Invalid URL");
		 }
		
	}
	 return SportConstrant.USER_VERIFY_PAGE;
	}
	@RequestMapping(value = "login/{userId}", method = RequestMethod.GET)
	public  String doLogin(ModelMap modeMap,@PathVariable String userId,HttpServletRequest request)
	{
	 logger.debug("---------- Entry in login  ---- Path Variable User Id:  "+userId);
	 modeMap.clear();
	 if(userId == null || userId.equals(SportConstrant.NULL))
	 {
		 modeMap.put("errorCode", ErrorConstrant.EMPTY_LOGON);
		 modeMap.put("errorMessage", "Invalid URL");
		 modeMap.put("isLogined", false);
	 }
	
	 if(modeMap.size() == 0)
	 {
		 logger.debug("---------- Calling Hibernate get User Method: ");
		 User user = UserManager.getUser(userId);
		 logger.debug("---------- Fetche User Object: "+user);
		 if(user != null)
		 {
			 modeMap.put("isLogined", true);
			 logger.debug("---------- Fetching Active Plan");
			 ActivePlan activePlan = PlanManager.getActivePlans(String.valueOf(user.getUserId()));
			 if(activePlan == null)
			 {
				 logger.debug("---------- Setting User has not active Plan");
				 user.setHasActivePlan(false);
			 }
			 else
			 {
				 logger.debug("---------- Setting User has active Plan");
				 user.setHasActivePlan(true);
				 user.setActivePlan(activePlan);
				 logger.debug(activePlan);
			 }
			 logger.debug("---------- Getting HTTP Session: "+user);
			 HttpSession session = request.getSession();
			 logger.debug("---------- Setting User to Sesison: "+user);
			 session.setAttribute("userId", String.valueOf(user.getUserId()));
			 session.setAttribute("user", user);
			 ArrayList playersList = new ArrayList();
			 ArrayList clubList = new ArrayList();
			 HashMap gameMap = null;
			 List games = GameManager.fetchGames();
			 HashMap userGameMap = new HashMap();
			if(games != null && games.size() ==1)
			{
				gameMap = (HashMap)games.get(0);
				String gameId = (String)gameMap.get("gameId");
				
				if(gameId != null && !gameId.equals(""))
				{
					GameManager.updateClubListAndPlayersList(playersList, clubList, gameId);
				}
				List<Map<String,String>> userPlayersList = GameManager.userPlayerDetailsList(user.getUserId(),Integer.valueOf(gameId)); 
				userGameMap.put("playerList", userPlayersList);
				HashMap totalMap= new HashMap(); 
				int totalPlayers = GameManager.totalPlayersOfUserByGame(user.getUserId(),Integer.valueOf(gameId));
				double totalPrice = GameManager.totalPlayersPriceOfUserByGame(user.getUserId(),Integer.valueOf(gameId));
				totalMap.put("price", totalPrice);
				totalMap.put("player", totalPlayers);
				System.out.println("---------------- totalMap: "+userGameMap);
				GameManager.updateTotalPlayerByPostion(user.getUserId(),Integer.valueOf(gameId),totalMap);
				userGameMap.put("total", totalMap);
				System.out.println("---------------- totalMap Now : "+userGameMap);
			}
			if(gameMap != null)
			{
				session.setAttribute("gameDetails", gameMap);
				session.setAttribute("playerList", playersList);
				session.setAttribute("clubList", clubList);
				session.setAttribute("userGameDetails", userGameMap);
				String gameDetailsJson = "";
				String playerListJson = "";
				String clubListJson = "";
				String userGameJson = "";
				 ObjectMapper mapperObj = new ObjectMapper();
				 try
				 {
					 gameDetailsJson = mapperObj.writeValueAsString(gameMap);
					 logger.debug("-------- Login : gameDetailsJson: "+gameDetailsJson);
					 playerListJson = mapperObj.writeValueAsString(playersList);
					 logger.debug("-------- Login : playerListJson: "+playerListJson);
					 clubListJson = mapperObj.writeValueAsString(clubList);
					 logger.debug("-------- Login : clubListJson: "+clubListJson);
					 userGameJson = mapperObj.writeValueAsString(userGameMap);
					 logger.debug("-------- Login : userGameJson: "+userGameJson);
					 session.setAttribute("gameDetailsJson", gameDetailsJson);
					 session.setAttribute("playerListJson", playerListJson);
					 session.setAttribute("clubListJson", clubListJson);
					 session.setAttribute("userGameJson", userGameJson);
				 }
				 catch(Exception ex)
				 {
					 logger.error("---------- Entry in parsing map to json: "+ex);
				 }
				
			}
			/* Code start to fetch plan list */
			String freeWildCardPlanId = LeaguePlanUtil.getFreeWildCardId(userId); 
			if(freeWildCardPlanId ==null || freeWildCardPlanId.equals(""))
			{
				session.setAttribute("hasFreeWildCard", false);
				logger.debug("------------------- hasFreeWildCard: false");
			}
			else
			{
				session.setAttribute("hasFreeWildCard", true);
				logger.debug("------------------- hasFreeWildCard: true");
				session.setAttribute("freeWildCardPlanId", freeWildCardPlanId);
			}
			session.setAttribute("planDiscountId", LeaguePlanUtil.getDefualtPlanDiscountId());
			List<WildCard> purchableWildCardList = LeaguePlanUtil.getPurchableWildCardList();
			session.setAttribute("purchableWildCardList", purchableWildCardList);
			
			try
			{
				ObjectMapper mapperObj = new ObjectMapper();
				String purchableWildCardJson = mapperObj.writeValueAsString(purchableWildCardList);
				session.setAttribute("purchableWildCardJson", purchableWildCardJson);
			}
			catch(Exception ex)
			 {
				 logger.error("---------- Error in parsing map to json: "+ex);
			 }
			/* Code end to fetch plan list */
		 }
		 else
		 {
			 modeMap.put("isLogined", false);
			 modeMap.put("errorCode", UserManager.getErrorCode());
			 modeMap.put("errorMessage", UserManager.getErrorMessage());
			 if(UserManager.getErrorCode().equals(ErrorConstrant.TRANSACTION_ERROR))
			 modeMap.put("errorMessage", "Invalid URL");
		 }
		
	}
	 
	 logger.debug("---------- Redircting to : "+SportConstrant.USER_LANDING_REDIRECT_PAGE);
	 return SportConstrant.USER_LANDING_REDIRECT_PAGE;
	}
	@RequestMapping(value = "forgotPassword", method = RequestMethod.GET)
	public  String forgorPassword(ModelMap modeMap,@RequestParam String emailId)
	{
	 logger.debug("---------- Entry in forgotPassword  ---- Path Variable EmailId:  "+emailId);
	 modeMap.clear();
	 if(emailId == null || emailId.equals(SportConstrant.NULL))
	 {
		 modeMap.put("errorCode", ErrorConstrant.EMPTY_LOGON);
		 modeMap.put("errorMessage", "Invalid URL");
	 }
	
	 if(modeMap.size() == 0)
	 {
		 logger.debug("---------- Calling Hibernate getPasswordByEmail Method: ");
		 String password = UserManager.getPasswordByEmail(emailId);
		 logger.debug("---------- Fetche User Passoword: "+password);
		 if(password != null && !password.equals(SportConstrant.NULL))
		 {
				try
				{
					password = EncodeDecoder.decrypt(password);
					logger.debug("--------- password: After Decoding:  "+password);
				}
				catch(Exception ex)
				{
					logger.error("--------- Error in encoding password: "+ex);
				}
			 logger.debug("---------- Starting to send mail");
			 try
				{
					Map<String,Object> mailMap = new java.util.HashMap<String,Object>();
					
					mailMap.put(SportConstrant.FROM, propFileUtility.getEnvProperty().getString(SportConstrant.FROM));
					mailMap.put(SportConstrant.TO,emailId);
					mailMap.put("password", password);
					mailMap.put(SportConstrant.VELOCIYY_FILE_LOC,propFileUtility.getEnvProperty().getString(SportConstrant.FORGOT_PASS_EMAIL_LOC) );
					mailMap.put(SportConstrant.SUBJECT, propFileUtility.getEnvProperty().getString(SportConstrant.FORGOT_PASSWORD_EMAIL_SUB));
					mailUtility.sendHtmlMail(mailMap);
					logger.debug("----------- end to send mail------");
					modeMap.put("message", "Password is sent to provided email");
				}
				catch (Exception ex)
				{
					logger.error("----------- Excepton in Sending Mail ----------"+ex);
					modeMap.put("message", "Could not send mail on provided email Id");
				}
			 		 
		 }
		 else
		 {
			 modeMap.put("errorCode", UserManager.getErrorCode());
			 modeMap.put("errorMessage", UserManager.getErrorMessage());
			 if(UserManager.getErrorCode().equals(ErrorConstrant.TRANSACTION_ERROR))
			 modeMap.put("errorMessage", "Invalid URL");
		 }
		
	}
	 logger.debug("---------- Forwardng to : "+SportConstrant.FORGOT_PASS_RESULT_PAGE);
	 return SportConstrant.FORGOT_PASS_RESULT_PAGE;
	}
	@RequestMapping(value = "UpdateAction", method = RequestMethod.POST)
	public String updateUser(ModelMap modeMap,@RequestParam Map<String,String> userMap,HttpServletRequest request)
	{
		logger.debug("Entry in UpdateAction method model Map: "+modeMap);
		if(userMap.get("userId") == null || userMap.get("userId").equals(SportConstrant.NULL))
		{
			modeMap.put("userIdError", "UserId is required");
		}
		if(userMap.get(SportConstrant.ACTION) != null && userMap.get(SportConstrant.ACTION).equals(SportConstrant.CHANGE_PASS))
		{
			if(userMap.get("logonPassword") == null || userMap.get("logonPassword").equals(SportConstrant.NULL))
			modeMap.put("newPasswordError", "New Password is required");
			else
			{
				logger.debug("--------- password: "+userMap.get("logonPassword"));
				try
				{
					userMap.put("logonPassword", EncodeDecoder.encrypt(userMap.get("logonPassword")));
					logger.debug("--------- password: After Encoding:  "+userMap.get("logonPassword"));
				}
				catch(Exception ex)
				{
					logger.error("--------- Error in encoding password: "+ex);
				}
			}
		}
		logger.debug("------------ Error Map: "+modeMap);
		if(modeMap.isEmpty())
		{
			boolean isUpdated = UserManager.saveUser(userMap);
			modeMap.put("isUpdated",isUpdated);
			if(isUpdated)
			{
				modeMap.put("message","Your profile is updated");
				logger.debug("----------- start to send mail------");
				if(userMap.get(SportConstrant.ACTION) != null && userMap.get(SportConstrant.ACTION).equals(SportConstrant.CHANGE_PASS))
				{
						String emailId = SportConstrant.NULL;
						String displayName = SportConstrant.NULL;
						if(userMap.get("emailId") != null && !userMap.get("emailId").equals(SportConstrant.NULL))
						{
							emailId = userMap.get("emailId");
						}
						else
						{
							HttpSession session = request.getSession();
							if(session.getAttribute("user") !=null && ((User)session.getAttribute("user")).getEmailId() != null && !((User)session.getAttribute("user")).getEmailId().equals(SportConstrant.NULL))
							{
								emailId = ((User)session.getAttribute("user")).getEmailId();
							}
							if(session.getAttribute("user") !=null && ((User)session.getAttribute("user")).getDisplayName() != null && !((User)session.getAttribute("user")).getDisplayName().equals(SportConstrant.NULL))
							{
								displayName = ((User)session.getAttribute("user")).getDisplayName();
							}
						}
						if(!emailId.equals(SportConstrant.NULL))
						{
							try
							{
								Map<String,Object> mailMap = new java.util.HashMap<String,Object>();
								//mailMap.put(SportConstrant.FROM, propFileUtility.getEnvProperty().getString(SportConstrant.FROM));
								mailMap.put(SportConstrant.TO,emailId);
								mailMap.put("displayName", displayName);
								mailMap.put(SportConstrant.VELOCIYY_FILE_LOC,propFileUtility.getEnvProperty().getString(SportConstrant.USER_PASS_CHANGE_EMAIL_LOC));
								mailMap.put(SportConstrant.SUBJECT, propFileUtility.getEnvProperty().getString(SportConstrant.USER_PASS_CHANGE_EMAIL_SUB));
								mailUtility.sendHtmlMail(mailMap);
								logger.debug("----------- Mail sent successfylly to mail Id: "+emailId);
							}
							catch (Exception ex)
							{
								logger.error("----------- Excepton in Sending Mail ----------"+ex);
							}
						}
						else
						{
							logger.error("-------Do not found email to send the mail ----------: "+emailId);
						}
						
				}
				
			}
			else
			{
				if(userMap.get(SportConstrant.ACTION) != null && userMap.get(SportConstrant.ACTION).equals(SportConstrant.CHANGE_PASS))
				{
					modeMap.put("message","Password Chagne Request failed due to "+UserManager.getErrorMessage());
				}
				else
				{
					modeMap.put("message","Your Registration is failed due to "+UserManager.getErrorMessage());
				}
			}
		}
		else
		{
			modeMap.put("message","Your Registration is failed due to incomplete info");
		}
		modeMap.put(SportConstrant.ACTION,userMap.get(SportConstrant.ACTION));
		//return "redirect:/login/loginSuccess.jsp";
		return SportConstrant.USER_UPDATE_RESULT_PAGE;

	}
	@RequestMapping(value = "UserUpdateView", method = RequestMethod.GET)
	public  String updateView(ModelMap modeMap,HttpServletRequest request)
	{
		 logger.debug("---------- Entry in --- UpdateView");
		 HashMap<String,HashMap<String,ArrayList<String>>> countryStateCityMap = UserManager.getCountryStateCityMap();
		 logger.debug("-------- UpdateView : countryStateCityMap: "+countryStateCityMap);
		 modeMap.put("countryStateCityMap", countryStateCityMap);
		 String countryStateCityJson = "{}";
		 if(countryStateCityMap != null)
		 {
			 ObjectMapper mapperObj = new ObjectMapper();
			 try
			 {
				 countryStateCityJson = mapperObj.writeValueAsString(countryStateCityMap);
				 logger.debug("-------- UpdateView : countryStateCityJson: "+countryStateCityJson);
				 modeMap.put("countryStateCityJson", countryStateCityJson);
			 }
			 catch(Exception ex)
			 {
				 logger.error("---------- Entry in parsing map to json: "+ex);
			 }
		 }
		 return SportConstrant.USER_UPDATE_PAGE;
	}
	@RequestMapping(value = "ChangePasswordView", method = RequestMethod.GET)
	public  String changePasswordView(ModelMap modeMap,HttpServletRequest request)
	{
		logger.debug("---------- Forwardng to : "+SportConstrant.CHANGE_PASSWORD_PAGE);
		 return SportConstrant.CHANGE_PASSWORD_PAGE;
	}
	@RequestMapping(value = "ForgotPasswordView", method = RequestMethod.GET)
	public  String forgotPasswordView(ModelMap modeMap,HttpServletRequest request)
	{
		logger.debug("---------- Forwardng to : "+SportConstrant.FORGOT_PASSWORD_PAGE);
		 return SportConstrant.FORGOT_PASSWORD_PAGE;
	}
	@RequestMapping(value = "UserLanding", method = RequestMethod.GET)
	public  String userLanding(ModelMap modeMap,HttpServletRequest request)
	{
		logger.debug("---------- Forwardng to : "+SportConstrant.USER_LANDING_PAGE);
		 return SportConstrant.USER_LANDING_PAGE;
	}
	@RequestMapping(value = "UserLandingHome", method = RequestMethod.GET)
	public  String userLandingHome(ModelMap modeMap,HttpServletRequest request)
	{
		logger.debug("---------- Forwardng to : "+SportConstrant.USER_LANDING_PAGE);
		 return SportConstrant.USER_LANDING_HOME_PAGE;
	}
	@RequestMapping(value = "Logout", method = RequestMethod.GET)
	public  ModelAndView logout(ModelMap modeMap,HttpServletRequest request)
	{
		
		HttpSession session = request.getSession();
		session.invalidate();
		logger.debug("---------- Redirecting to : LeagueHome");
		return new ModelAndView("redirect:/mvc/LeagueHome");
	}
	@RequestMapping(value = "activateWildCard", method = RequestMethod.GET)
	public String activateWildCard(ModelMap modelMap,@RequestParam Map<String,String> wildCardMap, HttpServletRequest request)
	{
		logger.debug("---------- Inside activateWildCard ----------");
		if(wildCardMap.get("planId") == null || wildCardMap.get("planId").equals(""))
		{
			modelMap.put("isSuccess", false);
			modelMap.put("message", "Plan Id is required");
			logger.debug("---------- Plan Id is not available ----------");
		}
		if(wildCardMap.get("userId") == null || wildCardMap.get("userId").equals(""))
		{
			modelMap.put("isSuccess", false);
			modelMap.put("message", "userId is required");
			logger.debug("---------- User Id is not available ----------");
		}
		if(modelMap == null || modelMap.size() == 0)
		{
			if(LeaguePlanUtil.activatePlanForUser(wildCardMap.get("planId"), wildCardMap.get("userId"), null, null))
			{
				modelMap.put("isSuccess", true);
				modelMap.put("message", "Plan is activated");
				HttpSession session = request.getSession();
				User user =(User) session.getAttribute("user");
				ActivePlan activePlan = PlanManager.getActivePlans(String.valueOf(user.getUserId()));
				 if(activePlan == null)
				 {
					 logger.debug("---------- Setting User has not active Plan");
					 user.setHasActivePlan(false);
				 }
				 else
				 {
					 logger.debug("---------- Setting User has active Plan");
					 user.setHasActivePlan(true);
					 user.setActivePlan(activePlan);
					 logger.debug(activePlan);
				 }
				
			}
			else
			{
				modelMap.put("isSuccess", false);
				modelMap.put("message", "Plan is not activated");
			}
		}
		return SportConstrant.USER_PLAN_PAGE;	
	}
}
