variable "aws_instance_type" {
    description = "The type of EC2 instance to launch"
    default     = "t2.micro"
    type = string
}

variable "aws_root_storage_size" {
    description = "The size of the root storage"
    default     = 8
    type = number
}

variable "ec2_ami" {
    description = "The AMI to use for the EC2 instance"
    default     = "ami-0e35ddab05955cf57"
    type = string
}

variable "env" {
    description = "The environment to deploy to"
    default     = "dev"
    type = string
}