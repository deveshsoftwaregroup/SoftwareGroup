package com.sportmgmt.controller.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sportmgmt.model.manager.GameManager;
import com.sportmgmt.utility.common.ApplicationDataUtility;
import com.sportmgmt.utility.common.SortUtility;
import com.sportmgmt.utility.constrant.SportConstrant;

@Controller
@RequestMapping("/player")
public class PlayerAction {
	
	@Autowired
	private SortUtility sortUtility;
		
	
	public SortUtility getSortUtility() {
		return sortUtility;
	}


	public void setSortUtility(SortUtility sortUtility) {
		this.sortUtility = sortUtility;
	}


	@RequestMapping(value = "orderBy/{orderBy}", method = RequestMethod.GET)
	public @ResponseBody Map orderBy(@PathVariable String orderBy, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		List playerList = (List)session.getAttribute("playerList");
		Map resultMap = new HashMap();
		if(orderBy.equals("price"))
		{
			playerList =sortUtility.sortPlayerListByPrice(playerList);
		}
		else if(orderBy.equals("total_score"))
		{
			playerList = sortUtility.sortPlayerListByTotalPoint(playerList);
		}
		else if(orderBy.equals("user_count"))
		{
			playerList = sortUtility.sortPlayerListByUserCount(playerList);
		}
		resultMap.put("success", true);
		resultMap.put("playerList", playerList);
		session.setAttribute("playerList", playerList);
		session.setAttribute("playersOrderBy", orderBy);
		return resultMap;
	}
}
