
docker  run -d --net=host kollaglue/centos-rdo-rabbitmq     
docker  run -i -t -e DB_ROOT_PASSWORD=openstack -e GLANCE_KEYSTONE_PASSWORD=openstack  -e GLANCE_DB_PASSWORD=openstack -e KEYSTONE_ADMIN_TOKEN=769fa787e1cb9ee2cc2d -e KEYSTONE_ADMIN_SERVICE_HOST=192.168.1.26  kollaglue/centos-rdo-glance-api      
docker  run -t -i -e DB_ROOT_PASSWORD=openstack \   
              -e GLANCE_KEYSTONE_PASSWORD=openstack \   
              -e GLANCE_DB_PASSWORD=openstack \   
              -e KEYSTONE_ADMIN_TOKEN=769fa787e1cb9ee2cc2d \    
              -e KEYSTONE_ADMIN_SERVICE_HOST=192.168.1.26 \   
              -e KEYSTONE_ADMIN_PASSWORD=kolla \   
              -e GLANCE_REGISTRY_SERVICE_HOST=192.168.1.26\   
              -e  RABBITMQ_SERVICE_HOST=192.168.1.26 \
              --net=host   \
              -e KEYSTONE_PUBLIC_SERVICE_HOST=192.168.1.26  kollaglue/centos-rdo-glance-api     
docker  run -i -t -e GLANCE_DB_PASSWORD=openstack  -e GLANCE_KEYSTONE_PASSWORD=openstack  -e DB_ROOT_PASSRD=openstack -e MARIADB_SERVICE_HOST=192.168.1.26   --net=host  kollaglue/centos-rdo-glance-registry   
