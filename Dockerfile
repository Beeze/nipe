# DOCKER-VERSION 0.3.4
#
FROM        perl:latest
MAINTAINER  Heitor Gouvêa <hi@heitorgouvea.me>

RUN curl -L http://cpanmin.us | perl - App::cpanminus
RUN cpanm Switch JSON LWP::UserAgent

WORKDIR /app
COPY . /app
VOLUME /app

RUN chmod +x nipe.pl
RUN perl nipe.pl install

CMD sleep 3
CMD perl nipe.pl start
CMD sleep 5
CMD perl nipe.pl status
