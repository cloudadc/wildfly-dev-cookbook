package org.wildfly.tutorial.cluster.sfsb;

public interface StatefulSession {
	public String getServer();
	public String getName();
	public void setName(String name);
}
