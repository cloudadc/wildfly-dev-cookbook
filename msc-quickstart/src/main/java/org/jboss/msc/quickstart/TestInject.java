package org.jboss.msc.quickstart;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;

import org.jboss.msc.inject.AtomicReferenceInjector;
import org.jboss.msc.inject.FieldInjector;
import org.jboss.msc.inject.Injector;
import org.jboss.msc.inject.Injectors;
import org.jboss.msc.inject.MethodInjector;
import org.jboss.msc.inject.SetMethodInjector;
import org.jboss.msc.value.ImmediateValue;
import org.jboss.msc.value.Value;
import org.jboss.msc.value.Values;

public class TestInject {
	
	static void test_1(){
		final AtomicReference<String> reference = new AtomicReference<String>();
		final Injector<String> injector = new AtomicReferenceInjector<String>(reference);
		injector.inject("Hello World");
		System.out.println(reference.get());
		injector.uninject();
	}
	
	static void test_2() throws NoSuchFieldException, SecurityException {
		final Field field = SimplePojo.class.getField("description");
		final SimplePojo pojo = new SimplePojo();
		final Injector<String> injector = new FieldInjector<String>(Values.immediateValue(pojo), field);
		injector.inject("Injection of description field");
		System.out.println(pojo.description);
		injector.uninject();
	}
	
	static void test_3() throws NoSuchMethodException, SecurityException {
		Value<SimplePojo> target = new ImmediateValue<>(new SimplePojo());
		List<Value<String>> arguments =new ArrayList<>();
		arguments.add(new ImmediateValue<String>("Hello World"));
		final Injector<String> injector = new MethodInjector<String>(SimplePojo.class.getMethod("testMethod", String.class), target, Values.immediateValue("String"), arguments);
        injector.inject(null);
	}
	
	static void test_4() throws NoSuchMethodException, SecurityException {
		Value<SimplePojo> target = new ImmediateValue<>(new SimplePojo());
		Method method = SimplePojo.class.getMethod("setId", Integer.class);
		final Injector<Integer> injector = SetMethodInjector.<Integer>create(target, method);
		injector.inject(1000);
		System.out.println(target.getValue().getId());
		injector.uninject();
	}

	public static void main(String[] args) throws NoSuchFieldException, SecurityException, NoSuchMethodException {

		final Field field = SimplePojo.class.getField("listField");
		List<String> list = new ArrayList<>();
		SimplePojo pojo = new SimplePojo();
		list.add("Hello World");
		final Injector<List> fieldInjector = new FieldInjector<>(Values.immediateValue(pojo), field);
		final Injector<Object> castingInjector = Injectors.cast(fieldInjector, List.class);
		castingInjector.inject(list);
		System.out.println(pojo.listField.get(0));
		castingInjector.uninject();
	}

}
