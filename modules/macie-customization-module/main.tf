data "aws_caller_identity" "current" {}

resource "aws_macie2_member" "this" {
  for_each = {for member_account in var.member_accounts:     member_account.Accountid => member_account}
  account_id = each.value.Accountid
  email      = each.value.Emailaddress
  status     = try(each.value.enabled, true) ? "ENABLED" : "PAUSED"
  lifecycle {
    ignore_changes = [
      email,
    ]
  }
}

resource "aws_macie2_classification_export_configuration" "macieconfiguration" {
  s3_destination {
    bucket_name = var.exports3bucket
    kms_key_arn = var.MacieOrgDeliveryKeyAlias
  }
}

resource "null_resource" "Autoenablemode" {
  count  = var.autoenablemode == "yes" ? 1 : 0
  provisioner "local-exec" {
    interpreter = ["/bin/bash", "-c"]
    command = <<EOF
set -e
aws macie2 update-organization-configuration --auto-enable
EOF
  }
  triggers = {
    always_run = "${timestamp()}"
  }
}