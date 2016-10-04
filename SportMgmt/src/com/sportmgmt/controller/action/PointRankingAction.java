package com.sportmgmt.controller.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sportmgmt.model.entity.Point;
import com.sportmgmt.model.manager.PointRankManager;
import com.sportmgmt.utility.constrant.SportConstrant;

@Controller
@RequestMapping("/game")
public class PointRankingAction {
	Logger logger = Logger.getLogger(PointRankingAction.class);
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
		List<Point> pointObjList = PointRankManager.getMPointByGame(gameId);
		List<Map<String,String>> pointList = new ArrayList<Map<String,String>>();
		if(pointObjList != null)
		{
			for(Object pointObj:pointObjList)
			{
				Point point = (Point) pointObj;
				Map<String,String> map = new TreeMap<String,String>();
				map.put("pointId", point.getPointId().toString());
				map.put("pointName", "");
				map.put("pointDesc", "");
				map.put("pointToAdd", "");
				map.put("pointToDeduct", "");
				if(point.getPointName() !=null)
				map.put("pointName", point.getPointName());
				if(point.getPointDesc() != null)
				map.put("pointDesc", point.getPointDesc());
				if(point.getPointToAdd() !=null)
				map.put("pointToAdd", point.getPointToAdd().toString());
				if(point.getPointToDeduct() != null)
				map.put("pointToDeduct", point.getPointToDeduct().toString());
				pointList.add(map);
			}
		}
		modeMap.put("message", "Just Chill Pagla-------------");
		modeMap.put("pointList", pointList);
		logger.info("------------- Point Info ----------> "+pointList);
		return SportConstrant.POINT_TABLE_PAGE;
	}
}
