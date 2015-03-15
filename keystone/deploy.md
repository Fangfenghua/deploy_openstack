1 install keystone service   
yum install python-keystone.noarch openstack-keystone.noarch     
docker  run -i -t  -e MARIADB_SERVICE_HOST=192.168.1.26 \
                   -e DB_ROOT_PASSWORD=openstack \
                   -e KEYSTONE_ADMIN_TOKEN=769fa787e1cb9ee2cc2d   \
                   -e KEYSTONE_DB_PASSWORD=openstack \
                   -e KEYSTONE_PUBLIC_SERVICE_HOST=192.168.1.26 \
                   -e KEYSTONE_ADMIN_SERVICE_HOST=192.168.1.26 \ 
                   --net=host  kollaglue/centos-rdo-keystone:latest
