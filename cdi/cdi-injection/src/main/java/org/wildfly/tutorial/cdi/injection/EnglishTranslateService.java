package org.wildfly.tutorial.cdi.injection;

import org.wildfly.tutorial.cdi.injection.qualifier.English;

@English
public class EnglishTranslateService implements TranslateService {

	@Override
	public String hello() {
		return "Hello";
	}

}
