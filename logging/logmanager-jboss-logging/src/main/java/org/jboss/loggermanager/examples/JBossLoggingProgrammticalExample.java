package org.jboss.loggermanager.examples;

import java.io.IOException;
import java.util.Locale;
import java.util.Properties;

import org.jboss.logging.Logger;
import org.jboss.logmanager.PropertyConfigurator;

public class JBossLoggingProgrammticalExample {
    
    public static void main(String[] args) throws IOException {

        // 2. Specify the alternate log manager as a system property
        System.setProperty("java.util.logging.manager", "org.jboss.logmanager.LogManager");
        
        // 3. Configure Programmtically
        String logLevel = "TRACE";
        String logFile = "target/jboss-logging-programmtically.log";
        PropertyConfigurator configurator = new PropertyConfigurator();
        configurator.configure(createLogManagerConfig(logLevel, logFile));
        
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
    
    private static Properties createLogManagerConfig(String logLevel, String logFile) {
        final Properties properties = new Properties();
        // Root log level
        properties.setProperty("logger.level", logLevel.toUpperCase(Locale.ENGLISH));
        properties.setProperty("logger.handlers", "FILE,CONSOLE");
        
        properties.setProperty("handler.CONSOLE", "org.jboss.logmanager.handlers.ConsoleHandler");
        properties.setProperty("handler.CONSOLE.level", logLevel.toUpperCase(Locale.ENGLISH));
        properties.setProperty("handler.CONSOLE.formatter", "COLOR-PATTERN");
        properties.setProperty("handler.CONSOLE.properties", "autoFlush,target,enabled");
        properties.setProperty("handler.CONSOLE.autoFlush", "true");
        properties.setProperty("handler.CONSOLE.target", "SYSTEM_OUT");
        properties.setProperty("handler.CONSOLE.enabled", "true");

        // Configure the handler
        properties.setProperty("handler.FILE", "org.jboss.logmanager.handlers.PeriodicRotatingFileHandler");
        properties.setProperty("handler.FILE.level", logLevel.toUpperCase(Locale.ENGLISH));
        properties.setProperty("handler.FILE.formatter", "PATTERN");
        properties.setProperty("handler.FILE.properties", "autoFlush,append,fileName,enabled");
        properties.setProperty("handler.FILE.constructorProperties", "fileName,append");
        properties.setProperty("handler.FILE.append", "true");
        properties.setProperty("handler.FILE.autoFlush", "true");
        properties.setProperty("handler.FILE.enabled", "true");
        properties.setProperty("handler.FILE.suffix", ".yyyy-MM-dd");
        properties.setProperty("handler.FILE.fileName", logFile);
        
        // Configure the formatter
        properties.setProperty("formatter.PATTERN", "org.jboss.logmanager.formatters.PatternFormatter");
        properties.setProperty("formatter.PATTERN.pattern", "%d{yyyy-MM-dd HH:mm:ss,SSS} %-5p [%c] (%t) %s%e%n");
        properties.setProperty("formatter.PATTERN.properties", "pattern");
        
        properties.setProperty("formatter.COLOR-PATTERN", "org.jboss.logmanager.formatters.PatternFormatter");
        properties.setProperty("formatter.COLOR-PATTERN.properties", "pattern");
        properties.setProperty("formatter.COLOR-PATTERN.pattern", "%K{level}%d{HH\\:mm\\:ss,SSS} %-5p [%c] (%t) %s%e%n");
        
        return properties;
    }

}
