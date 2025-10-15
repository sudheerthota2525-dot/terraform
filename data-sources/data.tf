data "aws_ami" "sudheerthota" {
    owners           = ["457861824136"]
    most_recent      = true
    
    filter {
        name   = "name"
        values = ["RHEL-9-DevOps-Practice"]
    }

    filter {
        name   = "root-device-type"
        values = ["ebs"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
}

output "ami_id" {
    value = data.aws_ami.sudheerthota.id
}

data "aws_instance" "mongodb" {
    instance_id = "i-0a3e13fc437961eea"
}

output "mongodb_info" {
    value = data.aws_instance.mongodb.public_ip
}