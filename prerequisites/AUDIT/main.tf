data "aws_caller_identity" "current" {}

resource "aws_kms_key" "MacieOrgDeliveryKey" {
  description             = "Macie Delivery Key"
  enable_key_rotation     = true
  policy              = <<EOF
 {
  "Version" : "2012-10-17",
  "Id" : "key-default-1",
  "Statement" : [ {
      "Sid" : "Enable IAM User Permissions",
      "Effect" : "Allow",
      "Principal" : {
        "AWS" : "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
      },
        "Action": [
          "kms:*"
      ],
      "Resource" : "*"
    },
    {
      "Sid" : "Allow Macie to encrypt logs",
      "Effect": "Allow",
      "Principal": { "Service": "macie.amazonaws.com" },
      "Action": [
        "kms:GenerateDataKey"
      ],
      "Resource": "*"
    },
    {
      "Sid" : "Allow Log Archive and Management account access",
      "Effect": "Allow",
      "Principal" : {
        "AWS" : [
        "arn:aws:iam::${var.LogArchiveAccountId}:root",
        "arn:aws:iam::${var.ManagementAccountId}:root"
      ]
      },
      "Action": [
        "kms:Decrypt"
      ],
      "Resource": "*"
    },
    {
      "Sid" : "Allow account access",
      "Effect" : "Allow",
      "Principal" : {
        "AWS" : "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
      },
        "Action": [
          "kms:DescribeKey",
          "kms:Decrypt"
      ],
      "Resource" : "*"
    }
  ]
}
EOF
}

resource "aws_kms_alias" "MacieOrgDeliveryKeyAlias" {
  name          = "alias/MacieOrgDeliveryKeyAlias"
  target_key_id = aws_kms_key.MacieOrgDeliveryKey.key_id
}