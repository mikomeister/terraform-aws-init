# get current account id
data "aws_caller_identity" "current" {}

# create an S3 bucket to store the state file in
resource "aws_s3_bucket" "terraform-state-storage-s3" {
  bucket = "${var.s3_states_bucket_name}-${data.aws_caller_identity.current.account_id}"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = "${merge(var.tags, map("Name", "${var.s3_states_bucket_name}-${data.aws_caller_identity.current.account_id}"))}"
}

resource "aws_dynamodb_table" "tf-locktable" {
  name           = "${var.table_name}"
  read_capacity  = "1"
  write_capacity = "1"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = "${merge(var.tags, map("Name", "${var.table_name}"))}"
}
