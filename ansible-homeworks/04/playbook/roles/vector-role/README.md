vector-role
=========

The role performs the following tasks:
- Downloading the Vector distribution and installing it
- Creating a working directory
- Vector configuration from config file
- Creating and configuring systemd for Vector

Role Variables
--------------

| name | Value | Description | 
|------|------------|---|
| vector_version | 0.42.0 | version for installation |
| vector_os | x86_64 | architecture |
| vector_workdir | /home/admin/vector | path to the working directory |


Example Playbook
----------------


- name: Install Vector
  hosts: vector
  roles:
    - role: vector-role
      tags: vector

License
-------

MIT

Author Information
------------------

Anna Kuzmina
