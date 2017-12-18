ansible-aws-shell 
===============================================================

In this configuration script we are Configure ec2 instance and deploy dark-web project. For that below things we done:
===============================================================
With Anible::
=============
1. Configure credential to communicate with AWS.
2. Create security group for instance.
3. Create secure login keypair for instance.
4. Launch Instance and configure it acording to dependencies.

With Shell::
=============
1. Install dependencies in ec2 instance.
2. Transfer project over ec2 and run there.

Description of files:
=====================
1. deploy.yml: This file is responsible to deploy instance using the details from variable file define in "vars" directory.
2. delete.yml: this file is responsible to delete the instance which is launched by using Our script.  
3. key.yml: This file is creating a keypair. If you want multiple keypair then update the "keyname" variable and run.
4. instance: this file contains IP address of instance launched by us using the script.
5. hosts: host info for ansible to where launch instance. 
6. vars: This file contains info about the aws account credentials and the variable files for deploy.yml.
7. config.sh: contain info about project dependencies which should be configure over instance for running project.
8. config1.sh: transfering project to local to remote and gather the remote IP address done through this file.
9. launch.sh: will launch the entire project.
10. remove.sh: will delete the instance launched over aws. 


In case want to update settings: 
=================================
1. For Login account settings: Edit vars/credentials.yml to update your own AWS credentials.
2. For Region/Firewall/OS settings: Edit vars/dependencies.yml file to find "ec2_region" to update aws region on which you want to launch your instance.
For update OS find "image_id" and replace it with the OS you want to use,ID needs to get from aws site.
For update security rules you have to make changes here itself under security_group parameters.
Note: Keypair name should be the same which is defined under key.yml.
3. For update project info and project dependencies: make change in config.sh and config1.sh
How to run:
=============
1. to deploy entire project:
Run: ./launch.sh
2. to only deploy instance
Run: ansible-playbook -i hosts deploy.yml
3. to delete launch instance
Run: ./remove.sh  
or  
Run: ansible-playbook -i hosts delete.yml

You can shut down the infrastructure by setting the exact_count values
in the vars/dev-environment.yml file to 0 and re-running aws.yml.
5. Run: ansible-playbook -i hosts delete.yml

this will delete the launched instance.
