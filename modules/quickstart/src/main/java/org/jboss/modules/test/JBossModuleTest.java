package org.jboss.modules.test;

import org.jboss.modules.Module;
import org.jboss.modules.ModuleLoader;

public class JBossModuleTest {

	public static void main(String[] args) {

		ModuleLoader loder = Module.getBootModuleLoader();
		
		System.out.println(loder);
	}

}
