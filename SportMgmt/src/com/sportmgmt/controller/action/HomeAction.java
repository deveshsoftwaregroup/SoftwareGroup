package com.sportmgmt.controller.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sportmgmt.utility.constrant.SportConstrant;

@Controller
public class HomeAction {
	private Logger logger = Logger.getLogger(HomeAction.class);
	@RequestMapping("/Welcome")
	public ModelAndView welcome(ModelMap map)
	{
		//UserManager.getCountryStateCityMap();
		//return SportConstrant.LEAGE_HOME_PAGE;
		return new ModelAndView("redirect:/mvc/LeagueHome");

	}
	@RequestMapping("/LeagueHome")
	public String leagueHome(ModelMap map)
	{
		//UserManager.getCountryStateCityMap();
		return SportConstrant.LEAGE_HOME_PAGE;

	}
	@RequestMapping("/LeagueLogin")
	public String login(ModelMap map)
	{
		//UserManager.getCountryStateCityMap();
		return SportConstrant.LEAGE_LOGIN_PAGE;
	}
	@RequestMapping(value = "FAQView", method = RequestMethod.GET)
	public  String fAQView(ModelMap modeMap)
	{
		logger.debug("---------- IN FAQView to : ");
		return SportConstrant.FAQ_PAGE;
	}
}
