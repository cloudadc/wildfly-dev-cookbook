package org.jboss.msc.quickstart;

import org.jboss.msc.service.Service;
import org.jboss.msc.service.ServiceBuilder;
import org.jboss.msc.service.ServiceContainer;
import org.jboss.msc.service.ServiceName;
import org.jboss.msc.service.StartContext;
import org.jboss.msc.service.StartException;
import org.jboss.msc.service.StopContext;
import org.jboss.msc.value.InjectedValue;

public class ServiceDependency {

	public static void main(String[] args) throws InterruptedException {

		ServiceContainer container = ServiceContainer.Factory.create("ServiceDependency"); 
		A service = new A();
		ServiceBuilder<A> builder = container.addService(A.NAME, service);
		builder.addDependency(B.NAME, B.class, service.b);
		builder.addDependency(C.NAME, C.class, service.c);
		builder.install();
		container.addService(B.NAME, new B()).install();
		container.addService(C.NAME, new C()).install();
		Thread.sleep(1000);
		container.dumpServices();
	}
	
	public static class A implements Service<A> {
		
		private final InjectedValue<B> b = new InjectedValue<B>();
		private final InjectedValue<C> c = new InjectedValue<C>();
		
		public static final ServiceName NAME = ServiceName.of("A");

		public A getValue() throws IllegalStateException,IllegalArgumentException {
			return this;
		}

		public void start(StartContext context) throws StartException {		
		}

		public void stop(StopContext context) {			
		}
	} 
	
	public static class B implements Service<B> {
		
		public static final ServiceName NAME = ServiceName.of("B");

		public B getValue() throws IllegalStateException,IllegalArgumentException {
			return this;
		}

		public void start(StartContext context) throws StartException {		
		}

		public void stop(StopContext context) {			
		}
	}
	
	public static class C implements Service<C> {
		
		public static final ServiceName NAME = ServiceName.of("C");

		public C getValue() throws IllegalStateException,IllegalArgumentException {
			return this;
		}

		public void start(StartContext context) throws StartException {		
		}

		public void stop(StopContext context) {			
		}
	}


}
