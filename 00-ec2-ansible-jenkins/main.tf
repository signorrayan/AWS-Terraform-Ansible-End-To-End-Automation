# AWS EC2 Instance Terraform Module
# Jenkins Host - EC2 Instance that will be created in VPC Public Subnet
module "ec2_jenkins" {
  source = "git::https://github.com/signorrayan/aws-ec2-terraform-module.git?ref=v1.3.6"

  # insert the 10 required variables here
  name                   = "${var.environment}-JenkinsHost"
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.jenkins.id]
  # user_data              = file("${path.module}/install-ansible.sh")

}


resource "aws_key_pair" "key_pair" {
  key_name   = var.instance_keypair
  public_key = file("./pubkey/awsec2server.pub")
}


resource "aws_security_group" "jenkins" {
  name_prefix = "jenkins"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "local_file" "vm_ip" {
  depends_on = [module.ec2_jenkins]
  content    = values(module.ec2_jenkins.public_ip)[0]
  filename   = "inventory"
}


resource "null_resource" "jenkins" {
  depends_on = [module.ec2_jenkins]

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(var.private_key_path)
    host        = values(module.ec2_jenkins.public_ip)[0]
  }

  provisioner "local-exec" {
    command = "sudo ansible-playbook jenkins.yml"
  }
}
