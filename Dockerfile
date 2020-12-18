FROM ubuntu:16.04
MAINTAINER crazyj7@gmail.com

RUN apt-get update -y
RUN apt-get upgrade -y

#RUN apt-get install -y build-essential binutils libtool make gcc g++ openjdk-8-jdk git dos2unix vim wget 

RUN apt-get install -y build-essential wget vim dos2unix
RUN apt-get install -y zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget software-properties-common
RUN apt-get install -y ocl-icd-opencl-dev

RUN add-apt-repository -y ppa:deadsnakes/ppa
RUN apt-get update -y
RUN apt-get install -y python3.7
RUN apt-get install -y python3.7-venv
RUN apt-get update -y
RUN apt-get install -y wget curl unzip

# env
WORKDIR /root
ENV HOME /root

SHELL ["/bin/bash", "-c"]
ENV PATH "/usr/local/bin:/root/py37/bin:$PATH"


### selenium

ENV CHROME_DRIVER_VERSION 87.0.4280.88
ENV SELENIUM_STANDALONE_VERSION 3.9.1
ENV SELENIUM_SUBDIR 3.9

# Install dependencies.
RUN apt-get install -y xvfb libxi6 libgconf-2-4 apt-transport-https ca-certificates
RUN curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
	echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list && \
	chattr -i /etc/apt/sources.list.d/google-chrome.list && \
	apt-get update -y 
RUN apt-get install -y google-chrome-stable

# Install ChromeDriver.
RUN wget -N https://chromedriver.storage.googleapis.com/${CHROME_DRIVER_VERSION}/chromedriver_linux64.zip -P ~/ && \
	unzip ~/chromedriver_linux64.zip -d ~/ && \
	rm -f ~/chromedriver_linux64.zip && \
	mv -f ~/chromedriver /usr/local/bin/chromedriver && \
	chown root:root /usr/local/bin/chromedriver && \
	chmod 0755 /usr/local/bin/chromedriver

# Install Selenium.
RUN wget -N https://selenium-release.storage.googleapis.com/${SELENIUM_SUBDIR}/selenium-server-standalone-${SELENIUM_STANDALONE_VERSION}.jar -P ~/ && \
	mv -f ~/selenium-server-standalone-$SELENIUM_STANDALONE_VERSION.jar /usr/local/bin/selenium-server-standalone.jar && \
	chown root:root /usr/local/bin/selenium-server-standalone.jar && \
	chmod 0755 /usr/local/bin/selenium-server-standalone.jar


### selenium end

### etc.. locale
RUN apt-get install -y language-pack-ko && update-locale LANG=ko_KR.UTF-8
RUN apt-get install -y ttf-unfonts-core tzdata 
RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

## rsyslog for cron debug log
RUN apt-get install -y rsyslog
RUN echo "cron.* /var/log/cron.log" >> /etc/rsyslog.conf

### shell script
RUN echo "export LANG=ko_KR.UTF-8" >> .bashrc
RUN echo "source /root/py37/bin/activate" >> .bashrc

COPY ./requirements.txt /root/requirements.txt
COPY ./initvenv.sh /root/initvenv.sh
ENTRYPOINT ["/bin/bash", "-c", "/root/initvenv.sh \"$@\"", "--"]

VOLUME /root/py37
CMD ["/bin/bash"]

