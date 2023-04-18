variable "autoenablemode" {
  type = string
  description = "Auto enable option to enable macie automatically for new accounts"
  default = "yes"
}

variable "LogArchiveAccountId" {
  description = "Account id of LogArchiveAccount"
  type = string
}

variable "MacieOrgDeliveryKeyAlias" {
  description = "kms key arn which is created part of pre-requisites"
  type = string
}

variable "exports3bucket" {
  description = "Bucket name which is created part of pre-requisites"
  type = string
}

variable "ManagementAccountId" {
  description = "Account id of ManagementAccount"
  type = string
}


variable "member_accounts" {
  type        = list(object({
        Accountid = string
        Emailaddress = string
  }))
  description = "Member account lists"
}