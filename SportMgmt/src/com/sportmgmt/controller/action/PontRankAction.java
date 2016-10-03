package com.sportmgmt.controller.action;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.sportmgmt.utility.constrant.SportConstrant;

@Controller
@RequestMapping("/game")
public class PontRankAction {
	Logger logger = Logger.getLogger(PontRankAction.class);
	@RequestMapping(value = "RankingView/{gameId}", method = RequestMethod.GET)
	public  String rankingView(ModelMap modeMap,HttpServletRequest request,@PathVariable String gameId)
	{
		logger.debug("---------- IN RankingView to : "+gameId);
		modeMap.put("message", "Mazze Karo-------------");
		return SportConstrant.RANKING_PAGE;
	}
	@RequestMapping(value = "PointTableView/{gameId}", method = RequestMethod.GET)
	public  String pointTableView(ModelMap modeMap,HttpServletRequest request,@PathVariable String gameId)
	{
		logger.debug("---------- IN PointTableView to : "+gameId);
		modeMap.put("message", "Just Chill Pagla-------------");
		return SportConstrant.POINT_TABLE_PAGE;
	}
}
