#lampserver

###java web projects
#####web.xml needs to look like this
```xml
<context-param>
    <param-name>dbUser</param-name>
    <param-value>javaserver</param-value>
</context-param>
<context-param>
    <param-name>dbPassword</param-name>
    <param-value>root123</param-value>
</context-param>
<context-param>
    <param-name>dbURL</param-name>
    <param-value>jdbc:mysql://192.168.56.13:3306/app01</param-value>
</context-param>
```

#####structure of java project needs to look like this

```bash
.
├── nb-configuration.xml
├── pom.xml
└── src
    └── main
        ├── java
        │   └── com
        │       └── journaldev
        └── webapp
            ├── home.jsp
            ├── META-INF
            │   └── context.xml
            └── WEB-INF
                ├── log4j.xml
                └── web.xml

```
