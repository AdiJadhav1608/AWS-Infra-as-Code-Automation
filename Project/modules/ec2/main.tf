resource "aws_instance" "main" {
  ami           = "ami-0f5ee92e2d63afc18" # Amazon Linux 2 (Mumbai)
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids

  tags = {
    Name = "aditya-terraform-ec2"
  }
}
