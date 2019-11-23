# Eclipse AspectJ Docker image

This image provides Java 11 JDK and Eclipse AspectJ.

## Usage

```console
# docker run -it \
  -v $PWD:/work \
  upshift/aspectj \
  ajc MyAspect.aj MyClass.java
```

