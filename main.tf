resource "aws_dynamodb_table" "this" {
  name           = var.table_name
  billing_mode   = var.billing_mode
  stream_enabled = var.stream_enabled
  hash_key       = var.hash_key.name
  range_key      = var.range_key.name

  attribute {
    name = var.hash_key.name
    type = var.hash_key.type
  }

  attribute {
    name = var.range_key.name
    type = var.range_key.type
  }

  ttl {
    enabled        = var.ttl_enabled
    attribute_name = var.ttl_attribute_name
  }

  point_in_time_recovery {
    enabled = var.pitr_enabled
  }

  server_side_encryption {
    enabled     = var.sse_kms_enabled
    kms_key_arn = var.sse_kms_key_arn
  }
}