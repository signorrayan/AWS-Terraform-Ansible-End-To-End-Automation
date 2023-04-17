variable "region" {
  description = "The instance region"
  type        = string
  default     = "eu-west-1"
}

variable "instance_type" {
  description = "The type of configurations of computing resources"
  type        = string
  default     = "t2.micro"
}

variable "ami" {
  description = "ID of AMI to use for the instance"
  type        = string
  default     = null
}

variable "key_name" {
  description = "The key pair name for the instance (eg: Private key name to connect trought ssh.)"
  type        = string
  default     = null
}

variable "create" {
  description = "Whether to create an instance or not"
  type        = bool
  default     = true
}

variable "create_sg" {
  description = "Whether to create a security group or not"
  type        = bool
  default     = false
}

variable "name" {
  description = "Name to be used on EC2 instance created"
  type        = string
  default     = ""
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
  default     = null
}

variable "iam_role_name" {
  description = "Name to use on IAM role created"
  type        = string
  default     = null
}

variable "iam_role_use_name_prefix" {
  description = "Determines whether the IAM role name (`iam_role_name` or `name`) is used as a prefix"
  type        = bool
  default     = true
}

variable "sg_name_prefix" {
  description = "The name prefix for security group"
  type        = string
  default     = "Jenkins-"
}

variable "iam_role_policies" {
  description = "Policies attached to the IAM role"
  type        = map(string)
  default     = {}
}

variable "create_iam_instance_profile" {
  description = "Determines whether an IAM instance profile is created or to use an existing IAM instance profile"
  type        = bool
  default     = false
}

variable "iam_instance_profile" {
  description = "IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile"
  type        = string
  default     = null
}


variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
  type        = string
  default     = null
}

variable "environment" {
  description = "The EC2 Instance use case (eg: dev, staging, test, prod, etc."
  default     = "test"
}

variable "instance_keypair" {
  description = "AWS EC2 Key pair that need to be associated with EC2 Instance"
  type        = string
  default     = "awsec2server"
}

variable "private_key_path" {
  description = "The path of private key to use in null_resource"
  default     = "awsec2server"
}