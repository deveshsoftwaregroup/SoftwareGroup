package com.sportmgmt.utility.common;

import java.util.Date;

import org.apache.log4j.Logger;
import org.springframework.scheduling.annotation.Scheduled;


public class SportSchedular {
	private static Logger logger = Logger.getLogger(SportSchedular.class); 
	/*@Scheduled(fixedDelay=1000)
	public void test(){
	        System.out.println("Started fixed delay job at:  "+new Date());
	        
	        logger.debug(" -------------- Started fixed delay job at:  "+new Date());
	    }
	
	@Scheduled(fixedRate=5000)
	public void testRate(){
	        System.out.println("-------------- Started fixed rate job at:  "+new Date());
	        
	        logger.debug(" -------------- Started fixed rate job at:  "+new Date());
	    }
	*/
	@Scheduled(cron="*/5 * * * * ?")
	public void testCron(){
	        System.out.println("Started Cron job at:  "+new Date());
	        logger.debug(" -------------- Started Cron job at:   "+new Date());
	    }
}
