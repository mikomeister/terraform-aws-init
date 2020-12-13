# s3 bucket should be uniq, that's why in terraform we add account number
# terraform-state-${aws_account_id}
variable "s3_states_bucket_name" {
  description = "S3 bucket name for storing terraform lock"
  type        = "string"
}

variable "table_name" {
  description = "DynamoDB lock table name"
  type        = "string"
}

variable "tags" {
  description = "A map of tags to apply to all resources"
  type        = "map"
}

variable "region" {
  description = "Region name where changes will be provided"
  type = "string"
}
