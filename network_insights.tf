resource "aws_ec2_network_insights_path" "home_to_ec2" {
  source           = aws_internet_gateway.igw.id
  destination      = aws_instance.windows-Instance.id

  protocol         = "tcp"
  destination_port = 80            # HTTP only
  source_ip        = local.home_ip # optional, narrows to your home IP

  tags = {
    Name = "home_to_ec2-${random_pet.divya_pet.id}"
  }
}

resource "aws_ec2_network_insights_analysis" "home_to_ec2_analysis" {
  network_insights_path_id = aws_ec2_network_insights_path.home_to_ec2.id
  wait_for_completion      = true
  depends_on = [
    aws_internet_gateway.igw,
    aws_instance.windows-Instance
  ]
}