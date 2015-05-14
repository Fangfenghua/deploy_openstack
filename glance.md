---
- name: Bringing up glance service(s)
  docker_compose:
    project_name: glance
    compose_file: "{{ koalla_directory }}/compose/glance-api-registry.yml"
    command: up
    no_recreate: true
~                      
