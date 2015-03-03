package org.wildfly.tutorial.cluster.slsb;

import javax.ejb.Remote;
import javax.ejb.Stateless;

import org.jboss.ejb3.annotation.Clustered;

@Stateless
@Remote(StatelessSession.class)
@Clustered
public class StatelessSessionBean implements StatelessSession {

	public String getServer() {
		StringBuffer sb = new StringBuffer();
        
        String ip = System.getProperty("jboss.bind.address");
        if(null != ip) {
                sb.append("jboss.bind.address: " + ip);
                sb.append(", jboss.node.name: ");
        }
        
        String jbossNodeName = System.getProperty("jboss.node.name");
        if(null != jbossNodeName) {
                sb.append(jbossNodeName);
        }
        
        String result = sb.toString();
        
        System.out.println(result);
        
        return result;
	}

}
