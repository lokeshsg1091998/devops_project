terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
      }
    }
}

provider "aws" {
    region = "eu-west-1"
}

resource "aws_instance" "jenkins_server" {
    ami = "ami-03cc8375791cb8bcf"
    instance_type = "t3.small"
    key_name = "irl-keypair"
    monitoring = true
    vpc_security_group_ids = [ "sg-080b2f530b66fd07b" ]

    tags = {
      "Name" = "jenkins_server"
    }

    user_data = <<-EOF
                #!/bin/bash
                sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
                echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
                sudo apt-get update -y
                sudo apt-get install fontconfig openjdk-17-jre -y
                sudo apt-get install jenkins -y
                EOF
}

output "jenkins-ip" {
    value = aws_instance.jenkins_server.public_ip
}

resource "aws_instance" "devops_server" {
    ami = "ami-03cc8375791cb8bcf"
    instance_type = "t3.micro"
    key_name = "irl-keypair"
    monitoring = true
    vpc_security_group_ids = [ "sg-013ef36435de1738d" ]

    tags = {
      "Name" = "devops_server" 
    }

    user_data = <<-EOF
                #!/bin/bash
                sudo apt update -y
                sudo apt-get install fontconfig openjdk-17-jre -y
                sudo mkdir /home/ubuntu/cicd
                sudo chown -R ubuntu:ubuntu /home/ubuntu/cicd
                EOF
}

output "devops-ip" {
    value = aws_instance.devops_server.public_ip
}

resource "aws_db_instance" "devops-rds" {
    identifier = var.rds_identifier
    db_name = var.db_name
    allocated_storage = 20
    engine = "mysql"
    engine_version = "8.0.39"
    instance_class = "db.t3.micro"
    publicly_accessible = true
    skip_final_snapshot = true
    vpc_security_group_ids = [ "sg-007a346066554ddf3" ]

    username = var.db_username
    password = var.db_password

    tags = {
      "Name" = "devops-rds" 
    }
}

output "rds-endpoint" {
    value = aws_db_instance.devops-rds.address
}

