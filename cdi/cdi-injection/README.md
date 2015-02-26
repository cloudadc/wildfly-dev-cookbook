## What is it?

Demonstrates the use of CDI 1.1 Injection and Qualifiers with JSF as the front-end client.

## How it work?

* Inject annotation

~~~
@Named("translation")
@RequestScoped
public class TranslateServiceBean 
~~~

~~~
    @Inject
    @Chinese
    private TranslateService chineseTranslateService;
~~~

~~~
@Chinese
public class ChineseTranslateService implements TranslateService {
~~~

* Qualifiers annotation

~~~
@Qualifier
@Target({ElementType.TYPE, ElementType.FIELD, ElementType.PARAMETER})
@Documented
@Retention(RetentionPolicy.RUNTIME)
public @interface Chinese {
}
~~~

* JSF front-end client

~~~
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:ui="http://java.sun.com/jsf/facelets" xmlns:h="http://java.sun.com/jsf/html"
    xmlns:f="http://java.sun.com/jsf/core">

<div>
        Chinese Hello: #{translation.chineseHello}
</div>
~~~
