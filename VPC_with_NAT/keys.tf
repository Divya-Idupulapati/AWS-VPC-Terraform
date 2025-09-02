resource "tls_private_key" "divya_private_key" {
    algorithm = "RSA"
    rsa_bits = 2048
}

resource "aws_key_pair" "Divya_key" {
   key_name = "Windows-${random_pet.divya_pet.id}"
   public_key = tls_private_key.divya_private_key.public_key_openssh 
}

resource "local_file" "Divya_private_key_pem" {
    filename = "${random_pet.divya_pet.id}_private.pem"
    content  = tls_private_key.divya_private_key.private_key_pem
}

resource "local_file" "divya_public_key_pem" {
    filename = "${random_pet.divya_pet.id}_public.pem"
    content  = tls_private_key.divya_private_key.public_key_openssh
}