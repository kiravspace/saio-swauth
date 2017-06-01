FROM kiravspace/saio-swauth:swift-install
MAINTAINER kiravspace <kiravspace@gmail.com>

RUN cp /root/swift/doc/saio/rsyncd.conf /etc/
RUN sed -i "s/<your-user-name>/root/" /etc/rsyncd.conf
RUN sed -i "s/RSYNC_ENABLE=false/RSYNC_ENABLE=true/" /etc/default/rsync

RUN cp /root/swift/doc/saio/rsyslog.d/10-swift.conf /etc/rsyslog.d/
RUN sed -i "s/\$PrivDropToGroup syslog/\$PrivDropToGroup adm/" /etc/rsyslog.conf
RUN mkdir -p /var/log/swift
RUN chown -R syslog.adm /var/log/swift
RUN chmod -R g+w /var/log/swift

RUN apt-get install -y supervisor
ADD scripts/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN rm -rf /etc/swift
RUN cp -r /root/swift/doc/saio/swift /etc/swift
RUN find /etc/swift/ -name \*.conf | xargs sudo sed -i "s/<your-user-name>/root/"
RUN sed -i "s/bind_ip = 127.0.0.1/\#bind_ip = 127.0.0.1/" /etc/swift/proxy-server.conf

RUN mkdir -p /root/bin
RUN cp /root/swift/doc/saio/bin/* /root/bin
RUN chmod +x /root/bin/*

RUN sed -i "s/\${USER}:\${USER}/root/" /root/bin/resetswift
RUN cp /root/swift/test/sample.conf /etc/swift/test.conf

RUN echo "export SWIFT_TEST_CONFIG_FILE=/etc/swift/test.conf" >> ~/.bashrc
RUN echo "export PATH=${PATH}:/root/bin" >> ~/.bashrc

CMD service supervisor start && /root/bin/remakerings && /root/bin/startmain && /bin/bash

EXPOSE 8080

