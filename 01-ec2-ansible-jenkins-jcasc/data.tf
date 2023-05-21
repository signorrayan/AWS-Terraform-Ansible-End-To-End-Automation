data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name = "name"
    # https://cloud-images.ubuntu.com/locator/ec2/
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}