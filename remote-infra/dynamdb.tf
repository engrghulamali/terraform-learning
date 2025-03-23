resource "aws_dynamodb_table" "basic-dynamodb-table" {
    name           = "terraform-learning-dynamodb-table"
    billing_mode   = "PROVISIONED"
    hash_key       = "LockID"

    read_capacity  = 5  # Set the number of read capacity units per second
    write_capacity = 5  # Set the number of write capacity units per second
    attribute {
        name = "LockID"
        type = "S"
    }

    tags = {
        Name        = "terraform-learning-dynamodb-table"
        Environment = "production"
    }
}