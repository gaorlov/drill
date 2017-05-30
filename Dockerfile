FROM java:8
MAINTAINER Greg Orlov <http://github.com/gaorlov>

RUN mkdir -p /opt/drill/

# Download the needed packages

ENV DRILL_VERSION 1.10.0

RUN wget http://mirror.bit.edu.cn/apache/drill/drill-$DRILL_VERSION/apache-drill-$DRILL_VERSION.tar.gz

ENV JETS3T_VERSION 0.9.3

RUN wget http://bitbucket.org/jmurty/jets3t/downloads/jets3t-$JETS3T_VERSION.zip

ENV DRILL_ROOT /opt/drill/apache-drill-$DRILL_VERSION

# extract all the things

RUN tar zxvf apache-drill-$DRILL_VERSION.tar.gz -C /opt/drill

RUN unzip jets3t-$JETS3T_VERSION.zip
RUN mv jets3t-$JETS3T_VERSION/jars/jets3t-$JETS3T_VERSION.jar $DRILL_ROOT/jars/3rdparty

# set up for bootstrap

RUN mkdir /drill-scripts
ADD . /drill-scripts/

ENV CLUSTER_ID ""
ENV ZOOKEEPERS ""
ENV ENABLE_EXCLUDES ""
ENV AWS_SECRET_KEY ""
ENV AWS_ACCESS_KEY ""

WORKDIR /drill-scripts/

ENTRYPOINT ["/bin/sh", "/drill-scripts/bootstrap.sh"]