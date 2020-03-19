FROM openjdk:11.0.5-slim-buster

ENV APACHEDS_VERSION 2.0.0.AM26
ENV APACHEDS_ARCH amd64

RUN apt-get update \
 && apt-get install wget procps -y

RUN wget https://www-us.apache.org/dist/directory/apacheds/dist/${APACHEDS_VERSION}/apacheds-${APACHEDS_VERSION}-${APACHEDS_ARCH}.deb
RUN dpkg -i apacheds-${APACHEDS_VERSION}-${APACHEDS_ARCH}.deb
RUN mv /etc/init.d/apacheds-${APACHEDS_VERSION}-default /etc/init.d/apacheds \
 && ln -s /var/lib/apacheds-${APACHEDS_VERSION} /var/lib/apacheds

ENTRYPOINT chown -R apacheds.apacheds /var/lib/apacheds-${APACHEDS_VERSION} \
        && service apacheds start \
        && tail -f /dev/null
EXPOSE 10389 10636