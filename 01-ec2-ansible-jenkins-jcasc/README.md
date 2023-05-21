# Terraform and Ansible End-To-End Automation
As a result of the current repository configuration, the Jenkins infrastructure will be created using Terraform, Anisble, JCasC and Job-DSL with the codes and without touching the UI on an AWS EC22 instance.

### How to start?
```
terraform init
terraform validate
terraform plan
terrafom apply
```

- The Ansible playbook in`playbooks/playbook.yml`:
  - Will install the jenkins
  - Install jenkins-plugin-manager
  - Install plugins listed in `playbook/files/plugins.yml`
  - (You can also uncomment the agent play in the playbook to configure an Jenkins agent)
- Jenkins Configuration As Code (JCasC) (`playbook/files/jenkins.yml`)
  - Will configure the base jenkins infrastructure and create a sample job dsl (The default username/password of the jenkins will be `admin:admin`)
  - You can also look at the `playbook/files/init.groovy.d/` directory and `playbook/files/override.conf`)
- Do not forget to look at the `./ansible.cfg` file
