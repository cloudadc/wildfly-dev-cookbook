package org.wildfly.tutorial.cdi.injection.bean;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;

import org.wildfly.tutorial.cdi.injection.TranslateService;
import org.wildfly.tutorial.cdi.injection.qualifier.Chinese;
import org.wildfly.tutorial.cdi.injection.qualifier.English;
import org.wildfly.tutorial.cdi.injection.qualifier.Spanish;

@Named("translation")
@RequestScoped
public class TranslateServiceBean {
	
	@Inject
    @English
    private TranslateService englishTranslateService;
	
	@Inject
    @Spanish
    private TranslateService spanishTranslateService;

    @Inject
    @Chinese
    private TranslateService chineseTranslateService;
    
    public String getSpanishHello() {
        return spanishTranslateService.hello();
    }

    public String getEnglishHello() {
        return englishTranslateService.hello();
    }
    
    public String getChineseHello() {
        return chineseTranslateService.hello();
    }


}
