package org.jboss.loggermanager.examples;

import java.net.MalformedURLException;

import org.jboss.logmanager.Level;
import org.jboss.logmanager.Logger;


public class JBossLogManagerExample {

    public static void main(String[] args) throws MalformedURLException {

        // 2. Specify the alternate log manager as a system property
        System.setProperty("java.util.logging.manager", "org.jboss.logmanager.LogManager");
        
        // 3. Specify a system property point to logging.properties(optional, if not set, a configuration locator will find 'logging.properties' in the class path)
        String propUrl = JBossLogManagerExample.class.getClassLoader().getResource("logging.properties").toString();
        System.out.println(propUrl);
        System.setProperty("logging.configuration", propUrl);
        
        // 4. Initialize a Logger
        Logger logger = Logger.getLogger(JBossLogManagerExample.class.getName());
        
        // 5. logging the message
        logger.log(Level.TRACE,"TRACE Message");
        logger.log(Level.DEBUG,"DEBUG Message");
        logger.log(Level.INFO,"INFO Message");
        logger.log(Level.WARN,"WARN Message");
        logger.log(Level.ERROR,"Error Message");
        logger.log(Level.FATAL,"FATAL Message");
    }

}
