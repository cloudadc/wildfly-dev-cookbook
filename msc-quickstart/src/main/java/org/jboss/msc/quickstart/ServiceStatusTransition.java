package org.jboss.msc.quickstart;

import org.jboss.msc.service.AbstractServiceListener;
import org.jboss.msc.service.Service;
import org.jboss.msc.service.ServiceBuilder;
import org.jboss.msc.service.ServiceContainer;
import org.jboss.msc.service.ServiceController;
import org.jboss.msc.service.ServiceController.Transition;
import org.jboss.msc.service.ServiceName;
import org.jboss.msc.service.StartContext;
import org.jboss.msc.service.StartException;
import org.jboss.msc.service.StopContext;

public class ServiceStatusTransition {

	public static void main(String[] args) throws InterruptedException {

		ServiceContainer container = ServiceContainer.Factory.create("ServiceStatusTransition"); 
		Service<TestService> service = new TestService(true);
		ServiceBuilder<TestService> builder = container.addService(TestService.NAME, service);
		ServiceController<TestService> controller = builder.install();
		controller.addListener(new AbstractServiceListener<TestService>(){

			@Override
			public void transition(ServiceController<? extends TestService> controller,Transition transition) {
				System.out.println(transition);
			}});
		Thread.sleep(1000);
		container.shutdown();
	}
	
	public static class TestService implements Service<TestService>  {
		
		public static final ServiceName NAME = ServiceName.of("test.status");
		
		private boolean isFailed;
		
		public TestService(boolean isFailed) {
			this.isFailed = isFailed;
		}

		@Override
		public TestService getValue() throws IllegalStateException,IllegalArgumentException {
			return this;
		}

		@Override
		public void start(StartContext context) throws StartException {
			if(isFailed)
				throw new StartException();
		}

		@Override
		public void stop(StopContext context) {
		}
	}

}
