module "Delegation_Admin_Access" {
  source = "../../modules/delegation-access-module"
  audit_account_id          = var.audit_account_id
}
