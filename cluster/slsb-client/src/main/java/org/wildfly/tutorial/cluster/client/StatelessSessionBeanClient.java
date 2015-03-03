package org.wildfly.tutorial.cluster.client;

import java.util.Hashtable;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.wildfly.tutorial.cluster.slsb.StatelessSession;

public class StatelessSessionBeanClient {
	
	private String applicationContext = "cluster-demo-slsb";
	private String SLSB_JNDI = "ejb:/" + applicationContext + "/StatelessSessionBean!" + StatelessSession.class.getName() ;		
	
	protected void execute() throws Exception {
		Hashtable<String, String> jndiProps = new Hashtable<String, String>();
		jndiProps.put( Context.URL_PKG_PREFIXES, "org.jboss.ejb.client.naming" );
		Context context = new InitialContext( jndiProps );
		StatelessSession slsb = (StatelessSession)context.lookup(SLSB_JNDI);
		for (int i = 0; i < 10; i++){
			System.out.println(slsb.getServer());
		}
	}


	public static void main(String[] args) throws Exception {
		new StatelessSessionBeanClient().execute();
	}
}
