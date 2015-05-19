
#!/bin/bash

UNIXSOCK=/var/run/openvswitch
if test ! -e "$UNIXSOCK";then
    mkdir $UNIXSOCK
fi

ovs-vswitchd unix:/var/run/openvswitch/db.sock -vconsole:emer -vsyslog:err -vfile:info --mlockall --no-chdir --log-file=/var/log/openvswitch/ovs-vswitchd.log --pidfile=/var/run/openvswitch/ovs-vswitchd.pid
