resource "random_pet" "divya_pet" {
    length = 3
}

resource "random_password" "divya_password" {
    length = 15
    special = true
}

resource "random_id" "divya_id" {
    byte_length = 8
}

resource "random_integer" "divya_integer" {
    min = 10
    max = 100
}

resource "random_string" "divya_string" {
    length = 15
    upper = true
    special = true  
}

resource "random_uuid" "divya_uuid" {
}

resource "random_shuffle" "random_region" {
  input        = ["us-east-1", "us-east-2"]
  result_count = 1
}