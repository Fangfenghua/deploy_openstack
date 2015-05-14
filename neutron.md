---
- name: Bringing up neutron server service(s)
  docker_compose:
    project_name: neutron
    compose_file: "{{ koalla_directory }}/compose/neutron-server.yml"
    command: up
    no_recreate: true
  when: inventory_hostname in groups['controller']

- name: Bringing up neutron agent service(s)
  docker_compose:
    project_name: neutron
    compose_file: "{{ koalla_directory }}/compose/neutron-agents.yml"
    command: up
    no_recreate: true
  when: inventory_hostname in groups['compute']
