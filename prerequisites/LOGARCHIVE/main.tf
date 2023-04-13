data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

resource "aws_s3_bucket" "MacieOrgDeliveryS3Bucket" {
  bucket_prefix = var.bucketname
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.MacieOrgDeliveryS3Bucket.bucket

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = var.MacieOrgDeliveryKMSKeyArn
      sse_algorithm     = "aws:kms"
    }
    bucket_key_enabled = true
  }

}

resource "aws_s3_bucket_ownership_controls" "MacieOrgDeliveryS3Bucket_controls" {
  bucket = aws_s3_bucket.MacieOrgDeliveryS3Bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "accessblock" {
  bucket = aws_s3_bucket.MacieOrgDeliveryS3Bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "versioning_configuration" {
  bucket = aws_s3_bucket.MacieOrgDeliveryS3Bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_policy" "bucketpolicy" {
  bucket = aws_s3_bucket.MacieOrgDeliveryS3Bucket.id

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
    {
      "Sid": "DenyPutObjectUnlessMacie",
      "Effect": "Deny",
      "Action": "s3:PutObject",
      "Condition": {
        "ForAnyValue:StringNotEquals": {
          "aws:CalledVia": "macie.amazonaws.com"
        }
      },
      "Resource": [
                "${aws_s3_bucket.MacieOrgDeliveryS3Bucket.arn}",
                "${aws_s3_bucket.MacieOrgDeliveryS3Bucket.arn}/*"
      ],
      "Principal": "*"
    },
    {
      "Sid": "SecureTransport",
      "Effect": "Deny",
      "Action": "s3:*",
      "Condition": {
        "Bool": {
          "aws:SecureTransport": false
        }
      },
      "Resource": [
                "${aws_s3_bucket.MacieOrgDeliveryS3Bucket.arn}",
                "${aws_s3_bucket.MacieOrgDeliveryS3Bucket.arn}/*"
      ],
      "Principal": "*"
    },
    {
      "Sid": "AWSBucketPermissionsCheck",
      "Effect": "Allow",
      "Action": [
        "s3:GetBucketAcl",
        "s3:GetBucketLocation",
        "s3:ListBucket"
      ],
      "Resource": "${aws_s3_bucket.MacieOrgDeliveryS3Bucket.arn}",
      "Principal": {
        "Service": [
          "macie.amazonaws.com"
        ]
      }
    },
    {
      "Sid": "AWSBucketDelivery",
      "Effect": "Allow",
      "Action": "s3:PutObject",
      "Condition": {
        "StringEquals": {
          "s3:x-amz-acl": "bucket-owner-full-control"
        }
      },
      "Resource": "${aws_s3_bucket.MacieOrgDeliveryS3Bucket.arn}/*",
      "Principal": {
        "Service": [
          "macie.amazonaws.com"
        ]
      }
    },
    {
      "Sid": "DenyUnencryptedObjectUploads",
      "Effect": "Deny",
      "Action": "s3:PutObject",
      "Condition": {
        "StringNotEquals": {
          "s3:x-amz-server-side-encryption": "aws:kms"
        }
      },
      "Resource": "${aws_s3_bucket.MacieOrgDeliveryS3Bucket.arn}/*",
      "Principal": {
        "Service": [
          "macie.amazonaws.com"
        ]
      }
    },
    {
      "Sid": "DenyIncorrectEncryptionHeader",
      "Effect": "Deny",
      "Action": "s3:PutObject",
      "Condition": {
        "StringNotEquals": {
          "s3:x-amz-server-side-encryption-aws-kms-key-id": "${var.MacieOrgDeliveryKMSKeyArn}"
        }
      },
      "Resource": "${aws_s3_bucket.MacieOrgDeliveryS3Bucket.arn}/*",
      "Principal": {
        "Service": [
          "macie.amazonaws.com"
        ]
      }
    },
    {
      "Sid": "AllowDelegatedAdminReadAccess",
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:ListBucket"
      ],
      "Resource": [
        "${aws_s3_bucket.MacieOrgDeliveryS3Bucket.arn}",
        "${aws_s3_bucket.MacieOrgDeliveryS3Bucket.arn}/*"
      ],
      "Principal": {
        "AWS": "arn:aws:iam::${var.DelegatedAdminAccountId}:root"
      }
    }
  ]
}
POLICY
  depends_on = [
    aws_s3_bucket.MacieOrgDeliveryS3Bucket
  ]
}