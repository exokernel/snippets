# What is dependency injection?

<https://en.wikipedia.org/wiki/Dependency_injection>

In software engineering, dependency injection is a design pattern in which an object or function receives other objects or functions that it depends on. A form of inversion of control, dependency injection aims to separate the concerns of constructing objects and using them, leading to loosely coupled programs.[1][2][3] The pattern ensures that an object or function which wants to use a given service should not have to know how to construct those services. Instead, the receiving 'client' (object or function) is provided with its dependencies by external code (an 'injector'), which it is not aware of.[4] Dependency injection helps by making implicit dependencies explicit and helps solve the following problems:[5]

    How can a class be independent from the creation of the objects it depends on?
    How can an application, and the objects it uses support different configurations?
    How can the behavior of a piece of code be changed without editing it directly?

In addition, dependency injection is used for keeping code in-line with the dependency inversion principle.[6][7]

Fundamentally, dependency injection consists of passing parameters to a method.[8]

Because the client does not build or find the service itself, it typically only needs to declare the interfaces of the services it uses, rather than their concrete implementations. This makes it easier to change which services are actually used at runtime, especially in statically-typed languages where changing the underlying objects would otherwise require re-compiling the source code.
