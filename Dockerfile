FROM kiravspace/saio-swauth:swift-start
MAINTAINER kiravspace <kiravspace@gmail.com>

ADD scripts/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD /root/bin/remakerings && service supervisor start && /bin/bash

EXPOSE 8080

