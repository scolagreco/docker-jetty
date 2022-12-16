#FROM amazoncorretto:17-alpine
FROM amazoncorretto:11

ARG JETTY_BASE_VERSION

ENV JETTY_HOME=/opt/jetty
ENV JETTY_BASE=/opt/jetty-base

ENV JETTY_LOGS=${JETTY_BASE}/logs
VOLUME ["${JETTY_LOGS}"]

ADD jetty-dist-${JETTY_BASE_VERSION}.tgz ${JETTY_HOME}

RUN mv ${JETTY_HOME}/demo-base/* ${JETTY_BASE}

EXPOSE 80 443 8443

WORKDIR ${JETTY_BASE}

CMD ["java",\
    "-Djdk.tls.ephemeralDHKeySize=2048", \
    "-Djetty.base=/opt/jetty-base",\
    "-Djetty.logs=/opt/jetty-base/logs",\
    "-jar", "/opt/jetty/start.jar"]

# Metadata params
ARG BUILD_DATE
ARG VERSION=${JETTY_BASE_VERSION}
ARG VCS_URL="https://github.com/scolagreco/docker-jetty"
ARG VCS_REF
ARG AUTHORS="Stefano Colagreco <stefano@colagreco.it>"
ARG VENDOR

# Metadata
LABEL org.opencontainers.image.authors=$AUTHORS \
      org.opencontainers.image.vendor=$VENDOR \
      org.opencontainers.image.title="docker-jetty" \
      org.opencontainers.image.created=$BUILD_DATE \
      org.opencontainers.image.version=$VERSION \
      org.opencontainers.image.source=$VCS_URL \
      org.opencontainers.image.revision=$VCS_REF \
      org.opencontainers.image.description="Basata su Amazon Corretto e Jetty version ${JETTY_BASE_VERSION}"
