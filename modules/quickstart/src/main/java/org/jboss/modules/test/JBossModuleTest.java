package org.jboss.modules.test;

import org.jboss.modules.LocalModuleFinder;
import org.jboss.modules.Module;
import org.jboss.modules.ModuleFinder;
import org.jboss.modules.ModuleIdentifier;
import org.jboss.modules.ModuleLoadException;
import org.jboss.modules.ModuleLoader;
import org.jboss.modules.ModuleSpec;
import org.jboss.modules.quickstart.MainDebug;

public class JBossModuleTest {

	public static void main(String[] args) throws Throwable {
		
		System.setProperty("boot.module.loader", TestModuleLoader.class.getName());

//		ModuleLoader loder = Module.getBootModuleLoader();
		
		org.jboss.modules.Main.main(MainDebug.array);
	}
	
	public static class TestModuleLoader extends ModuleLoader{
		
		public TestModuleLoader() {
			super(new ModuleFinder[]{new TestModuleFinder()});
		}
	}
	
	public static class TestModuleFinder implements ModuleFinder {

		@Override
		public ModuleSpec findModule(ModuleIdentifier identifier, ModuleLoader delegateLoader) throws ModuleLoadException {
			System.out.println(identifier);
			System.out.println(delegateLoader);
			return null;
		}
		
	}

}
