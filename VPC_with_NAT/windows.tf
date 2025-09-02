resource "aws_instance" "windows-Instance" {
    subnet_id = aws_subnet.public_subnet.id
    ami = var.windows_ami
    instance_type = var.instance_type_t3_micro
    ebs_block_device {
        device_name = "/dev/sda1"
        volume_size = 30
        volume_type = "gp3"
        delete_on_termination = true
    }
    vpc_security_group_ids = [aws_security_group.Windows_SG.id]
    key_name = aws_key_pair.Divya_key.id
    
    get_password_data = true

    tags = {
        Name = random_pet.divya_pet.id
    }
}

resource "aws_eip_association" "windows_eip_assoc" {
    instance_id = aws_instance.windows-Instance.id
    allocation_id = aws_eip.Windows_eip.id
}