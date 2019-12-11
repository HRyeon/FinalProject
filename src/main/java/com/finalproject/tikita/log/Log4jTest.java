package com.finalproject.tikita.log;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Log4jTest {
	
	private Logger logger = LoggerFactory.getLogger(Log4jTest.class);

	public static void main(String[] args) {
		new Log4jTest().test();
	}
	
	public void test() {
		// fatal, error, warn, info, debug, trace
		// logger.fatal("fatal로그"); //slf4j.Logger에는 fatal레벨을 제공하고 있지 않음
		logger.error("error 로그");
		logger.warn("warn 로그");
		logger.info("info 로그");
		logger.debug("debug 로그");
		logger.trace("trace 로그");
	}

}











