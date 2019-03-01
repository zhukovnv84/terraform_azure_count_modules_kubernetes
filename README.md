# Terraform Azure count with modules 

This repository defines 4 virtual machine in Azure Cloud


ansible.spark 10.0.2.111

master.spark  10.0.2.5


slave1.spark  10.0.2.6
slave2.spark  10.0.2.7


- With 4 Public Static IP 

- Connection only by ssh keys!!!



# Requirements

```

-  After creating virtual machines and added inside all ssh keys

Keys have to be  prepared before, you can did it 

from simple user (for example spark)
ssh-keygen -f ~/.ssh/id_rsa -P ""

form root user 
ssh-keygen -f ~/.ssh/id_rsa -P ""

```


also you have to create this files 


```


   ├── root_keys
   │   ├── authorized_keys
   │   ├── id_rsa
   │   ├── id_rsa.pub
   │   └── known_hosts



and this files


   └── spark_keys
       ├── hosts
       ├── id_rsa
       ├── id_rsa.pub
       └── known_hosts


```


* Download script to local machine


```

git@github.com:zhukovnv84/terraform_azure_count_modules_kubernetes.git

```



 it is run ansible script from 

```

git@github.com:zhukovnv84/ansible_kubernetes_1.13_centos7.git


```



and configure kubernetes cluster




* Install Terraform (Ubuntu)


```

install
---
wget https://releases.hashicorp.com/terraform/0.11.11/terraform_0.11.11_linux_amd64.zip
sudo apt-get install unzip

unzip terraform_0.11.11_linux_amd64.zip

sudo mv terraform /usr/local/bin/

terraform --version


```



* Add Azure credentials

```


add to terraform.tfvars

subscription_id = ""
tenant_id = ""
client_id = ""
client_secret = ""

```


* Configure variables for Azure Virtual Machines

Full variables are here - full_variable_for_examle.tf - it is example


But you  have to change it in

```

modules
       - module_name
                      - variables.tf


- Add public key to 

  description = " ssh public key"
default = "ssh-rsa  spark@yourmachine"
}


- Public and private   keys have to be saved in /home/username/.ssh/




- Change   

  source_address_prefix      = "xx.xx.xxx.0/24"

in modules/security_group/main. It is your subnet CIDR, or use your external ip. Or disable it if ypu need not it.



```




All structure have to be same


```


.
├── files
│   ├── kubernetes
│   │   ├── admin.yml
│   │   ├── kube-flannel.yml
│   │   └── kubernetes-dashboard.yaml
│   ├── prepare.sh
│   ├── root_keys
│   │   ├── authorized_keys
│   │   ├── id_rsa
│   │   ├── id_rsa.pub
│   │   └── known_hosts
│   └── spark_keys
│       ├── hosts
│       ├── id_rsa
│       ├── id_rsa.pub
│       └── known_hosts
├── full_variable_for_examle.tf
├── main.tf
├── modules
│   ├── managed_disk
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── resource_group
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── security_group
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── virtual_machine
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── virtual_network
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
├── provider.tf
├── READMI.md
└── terraform.tfvars

```




