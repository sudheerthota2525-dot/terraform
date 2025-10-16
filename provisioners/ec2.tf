resource "aws_instance" "terraform" {
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_all_tf.id]
    tags = {
        Name = "terraform-1"
        Terraform = "true"
    }

    provisioner "local-exec"{
      command = "echo ${self.private_ip} > inventory"
      on_failure = continue
    }

    provisioner "local-exec"{
      command = "echo Instance is destroyed"
      when    = destroy
    }
}

resource "aws_security_group" "allow_all_tf" {
  name   = "allow-all-tf"

  egress {
    from_port        = 0 # from port 0 to to port 0 means all ports
    to_port          = 0 
    protocol         = "-1" # -1 means all protocols
    cidr_blocks      = ["0.0.0.0/0"] # internet
  }

  ingress {
    from_port        = 0 # from port 0 to to port 0 means all ports
    to_port          = 0 
    protocol         = "-1" # -1 means all protocols
    cidr_blocks      = ["0.0.0.0/0"] # internet
  }

  tags = {
    Name = "allow-all-tf"
  }

}