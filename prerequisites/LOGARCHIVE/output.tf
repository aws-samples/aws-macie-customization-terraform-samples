output "kms_key_alias_arn" {
  value       = aws_s3_bucket.MacieOrgDeliveryS3Bucket.bucket
  description = "kms key alias arn"
}