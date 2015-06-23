package org.jboss.msc.quickstart;

import java.util.List;

public class SimplePojo {

	public String description;
	
	public void testMethod(String value) {
		System.out.println(value);
	}
	
	private Integer id;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	public List<String> listField;
}
