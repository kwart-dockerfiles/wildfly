FROM alpine:3.12.3

MAINTAINER Josef (kwart) Cacek <josef.cacek@gmail.com>

ENV WILDFLY_VERSION=20.0.1.Final

RUN echo "Installing APK packages" \
    && apk add --update bash vim nano gawk openjdk8 \
    && echo "Installing WildFly" \
    && cd /opt \
    && wget https://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.zip \
    && unzip -q /opt/wildfly-$WILDFLY_VERSION.zip -d /opt \
    && rm /opt/wildfly-$WILDFLY_VERSION.zip \
    && mv /opt/wildfly-$WILDFLY_VERSION /opt/wildfly \
    && echo "Cleaning APK cache" \
    && rm -rf /var/cache/apk/*

COPY bashrc /root/.bashrc

WORKDIR /opt

CMD ["/bin/bash"]
