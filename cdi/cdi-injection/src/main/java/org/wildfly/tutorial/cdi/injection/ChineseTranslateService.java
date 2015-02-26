package org.wildfly.tutorial.cdi.injection;

import org.wildfly.tutorial.cdi.injection.qualifier.Chinese;

@Chinese
public class ChineseTranslateService implements TranslateService {

	@Override
	public String hello() {
		return "你好";
	}

}
