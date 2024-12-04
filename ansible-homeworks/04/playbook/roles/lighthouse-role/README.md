lighthouse-role
=========

The role performs the following tasks:
- Checking for Git and unzip packages
- Downloading the LightHouse distribution and unpacking it
- Installing and launching Nginx
- Nginx configuration from the config file

Requirements
------------

You neeed to install and configure `git` and `NGINX` before run this role.


Role Variables
--------------

| name | Value | Description | 
|------|------------|---|
| lighthouse_version | 12.2.2 | version for installation |


Example Playbook
----------------

```
- name: Install lighthouse
  hosts: localhost
  pre_tasks:
    - name: Lighthouse | Install git
      become: true
      ansible.builtin.apt:
        name: git
        state: present
  roles:
    - lighthouse-role
      tags: lighthouse
```

License
-------

MIT

Author Information
------------------

Anna Kuzmina
