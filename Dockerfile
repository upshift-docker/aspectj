FROM openjdk:11

LABEL maintainer="docker-remove@upshift.fr"

#ENV JAVA_HOME=/usr/local/openjdk-11
ENV ASPECTJ_HOME=/usr/local/aspectj
ENV CLASSPATH=.:$ASPECTJ_HOME/lib/aspectjrt.jar
ENV PATH=$ASPECTJ_HOME/bin:$PATH

RUN groupadd -r -g 1000 java && useradd -r -g java -u 1000 java

RUN set -eux; \
	wget -O /tmp/aspectj.jar http://mirror.ibcp.fr/pub/eclipse/tools/aspectj/aspectj-1.9.4.jar; \
	unzip -d /tmp/aspectj /tmp/aspectj.jar \
	; \
	mkdir -p $ASPECTJ_HOME; \
	mv /tmp/aspectj/files/lib $ASPECTJ_HOME/; \
	mv /tmp/aspectj/files/doc $ASPECTJ_HOME/; \
	mv /tmp/aspectj/files/*.html $ASPECTJ_HOME/doc/ \
	; \
	rm -rf /tmp/aspectj /tmp/aspectj.jar

RUN mkdir /work && chown java:java /work

COPY bin $ASPECTJ_HOME/bin

WORKDIR /work
USER java

CMD ["bash"]
