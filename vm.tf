resource "aws_key_pair" "key" {
  key_name   = var.ec2_key_name
  public_key = var.aws_key_pub
  tags = {
    Name = "key-${local.suffix_name}"
  }
}


resource "aws_instance" "vm" {
  ami                         = local.ec2_ami
  instance_type               = var.ec2_type
  key_name                    = aws_key_pair.key.key_name
  subnet_id                   = data.terraform_remote_state.vpc.outputs.public_subnet_03_id
  vpc_security_group_ids      = [data.terraform_remote_state.vpc.outputs.sg_id]
  associate_public_ip_address = true
  tags = {
    Name = "vm-${local.suffix_name}"
  }
}
