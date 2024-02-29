---
sidebar_position: 6
---

# Supported scripts

## Supported scripts

Scripts are used to define and run [actions](./actions/actions.md) but also properties inside [nodes](./node/node.md). For now, the following script languages are supported:

* [Python](#python) (Jython)
* [DMN](supported-scripts.md#dmn)
* [MVEL](supported-scripts.md#mvel)
* [Groovy](supported-scripts.md#groovy)
* [JavaScript](supported-scripts.md#nashorn-engine-javascript) (Nashorn Engine)

| Scripting Language          | Version      |
| --------------------------- | ------------ |
| Python (Jython)             | 2.7.0        |
| DMN                         | 1.3          |
| MVEL                        | 2.4.10.Final |
| Groovy                      | 3.0.8        |
| Nashorn engine (JavaScript) | 15.4         |

## Python

:::info
We use **Jython**.
:::

**Jython** is an implementation of the high-level, dynamic, object-oriented language [Python](http://www.python.org/) seamlessly integrated with the [Java](http://www.javasoft.com/) platform. Jython is an open-source solution.

#### Properties:

* Supports **Python 2.7** most common python libs can be imported, ex: math, time, etc.
* Java libs can also be imported: [details here ](https://www.tutorialspoint.com/jython/jython\_importing\_java\_libraries.htm)

#### Useful links:

[Python 2.7.18 documentation](https://docs.python.org/2.7/)

[Jython](https://www.jython.org/)

[Jython FAQs](https://wiki.python.org/jython/JythonFaq)

## DMN

Decision Model and Notation (DMN) is a standard for Business Decision Management.

FLOWX uses [BPMN.io](https://bpmn.io/) (based on **camunda-engine-dmn** version **7.14.0**) which is built on [DMN 1.3](https://www.omg.org/spec/DMN/1.3/PDF) standards.

#### Properties:

**camunda-engine-dmn** supports [DMN 1.3](https://www.omg.org/spec/DMN/1.3/PDF), including Decision Tables, Decision Literal Expressions, Decision Requirements Graphs, and the Friendly Enough Expression Language (FEEL)

#### Useful links:

[Decision Model and Notation (DMN)](https://www.omg.org/dmn/)

[DMN 1.3 specs](https://www.omg.org/spec/DMN/1.3/PDF)

**More information:**

[Intro to DMN](../platform-overview/frameworks-and-standards/business-process-industry-standards/intro-to-dmn.md)

[DMN Business Rule Action](./actions/business-rule-action/dmn-business-rule-action.md)

## MVEL

MVEL is a powerful expression language for Java-based applications. It provides a plethora of features and is suited for everything from the smallest property binding and extraction, to full-blown scripts.

* FLOWX uses [**mvel2 - 2.4.10 version**](https://mvnrepository.com/artifact/org.mvel/mvel2/2.4.10.Final)

#### Useful links:

[Mvel documentation](http://mvel.documentnode.com/)

[Maven repository: Mvel 2.4.0 final](https://mvnrepository.com/artifact/org.mvel/mvel2/2.4.0.)

#### More information:

[Intro to MVEL](../platform-overview/frameworks-and-standards/business-process-industry-standards/intro-to-mvel.md)

## Groovy

Groovy is a multi-faceted language for the Java platform. The language can be used to combine Java modules, extend existing Java applications and write new applications

We use and recommend **Groovy 3.0.8** version, using **groovy-jsr223** engine.

:::info
**Groovy** has multiple ways of integrating with Java, some of which provide richer options than available with **JSR-223** (e.g. greater configurability and more security control). **JSR-223** is recommended when you need to keep the choice of language used flexible and you don't require integration mechanisms not supported by **JSR-223**.
:::

:::info
**JSR-223** (spec) is **a standard scripting API for Java Virtual Machine (JVM) languages** . The JVM languages provide varying levels of support for the JSR-223 API and interoperability with the Java runtime.
:::

#### Useful links:

[Groovy Language Documentation](http://docs.groovy-lang.org/docs/groovy-3.0.8/html/documentation/)

[[Java] Class GroovyScriptEngineImpl](https://docs.groovy-lang.org/latest/html/gapi/org/codehaus/groovy/jsr223/GroovyScriptEngineImpl.html)

## Nashorn Engine (JavaScript)

Nashorn engine is an open source implementation of the [ECMAScript Edition 5.1 Language Specification](https://es5.github.io/). It also implements many new features introduced in ECMAScript 6 including template strings; `let`, `const`, and block scope; iterators and `for..of` loops; `Map`, `Set`, `WeakMap`, and `WeakSet` data types; symbols; and binary and octal literals. It is written in Java and runs on the Java Virtual Machine.

Latest version of **Nashorn** is **15.4**, available from [Maven Central](https://search.maven.org/artifact/org.openjdk.nashorn/nashorn-core/15.4/jar). You can check the [changelog](https://github.com/openjdk/nashorn/blob/main/CHANGELOG.md) to see what's new.

#### Useful links:

[GitHub - Nashorn](https://github.com/openjdk/nashorn)

[OpenJDK - Nashorn](https://openjdk.org/projects/nashorn/)
