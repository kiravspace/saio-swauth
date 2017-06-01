FROM ubuntu:14.04
MAINTAINER kiravspace <kiravspace@gmail.com>

RUN echo "------------Install dependencies------------"
RUN apt-get update
RUN apt-get install -y git vim \
                       curl gcc memcached rsync sqlite3 xfsprogs \
                       git-core libffi-dev python-setuptools
RUN apt-get install -y python-coverage python-dev python-nose \
                       python-simplejson python-xattr python-eventlet \
                       python-greenlet python-pastedeploy \
                       python-netifaces python-pip python-dnspython \
                       python-mock

