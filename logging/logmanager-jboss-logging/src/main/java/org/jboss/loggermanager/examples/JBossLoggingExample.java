package org.jboss.loggermanager.examples;

import java.net.MalformedURLException;

import org.jboss.logging.Logger;


public class JBossLoggingExample {

    public static void main(String[] args) throws MalformedURLException {

        // 2. Specify the alternate log manager as a system property
        System.setProperty("java.util.logging.manager", "org.jboss.logmanager.LogManager");
        
        // 3. Specify a system property point to logging.properties(optional, if not set, a configuration locator will find 'logging.properties' in the class path)
        String propUrl = JBossLoggingExample.class.getClassLoader().getResource("logging.properties").toString();
        System.out.println(propUrl);
        System.setProperty("logging.configuration", propUrl);
        
        // 4. Initialize a Logger
        Logger logger = Logger.getLogger(JBossLoggingExample.class);
        
        // 5. logging the message
        logger.trace("TRACE Message");
        logger.debug("DEBUG Message");
        logger.info("INFO Message");
        logger.warn("WARN Message");
        logger.error("Error Message");
        logger.fatal("FATAL Message");
    }

}
