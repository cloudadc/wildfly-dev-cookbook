package org.jboss.msc.quickstart;

import org.jboss.msc.service.Service;
import org.jboss.msc.service.ServiceBuilder;
import org.jboss.msc.service.ServiceContainer;
import org.jboss.msc.service.ServiceName;
import org.jboss.msc.service.ServiceTarget;
import org.jboss.msc.service.StartContext;
import org.jboss.msc.service.StartException;
import org.jboss.msc.service.StopContext;

public class HierarchyService {

	public static void main(String[] args) throws InterruptedException {
		ServiceContainer container = ServiceContainer.Factory.create("Hierarchy Service"); 
		ServiceBuilder<A> builder = container.addService(A.NAME, new A());
		builder.install();
		Thread.sleep(1000);
		container.dumpServices();
	}
	
	public static class A implements Service<A> {
		
		public static final ServiceName NAME = ServiceName.of("A");

		public A getValue() throws IllegalStateException,IllegalArgumentException {
			return this;
		}

		public void start(StartContext context) throws StartException {		
			ServiceTarget serviceTarget = context.getChildTarget();
			ServiceBuilder<B> builder = serviceTarget.addService(B.NAME, new B());
			builder.install();
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
			ServiceTarget serviceTarget = context.getChildTarget();
			ServiceBuilder<C> builder = serviceTarget.addService(C.NAME, new C());
			builder.install();
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
