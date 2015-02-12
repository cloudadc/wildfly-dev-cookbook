package org.wildfly.tutorial.persistence;

import java.io.IOException;
import java.sql.SQLException;

import org.apache.openjpa.jdbc.meta.ReverseMappingTool;

public class ReverseMapping {
	
	public static void main(String[] args) throws IOException, SQLException {
		
//		for(int i = 0 ; i < args.length ; i ++) {
//			System.out.println(args[i]);
//		}
		ReverseMappingTool.main(args);
	}
}
