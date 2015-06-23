package org.jboss.msc.quickstart;

import org.jboss.msc.service.Service;
import org.jboss.msc.service.ServiceName;
import org.jboss.msc.service.StartContext;
import org.jboss.msc.service.StartException;
import org.jboss.msc.service.StopContext;

public class MyService implements Service<Boolean> {
	
	final static ServiceName SERVICE = ServiceName.of("helloworld");

    private final String message;

    private Thread thread;

    private boolean active;

    public MyService(String message) {
        this.message = message;
    }

    public void start(final StartContext startContext) throws StartException {
        startContext.asynchronous();
        this.active = true;
        this.thread = new Thread(new Runnable() {
            public void run() {
                startContext.complete();

                while (active) {
                    System.err.println(message);
                    try {
                        Thread.sleep(1000);
                    } catch (InterruptedException e) {
                    	Thread.currentThread().interrupt();
                    }
                }

            }
        });

        this.thread.start();
    }

    public void stop(StopContext stopContext) {
        this.active = false;
    }

    public Boolean getValue() throws IllegalStateException, IllegalArgumentException {
        return active;
    }
}

