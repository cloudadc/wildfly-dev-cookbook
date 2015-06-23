package org.jboss.modules.quickstart;

public class MainDebug {
	
	public static String[] array = new String[]{"-mp",
												"target/modules-quickstart/modules",
												"org.jboss.modules.quickstart"};

	public static void main(String[] args) throws Throwable {
		

		org.jboss.modules.Main.main(array);
	}

}
