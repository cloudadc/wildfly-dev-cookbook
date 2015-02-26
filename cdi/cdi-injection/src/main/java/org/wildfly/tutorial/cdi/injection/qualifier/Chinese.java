package org.wildfly.tutorial.cdi.injection.qualifier;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.inject.Qualifier;

/**
 *  Qualifier used to help determine the intended injection object.
 *  
 *  This particular qualifier will be used to specify types which should be used for the Chinese language.
 *
 */
@Qualifier
@Target({ElementType.TYPE, ElementType.FIELD, ElementType.PARAMETER})
@Documented
@Retention(RetentionPolicy.RUNTIME)
public @interface Chinese {

}
