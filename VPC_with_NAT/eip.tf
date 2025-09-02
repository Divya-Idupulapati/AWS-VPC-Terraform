resource "aws_eip" "nat_eip" {
    domain = "vpc"
    tags = {
      Name = random_pet.divya_pet.id
    }
}

resource "aws_eip" "Windows_eip" {
    domain = "vpc"
    tags = {
      Name = random_pet.divya_pet.id
    }
}