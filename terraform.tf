terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "5.92.0"
        }
    }
    backend "s3" {
        bucket = "sanpal-ali-ws-terraform-in-one-shot"
        key    = "terraform.tfstate"
        region = "ap-south-1"
        dynamodb_table = "terraform-learning-dynamodb-table"
    }
}