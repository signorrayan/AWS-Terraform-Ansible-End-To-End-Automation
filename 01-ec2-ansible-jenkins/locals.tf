locals {
  ami_id = try(coalesce(var.ami, data.aws_ami.ubuntu.id), null)
}
