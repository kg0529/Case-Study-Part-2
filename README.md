# Case-Study-Part-2 #
-------------------------------
## Design ##
  1. Create a VM as a client machine using vagrant.  
  2. Set up ssh connection between client machine and workstation machine. 
  3. Using Ansible to install all necessary softwares for setting up kubernetes environment. 
  4. Using Ansible on workstation machine to create the kubernetes cluster on client machine. 
  5. Using Ansible to deploy flask application on that cluster on client machine. 
  6. Monitoring the kubernetes cluster with grafana.(Original design was to monitor kubernetes cluster with ELK stack, but couldn't get metricbeat to pick up kubernetes data, that idea was abandoned). 
  7. Monitoring together with htop for CPU and memory usage.
  8. Stress test with stress utility in Ubuntu.
  
## Design Graph ##
![](https://github.com/kg0529/Case-Study-Part-2/blob/main/screenshots/s14.png?raw=true)

## Tools used ##
   Git, Grafana, kind, Ansible, VM Vituralbox, htop, stress, Docker, ssh, kubectl, Helm.
