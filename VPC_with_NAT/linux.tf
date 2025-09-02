resource "aws_instance" "linux_instance" {
  subnet_id              = aws_subnet.private_subnet.id
  ami                    = var.linux_ami   # <-- define this in variables.tf
  instance_type          = var.instance_type_t3_micro

  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = 30
    volume_type = "gp3"
    delete_on_termination = true
  }

  vpc_security_group_ids = [aws_security_group.Linux_SG.id]
  key_name = aws_key_pair.Divya_key.id  # keep same key pair for SSH

  tags = {
    Name = random_pet.divya_pet.id
  }
}
