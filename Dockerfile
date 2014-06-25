FROM ubuntu:14.04
MAINTAINER "Christoph Trautwein <christoph.trautwein@sinnerschrader.com>"

ENV DEBIAN_FRONTEND noninteractive 
ENV DEBCONF_NONINTERACTIVE_SEEN true
RUN apt-get -qq update

ADD etc/timezone /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

RUN apt-get -y install less
RUN apt-get -y install vim

# RUN apt-get -y install software-properties-common
# RUN add-apt-repository ppa:chris-lea/node.js
#    oder
RUN echo "deb http://ppa.launchpad.net/chris-lea/node.js/ubuntu trusty main" >>  /etc/apt/sources.list.d/chris-lea-node_js-precise.list
RUN echo "deb-src http://ppa.launchpad.net/chris-lea/node.js/ubuntu trusty main" >>  /etc/apt/sources.list.d/chris-lea-node_js-precise.list

RUN apt-get -y install wget
RUN wget -O - "http://keyserver.ubuntu.com:11371/pks/lookup?op=get&search=0xB9316A7BC7917B12" | apt-key add -

RUN apt-get -qq update
RUN apt-get -y install nodejs

CMD /bin/bash
