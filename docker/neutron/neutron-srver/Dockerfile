FROM %%KOLLA_NAMESPACE%%/%%KOLLA_PREFIX%%neutron-base:%%KOLLA_TAG%%
MAINTAINER Kolla Project (https://launchpad.net/kolla)

#Install required packages
RUN  export http_proxy=http://3.6.1.35:808 \
   && export https_proxy=http://3.6.1.35:808 \
   && yum install -y openstack-neutron \
        python-neutronclient \
        which \
        && yum clean all

ADD ./start.sh /start.sh
ADD ./check.sh /check.sh

CMD ["/start.sh"]
