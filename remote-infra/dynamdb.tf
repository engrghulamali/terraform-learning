resource "aws_dynamodb_table" "basic-dynamodb-table" {
    name           = "tws-dynamodb-table"
    billing_mode   = "PROVISIONED"
    read_capacity  = 20
    write_capacity = 20
    hash_key       = "LockID"
    range_key      = "GameTitle"

    attribute {
        name = "LockID"
        type = "S"
    }

    tags = {
        Name        = "tws-dynamodb-table"
        Environment = "production"
    }
}