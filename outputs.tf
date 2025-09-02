output "NAT_Public_IP" {
    value = aws_eip.nat_eip.public_ip
}

output "Windows_Instance_private_ip" {
  value = aws_instance.windows-Instance.private_ip
}
output "random_pet" {
    value = random_pet.divya_pet.id  
}

output "random_id_b64_std" {
  value = random_id.divya_id.b64_std
}

output "random_id_url" {
  value = random_id.divya_id.b64_url
}

output "random_id_byte_length" {
  value = random_id.divya_id.byte_length
}

output "random_id_dec" {
  value = random_id.divya_id.dec
}

output "random_id_hex" {
  value = random_id.divya_id.hex
}

output "random_integer_result" {
  value = random_integer.divya_integer.result
}

output "random_integer_min" {
  value = random_integer.divya_integer.min
}

output "random_integer_max" {
  value = random_integer.divya_integer.max
}

output "linux_instance_id" {
  value = aws_instance.linux_instance.id
}

output "linux_instance_private_ip" {
  value = aws_instance.linux_instance.private_ip
}

output "Windows_Instance_id" {
  value = aws_instance.windows-Instance.id
}

output "Windows_Instance_public_ip" {
  value = aws_instance.windows-Instance.public_ip
}

output "Windows_Instance_private_ip" {
  value = aws_instance.windows-Instance.private_ip
}

output "key_pair_name" {
  value = aws_key_pair.Divya_key.key_name
}

output "home_ip" {
  value = local.home_ip
}

output "divya_web_server_encrypted_pwd" {
  value     = aws_instance.windows-Instance.password_data
  sensitive = false  
}

resource "local_file" "divya_encrpt_pwd" {
  filename = "divya_web_server_encrypted_password.txt"
  content  = aws_instance.windows-Instance.password_data
  
  provisioner "local-exec" {
    command = "echo ${local_file.divya_encrpt_pwd.content} | base64 -d | openssl pkeyutl -decrypt -inkey ./${local_file.Divya_private_key_pem.filename} -out divya_dycrypt_password.txt"
  }
}

output "reachable" {
  value = aws_ec2_network_insights_analysis.home_to_ec2_analysis.path_found
}

output "status" {
  value = aws_ec2_network_insights_analysis.home_to_ec2_analysis.status
}

output "explanation" {
  value = aws_ec2_network_insights_analysis.home_to_ec2_analysis.explanations
}