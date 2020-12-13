output "s3-states-bucket-name" {
  value = "${aws_s3_bucket.terraform-state-storage-s3.id}"
}

output "dynamodb-lock-table" {
  value = "${aws_dynamodb_table.tf-locktable.id}"
}
