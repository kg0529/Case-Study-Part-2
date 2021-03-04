# Case-Study-Part-2 #
-------------------------------
## Design ##
  1. Create a VM as a client machine using vagrant.  
  2. Set up ssh connection between client machine and workstation machine. 
  3. Using Ansible to install all necessary dependencies for setting up kubernetes environment. 
  4. Using Ansible on workstation machine to create the kubernetes cluster on client machine. 
  5. Using Ansible to deploy flask application on that cluster on client machine. 
  6. Monitoring the kubernetes cluster with grafana.(Original design was to monitor kubernetes cluster with ELK stack, but couldn't get metricbeat to pick up kubernetes data, that idea was abandoned). 
  7. Monitoring together with htop for CPU and memory usage.
  8. Stress test with stress utility in Ubuntu.
  
## Design Graph ##
![](https://github.com/kg0529/Case-Study-Part-2/blob/main/screenshots/s14.png?raw=true)


## Tools used ##
   Git, Grafana, kind, Ansible, VM Vituralbox, htop, stress, Docker, ssh, kubectl, Helm. prometheus, Grafana
## Steps ##
1. Creating VM using vagrant as client machine,.Then setting up SSH connection between client and workstation machine. This SSH connection is for Ansible.

   ![](https://github.com/kg0529/Case-Study-Part-2/blob/main/screenshots/s1.png?raw=true)
   ![](https://github.com/kg0529/Case-Study-Part-2/blob/main/screenshots/s2.png?raw=true)
   ![](https://github.com/kg0529/Case-Study-Part-2/blob/main/screenshots/s2-1.png?raw=true)



2. On the workstation machine, using Ansible to apply setup.yml to install all necessary dependencies on the client machine like Docker, kubectl, kind and etc.

   ![](https://github.com/kg0529/Case-Study-Part-2/blob/main/screenshots/s3.png?raw=true)



3. On the workstation machine, using Ansible to apply start-cluster.yml to start up a kubernetes cluster on the client machine.

   ![](https://github.com/kg0529/Case-Study-Part-2/blob/main/screenshots/s4.png?raw=true)  
   ![](https://github.com/kg0529/Case-Study-Part-2/blob/main/screenshots/s4-1.png?raw=true)



4. On the workstation machine, create a CICD pipeline in jenkins which will deploy the flask app on the client machine through Ansible. This pipeline will check the github repo every 15 mins, trigger a new build if any changes are made.
 
   ![](https://github.com/kg0529/Case-Study-Part-2/blob/main/screenshots/s6.png?raw=true)
   ![](https://github.com/kg0529/Case-Study-Part-2/blob/main/screenshots/s7.png?raw=true)
   ![](https://github.com/kg0529/Case-Study-Part-2/blob/main/screenshots/s8.png?raw=true)



5. Starting up the prometheus on the cluster, then monitoring the cluster and flask app in Grafana. Having the dashboard up for monitoring cpu and memory usage.
   ![](https://github.com/kg0529/Case-Study-Part-2/blob/main/screenshots/s9.png?raw=true)
   ![](https://github.com/kg0529/Case-Study-Part-2/blob/main/screenshots/s10.png?raw=true)



6. Having the htop up to monitor the cpu and memory usage in the client machine.
   ![](https://github.com/kg0529/Case-Study-Part-2/blob/main/screenshots/s12.png?raw=true)



7. Using stress utility to stress the machine, along side with Grafana and htop, showing the cpu usage during the stress.
   ![](https://github.com/kg0529/Case-Study-Part-2/blob/main/screenshots/s13.png?raw=true)
     
8. Trying to write a shell script that monitoring cpu usage and print out usage every 2s, print out warning if usage goes above 60. However, when I am doing stress, the VM freeze, include the script, so it won't print out anything during the stress.
   ![](https://github.com/kg0529/Case-Study-Part-2/blob/main/screenshots/s18.png?raw=true)
   ![](https://github.com/kg0529/Case-Study-Part-2/blob/main/screenshots/s19.png?raw=true)
    

## Problems encountered ##
1. Original I want to use ELK stack to monitoring the kubernetes cluster. The Kiabana does support for monitoring Kubernetes, however the metricbeat couldn't pick up the kubernetes data, I spent whole day tring to fix this problem, but still can't get it to work. Then switch to prometheus and use Grafana to monitor the kubernetes cluster instead.
