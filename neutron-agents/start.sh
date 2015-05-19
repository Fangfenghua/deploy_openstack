
#!/bin/bash
cfg=/etc/supervisord.conf

if [[ "${MECHANISM_DRIVERS}" =~ linuxbridge ]] ; then
  crudini --set $cfg \
          program:neutron-linuxbridge-agent \
          autostart \
          true
elif [[ "${MECHANISM_DRIVERS}" =~ .*openvswitch* ]] ; then
   crudini --set $cfg \
          program:neutron-linuxbridge-agent \
          autostart \
          false
fi

#start supervisord
/usr/bin/supervisord
