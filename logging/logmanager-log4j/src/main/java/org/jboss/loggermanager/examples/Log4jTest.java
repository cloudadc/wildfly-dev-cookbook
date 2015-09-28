package org.jboss.loggermanager.examples;

import org.apache.log4j.Logger;

public class Log4jTest {

    
    static Logger logger = Logger.getLogger(Log4jTest.class);

    public static void test() {

        logger.fatal("fatal");
        logger.error("error");
        logger.warn("warn");
        logger.info("info");
        logger.debug("debug");
        logger.trace("trace");
    }
    
    public static void testExection() {
        
        Exception e = new Exception("A Exception");

        logger.fatal("fatal", e);
        logger.error("error", e);
        logger.warn("warn", e);
        logger.info("info", e);
        logger.debug("debug", e);
        logger.trace("trace", e);
    }

}
