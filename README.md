# Case-Study-Part-2 #
-------------------------------
## Design ##
  Original design is to have vagrant to create a VM as a client machine. Then set up ssh connection between client machine and workstation machine. Then using Ansible to install all necessary softwares for setting up kubernetes environment. After that, using Ansible on workstation machine to create the kubernetes cluster on client machine. Then using Ansible to deploy flask application on that cluster on client machine. Monitoring the kubernetes cluster with grafana.(Original design was to monitor kubernetes cluster with ELK stack, but couldn't get metricbeat to pick up kubernetes data, that idea was abandoned). Monitor together with htop for CPU and memory usage. Stress test with stress utility in Ubuntu.

