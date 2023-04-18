module "Macie_customization" {
  source = "../modules/macie-customization-module"
  LogArchiveAccountId = var.LogArchiveAccountId
  MacieOrgDeliveryKeyAlias = var.MacieOrgDeliveryKeyAlias
  exports3bucket = var.exports3bucket
  ManagementAccountId = var.ManagementAccountId
  member_accounts  = var.member_accounts
}