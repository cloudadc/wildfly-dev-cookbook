package org.jboss.loggermanager.examples;

import java.net.MalformedURLException;

import org.apache.log4j.Logger;

public class Log4jExample {

    public static void main(String[] args) throws MalformedURLException {

        // 2. Specify the alternate log manager as a system property
        System.setProperty("java.util.logging.manager", "org.jboss.logmanager.LogManager");
        
        // 3. Specify a system property point to logging.properties(optional, if not set, a configuration locator will find 'logging.properties' in the class path)
        String propUrl = Log4jExample.class.getClassLoader().getResource("log4j/logging.properties").toString();
        System.out.println(propUrl);
        System.setProperty("logging.configuration", propUrl);
        
        // 4. Initialize a Logger
        Logger logger = Logger.getLogger(Log4jExample.class);
        
        // 5. logging the message
        logger.fatal("fatal");
        logger.error("error");
        logger.warn("warn");
        logger.info("info");
        logger.debug("debug");
        logger.trace("trace");
        
        Log4jTest.test();
        Log4jTest.testExection();
    }

}
