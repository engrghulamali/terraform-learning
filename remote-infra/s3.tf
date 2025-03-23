resource "aws_s3_bucket" "remote_s3" {
    bucket = "ghulam-ali-bucket-for-secure-state-id-store"

    tags = {
        Name  = "ghulam-ali-bucket-for-secure-state-id-store"
    }
}