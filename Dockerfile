FROM progrium/busybox
MAINTAINER jbaptiste <jb@zen.ly>

# Java config
ENV DRUID_VERSION   0.9.2
ENV JAVA_HOME       /opt/jre1.8.0_40
ENV PATH            $PATH:/opt/jre1.8.0_40/bin

# Druid env variable
ENV DRUID_XMX           '-'
ENV DRUID_XMS           '-'
ENV DRUID_NEWSIZE       '-'
ENV DRUID_MAXNEWSIZE    '-'
ENV DRUID_HOSTNAME      '-'
ENV DRUID_LOGLEVEL      '-'

RUN opkg-install wget tar bash \
    && mkdir /tmp/druid

RUN wget -q --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" -O - \
    http://download.oracle.com/otn-pub/java/jdk/8u40-b26/jre-8u40-linux-x64.tar.gz | tar -xzf - -C /opt 

RUN wget -q --no-check-certificate --no-cookies -O - \
    http://www-eu.apache.org/dist/hadoop/common/hadoop-2.6.5/hadoop-2.6.5.tar.gz | tar -xzf - -C /opt \
    && ln -s /opt/hadoop-2.6.5 /opt/hadoop

#RUN wget -q --no-check-certificate --no-cookies -O - \ 
#    http://static.druid.io/artifacts/releases/druid-$DRUID_VERSION-bin.tar.gz | tar -xzf - -C /opt \
#    && ln -s /opt/druid-$DRUID_VERSION /opt/druid

#RUN rm /opt/druid/lib/druid-*.jar
RUN mkdir /opt/druid

COPY private/druid-custom.tgz /opt/druid/druid.tgz
RUN cd /opt/druid && tar -xzvf druid.tgz

COPY conf /opt/druid/conf 
COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN mkdir -p /tmp/druid
RUN mkdir -p /tmp/druid-logs

ENTRYPOINT ["/docker-entrypoint.sh"]
