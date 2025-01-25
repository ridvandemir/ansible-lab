# ansible-lab

Objective

The Ansible Lab project aimed to automate the deployment and configuration of Splunk Enterprise components using Ansible. This lab focused on streamlining the setup of Splunk Search Head, Indexer, Deployment Server and Universal Forwarders across multiple servers. By leveraging Ansible’s capabilities, the project emphasized efficient configuration management and repeatable infrastructure provisioning of Splunk environments.

Skills Learned

- Expertise in using Ansible to automate the deployment and configuration of Splunk Enterprise components.
- Proficiency in writing Ansible playbooks for automating tasks such as software installation, service configuration, and system optimization.
- Knowledge of integrating Ansible with Splunk to manage distributed architectures efficiently.
- Hands-on experience in managing configurations across Linux systems with Ansible.
- Enhanced troubleshooting skills for resolving deployment issues and optimizing automation workflows.

Tools Used

- Ansible for automation of deployment and configuration tasks.
- Splunk Enterprise and Splunk Universal Forwarder.
- Virtual Machines to simulate the lab environment and test automation workflows.
- VS Code terminal emulator for managing server connections during lab activities.

Network Diagram

![ansible-lab drawio](https://github.com/user-attachments/assets/fc29f2cb-ebb8-4115-a893-7094a3b488d4)

Steps

- I first installed linux virtual machines. Then I installed Ansible on one of the machine.
- Then I created ssh key on Ansible machine to connect to other machines.
  - ssh-keygen -t rsa -b 2048 -C "ansible@ansible.com" -f /home/rido/.ssh/ansible_rsa -N ""
    - ssh-keygen: The command-line tool used to generate, manage, and convert authentication keys for SSH.
    - t rsa: Specifies the type of key to generate. In this case, it generates an RSA key. RSA is one of the commonly used algorithms for SSH keys.
    - b 2048: Sets the length (in bits) of the key. Here, it's set to 2048 bits, which is secure for most purposes.
    - C "ansible@ansible.com": Adds a comment to the key. This is useful for identifying the key later, especially in environments with multiple keys. In this case, the comment is ansible@ansible.com.
    - f /home/ansible/.ssh/ansible_rsa: Specifies the file path and name where the key pair will be saved. The private key will be saved as /home/ansible/.ssh/ansible_rsa, and the public key will be saved as /home/ansible/.ssh/ansible_rsa.pub.
    # -N "": Sets the passphrase for the private key. In this case, an empty string ("") means the key is not encrypted with a passphrase.
- I changed the permission of the files
  - sudo chmod 600 /home/rido/.ssh/ansible_rsa
  - sudo chmod 644 /home/rido/.ssh/ansible_rsa.pub
- Then I put the ansible_rsa.pub key in /home/rido/.ssh/authorized_keys file on target machines. We can also use 'ssh-copy-id -i /home/rido/.ssh/ansible_rsa.pub <target-machine-id>'
- I stated the target machines under 'hosts'.
