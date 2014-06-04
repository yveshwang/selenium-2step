# Yves Hwang
# 04.06.2014

FROM ubuntu:precise
MAINTAINER Yves Hwang 
RUN apt-get update
RUN apt-get install wget -y
RUN apt-get install curl -y
RUN apt-get install git -y
RUN apt-get install openjdk-7-jre -y 
RUN apt-get install openjdk-7-jdk -y
RUN apt-get install ant -y
RUN apt-get install firefox -y
RUN apt-get install xvfb -y
RUN mkdir /workdir
WORKDIR /workdir
RUN cd /workdir
RUN git clone https://github.com/yveshwang/selenium-2step.git selenium-2step/
RUN cp /workdir/selenium-2step/Xvfb /etc/init.d/.
RUN update-rc.d Xvfb defaults
RUN service Xvfb start
RUN mkdir /usr/local/selenium
RUN wget http://selenium-release.storage.googleapis.com/2.42/selenium-server-standalone-2.42.1.jar
RUN mv *.jar /usr/local/selenium/.
RUN cp /workdir/selenium-2step/selenium-grid /etc/init.d/.
RUN update-rc.d selenium-grid defaults
RUN service selenium-grid start
RUN cp /workdir/selenium-2step/selenium-node /etc/init.d/.
RUN update-rc.d selenium-node defaults
RUN service selenium-node start
EXPOSE 4444
CMD ["/bin/bash"]
