variable "DelegatedAdminAccountId" {
  description = "Account id which we want to delegate access"
  type = string
}

variable "bucketname" {
  description = "Bucket to export macie findings"
  type = string
}

variable "MacieOrgDeliveryKMSKeyArn" {
  description = "KMS Key ARN value which is created part of pre-requisites"
  type = string
}