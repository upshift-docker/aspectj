# Eclipse AspectJ Docker image

This image provides Java 11 JDK and Eclipse AspectJ.

## Usage

Build:

```console
# docker run -it \
  -v $PWD:/work \
  upshift/aspectj \
  ajc MyAspect.aj MyClass.java
```

Run:

```console
# docker run -it \
  -v $PWD:/work \
  upshift/aspectj \
  java MyClass.java
```

