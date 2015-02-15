
**bean-validation** demonstrates how to use Bean Validation in JavaEE application.

~~~
    @NotNull
    @Size(min = 1, max = 25)
    @Pattern(regexp = "[A-Za-z ]*", message = "must contain only letters and spaces")
    private String name;
~~~

~~~
    @NotNull
    @NotEmpty
    @Email
    private String email;
~~~

~~~
    @NotNull
    @Size(min = 10, max = 12)
    @Digits(fraction = 0, integer = 12)
    @Column(name = "phone_number")
    private String phoneNumber;
~~~

Bean Validation Annotation:

* @javax.validation.constraints.Digits
* @javax.validation.constraints.NotNull
* @javax.validation.constraints.Pattern
* @javax.validation.constraints.Size


