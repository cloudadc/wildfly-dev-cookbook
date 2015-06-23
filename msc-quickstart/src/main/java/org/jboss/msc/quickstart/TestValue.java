package org.jboss.msc.quickstart;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.jboss.msc.value.CachedValue;
import org.jboss.msc.value.CheckedValue;
import org.jboss.msc.value.ClassOfValue;
import org.jboss.msc.value.ConstructedValue;
import org.jboss.msc.value.EnvironmentPropertyValue;
import org.jboss.msc.value.FieldValue;
import org.jboss.msc.value.ImmediateValue;
import org.jboss.msc.value.ListItemValue;
import org.jboss.msc.value.SystemPropertyValue;
import org.jboss.msc.value.Value;

public class TestValue {
	
	static void test_1() {
		Value<String> value = new CachedValue<>(new ImmediateValue<>("Hello World"));
		System.out.println(value.getValue());
	}
	
	static void test_2() {
		Value<String> value = new CheckedValue<>(String.class, new ImmediateValue<>("Hello World"));
		System.out.println(value.getValue());
	}
	
	static void test_3() {
		Value<Class<? extends String>> value = new ClassOfValue<>(new ImmediateValue<>(""));
		System.out.println(value.getValue());
	}
	
	static void test_4() {
		List<String> list = new ArrayList<String>();
        list.add("Hello World");
        Value<String> value = new ListItemValue<>(new ImmediateValue<List<? extends String>>(list), new ImmediateValue<>(0));
        System.out.println(value.getValue());
	}
	
	static void test_5() throws NoSuchMethodException, SecurityException {
		Constructor<SimplePojo> constructor = SimplePojo.class.getConstructor(new Class[]{});
		Value<SimplePojo> value = new ConstructedValue<>(constructor, Collections.emptyList());
		System.out.println(value.getValue());
	}
	
	static void test_6() {
		Value<String> value = new EnvironmentPropertyValue("PATH");
		System.out.println(value.getValue());
	}
	
	static void test_7() throws NoSuchFieldException, SecurityException {
		SimplePojo pojo = new SimplePojo();
		pojo.description = "Hello World";
		Field field = SimplePojo.class.getField("description");
		FieldValue<Integer> value = new FieldValue<Integer>(field, new ImmediateValue<>(pojo));
		System.out.println(value.getValue());
	}

	public static void main(String[] args) throws NoSuchMethodException, SecurityException, NoSuchFieldException {

		Value<String> value = new SystemPropertyValue("user.home");
		System.out.println(value.getValue());
	}

}
