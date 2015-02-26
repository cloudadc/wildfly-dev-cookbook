package org.wildfly.tutorial.cdi.injection;

import org.wildfly.tutorial.cdi.injection.qualifier.Spanish;

@Spanish
public class SpanishTranslateService implements TranslateService {

	@Override
	public String hello() {
		return "Hola";
	}

}
