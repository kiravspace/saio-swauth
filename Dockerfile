FROM kiravspace/saio-swauth:partition
MAINTAINER kiravspace <kiravspace@gmail.com>

RUN pip install markupsafe

RUN git clone https://github.com/openstack/python-swiftclient.git -b 2.5.0 /root/python-swiftclient

WORKDIR /root/python-swiftclient
RUN python setup.py develop

RUN git clone https://github.com/openstack/swift.git -b 2.5.0 /root/swift

WORKDIR /root/swift
RUN pip install -r requirements.txt
RUN python setup.py develop

RUN pip install -r test-requirements.txt

