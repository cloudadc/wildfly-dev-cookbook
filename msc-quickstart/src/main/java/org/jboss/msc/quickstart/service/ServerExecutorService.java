package org.jboss.msc.quickstart.service;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.SynchronousQueue;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

import org.jboss.msc.service.Service;
import org.jboss.msc.service.StartContext;
import org.jboss.msc.service.StartException;
import org.jboss.msc.service.StopContext;

public class ServerExecutorService implements Service<ExecutorService> {

    private final ThreadFactory threadFactory;
    private ExecutorService executorService;

    private ServerExecutorService(ThreadFactory threadFactory) {
        this.threadFactory = threadFactory;
    }

    @Override
    public synchronized void start(StartContext context) throws StartException {
        executorService = new ThreadPoolExecutor(0, Integer.MAX_VALUE, 20L, TimeUnit.SECONDS,
                new SynchronousQueue<Runnable>(), threadFactory);
    }

    @Override
    public synchronized void stop(final StopContext context) {

        if (executorService != null) {
            context.asynchronous();
            Thread executorShutdown = new Thread(new Runnable() {
                @Override
                public void run() {
                    try {
                        executorService.shutdown();
                    } finally {
                        executorService = null;
                        context.complete();
                    }
                }
            }, "ServerExecutorService Shutdown Thread");
            executorShutdown.start();
        }
    }

    @Override
    public synchronized ExecutorService getValue() throws IllegalStateException, IllegalArgumentException {
        return executorService;
    }
}
