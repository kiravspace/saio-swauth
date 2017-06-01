FROM kiravspace/saio-swauth:apt-install
MAINTAINER kiravspace <kiravspace@gmail.com>

RUN mkdir -p /data/sdb1/1 /data/sdb1/2 /data/sdb1/3 /data/sdb1/4
RUN mkdir -p /srv
RUN ln -s /data/sdb1/1 /srv/1
RUN ln -s /data/sdb1/2 /srv/2
RUN ln -s /data/sdb1/3 /srv/3
RUN ln -s /data/sdb1/4 /srv/4

RUN mkdir -p /srv/1/node/sdb1 /srv/1/node/sdb5 \
             /srv/2/node/sdb2 /srv/2/node/sdb6 \
             /srv/3/node/sdb3 /srv/3/node/sdb7 \
             /srv/4/node/sdb4 /srv/4/node/sdb8 \
             /var/run/swift

RUN sed '/exit 0/i\mkdir -p /var/cache/swift /var/cache/swift2 /var/cache/swift3 /var/cache/swift4' -i /etc/rc.local
RUN sed '/exit 0/i\chown root /var/cache/swift*' -i /etc/rc.local
RUN sed '/exit 0/i\mkdir -p /var/run/swift' -i /etc/rc.local
RUN sed '/exit 0/i\chown root /var/run/swift\n' -i /etc/rc.local

