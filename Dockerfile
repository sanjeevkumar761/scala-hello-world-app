FROM openjdk:8

ENV SBT_VERSION 0.13.15

RUN \
  curl -L -o sbt-$SBT_VERSION.deb http://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb && \
  dpkg -i sbt-$SBT_VERSION.deb && \
  rm sbt-$SBT_VERSION.deb && \
  apt-get update && \
  apt-get install sbt && \
  sbt sbtVersion

CMD 

WORKDIR /HelloWorld

COPY . /HelloWorld

#EXPOSE 9000

CMD ["sbt", "assembly"] 

#CMD   cp target/scala-2.12/app-assembly.jar  ./
#CMD sbt dist /HelloWorld
#EXPOSE 9000
#RUN ["chmod", "+x", "./run_jar.sh"]
#ENTRYPOINT ["./run_jar.sh"]
#CMD ls .

#CMD set -x 

#CMD unzip -d svc target/universal/*-1.0-SNAPSHOT.zip 
# CMD rm svc/bin/*.bat
#CMD mv svc/bin/* svc/bin/start
#CMD ls   target

#EXPOSE 9000 9443
#CMD svc/bin/start/play-hello-world -Dhttps.port=9443 -Dplay.crypto.secret=secret
