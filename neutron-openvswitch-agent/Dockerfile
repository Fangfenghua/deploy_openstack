FROM %%KOLLA_NAMESPACE%%/%%KOLLA_PREFIX%%neutron-base:%%KOLLA_TAG%%
MAINTAINER Kolla Project (https://launchpad.net/kolla)

# Install required packages
RUN export http_proxy=http://3.6.1.35:808 \
    && export https_proxy=http://3.6.1.35:808 \
    && yum install -y openstack-neutron-openvswitch \
      openvswitch \
    && yum clean all

#Miss this file the agent will claim a error
COPY policy.json /etc/neutron/policy.json
# Add check script
COPY ./check.sh /check.sh

# Add start script
COPY  ./start.sh /start.sh

CMD ["/start.sh"]
