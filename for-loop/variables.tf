variable "instances" {
  default = {
    mongodb = "t3.micro"
    redis   = "t3.micro"
    mysql   = "t3.small"
  }
}

variable "zone_id" {
  default = "Z01661093A7B6GVGYSJ68"
}

variable "domain_name" {
  default = "0gworld.shop"
}




