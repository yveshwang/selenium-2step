# Yves Hwang
# 06.06.2014

FROM ubuntu:precise
MAINTAINER Yves Hwang
RUN mkdir /usr/local/selenium
RUN apt-get update
RUN apt-get install wget -y
RUN apt-get install curl -y
RUN apt-get install git -y
RUN apt-get install unzip -y
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
RUN wget http://selenium-release.storage.googleapis.com/2.42/selenium-server-standalone-2.42.1.jar
RUN wget http://chromedriver.storage.googleapis.com/2.10/chromedriver_linux64.zip
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN mv *.zip /usr/local/selenium/.
RUN mv *.deb /usr/local/selenium/.
RUN mv *.jar /usr/local/selenium/.
RUN dpkg -i /usr/local/selenium/google-chrome* 
RUN apt-get -f install -y
RUN unzip /usr/local/selenium/*.zip -d /usr/local/selenium
RUN cp /workdir/selenium-2step/selenium-grid /etc/init.d/.
RUN update-rc.d selenium-grid defaults
RUN service selenium-grid start
RUN cp /workdir/selenium-2step/selenium-node /etc/init.d/.
RUN update-rc.d selenium-node defaults
RUN service selenium-node start
EXPOSE 4444
CMD ["/bin/bash"]
