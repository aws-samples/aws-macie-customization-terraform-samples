resource "aws_macie2_organization_admin_account" "admin_account" {
  admin_account_id = var.audit_account_id
}