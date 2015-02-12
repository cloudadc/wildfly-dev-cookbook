package org.wildfly.tutorial.persistence.test;

import java.io.IOException;
import java.sql.SQLException;

import org.apache.openjpa.jdbc.meta.ReverseMappingTool;

public class ReverseMappingToolTest {

	public static void main(String[] args) throws IOException, SQLException {

		ReverseMappingTool.main(new String[] {"-directory", "_generate", "-accessType", "fields",
											  "-useGenericCollections", "true", "-package", "org.wildfly.tutorial.persistence.entity",
											  "-metadata", "none", "-annotations", "true",
											  "-innerIdentityClasses", "false", "-useBuiltinIdentityClass", "false",
											  "-primaryKeyOnJoin", "false"});
	}

}
