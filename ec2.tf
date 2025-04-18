# ec2 instance creation using terraform


#steps

#step1 key pair for login
resource "aws_key_pair" "my_key" {
  key_name   = "terra-key"
  public_key = file("terra-key.pub")
}


#step2 VPC & Secuirty Group 
resource "aws_default_vpc" "default" {
    tags = {
        Name = "Default VPC"
        Environment = var.env
    }
}

resource "aws_security_group" "my_security_group" {
    name        = "automate-sg"
    description = "This will add a TF generate SG for EC2"
    vpc_id      = aws_default_vpc.default.id 

    # in-bound rules
    ingress {
        description = "SSH from VPC"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }  

    ingress {
        description = "http from VPC"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }  

    ingress {
        description = "https from VPC"
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    } 

    ingress {
        description = "flask app from VPC"
        from_port   = 8000
        to_port     = 8000
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    # out-bound rules
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

# step3 EC2 instance, 'with or without count meta based' 
# resource "aws_instance" "my_instance" {
#     count = 3 # number of instances
#     ami           = var.ec2_ami  # ubuntu OS, AMI(amazon machine image)
#     instance_type = var.aws_instance_type # instance type
#     key_name      = aws_key_pair.my_key.key_name #step 1
#     security_groups = [aws_security_group.my_security_group.name]     # step 2
#     tags = { 
#         Name = "Terraform-Instance"  # instance name
#     }
#     user_data = file("install_nginx.sh")
#     root_block_device {
#         volume_size = var.aws_root_storage_size # volume size
#         volume_type = "gp3" # volume type
#     }
# }


# step3 EC2 instance, 'each meta based' 
resource "aws_instance" "my_instance" {
    for_each = tomap({
        "instance1" = "t2.micro",
        "instance2" = "t2.small",
        "instance3" = "t2.medium"
    })

    depends_on = [ aws_security_group.my_security_group, aws_key_pair.my_key ]

    ami           = var.ec2_ami  # ubuntu OS, AMI(amazon machine image)
    instance_type = var.aws_instance_type # instance type
    key_name      = aws_key_pair.my_key.key_name #step 1
    security_groups = [aws_security_group.my_security_group.name]     # step 2
    tags = { 
        Name = each.key  # instance name based on each key
        Environment = var.env
    }
    user_data = file("install_nginx.sh")
    root_block_device {
        volume_size = var.aws_root_storage_size # volume size
        volume_type = "gp3" # volume type
    }
}