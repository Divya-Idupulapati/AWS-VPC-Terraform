locals {
  rdp_content = <<-RDP
    auto connect:i:1
    full address:s:${aws_eip.Windows_eip.public_ip}
    username:s:Administrator
    audiomode:i:2
    audiocapturemode:i:1
  RDP
}

resource "local_file" "divya_rdp_file" {
  content    = local.rdp_content
  filename   = "divya_web_${formatdate("YYYYMMDDhhmmss", timestamp())}.rdp"
  depends_on = [aws_eip_association.windows_eip_assoc]
}

resource "null_resource" "rdp_execute" {
  triggers = {
    rdp_file = local_file.divya_rdp_file.filename
  }

  provisioner "local-exec" {
    command     = "open ${local_file.divya_rdp_file.filename}"
    working_dir = path.module
  }
}
