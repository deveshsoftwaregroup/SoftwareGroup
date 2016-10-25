package com.sportmgmt.utility.common;

import java.util.Date;

import org.apache.log4j.Logger;
import org.springframework.scheduling.annotation.Scheduled;


public class SportSchedular {
	private static Logger logger = Logger.getLogger(SportSchedular.class); 
	@Scheduled(fixedDelay=5000)
	public void test(){
	        System.out.println("Started fixed delay job at:  "+new Date());
	        /**
	         * add your scheduled job logic here
	         */
	        logger.debug(" -------------- Started fixed delay job at:  "+new Date());
	    }
}
