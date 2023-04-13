<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_null"></a> [null](#provider\_null) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_macie2_classification_export_configuration.macieconfiguration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/macie2_classification_export_configuration) | resource |
| [aws_macie2_member.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/macie2_member) | resource |
| [null_resource.Autoenablemode](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_LogArchiveAccountId"></a> [LogArchiveAccountId](#input\_LogArchiveAccountId) | Account id of LogArchiveAccount | `string` | n/a | yes |
| <a name="input_MacieOrgDeliveryKeyAlias"></a> [MacieOrgDeliveryKeyAlias](#input\_MacieOrgDeliveryKeyAlias) | kms key arn which is created part of pre-requisites | `string` | n/a | yes |
| <a name="input_ManagementAccountId"></a> [ManagementAccountId](#input\_ManagementAccountId) | Account id of ManagementAccount | `string` | n/a | yes |
| <a name="input_autoenablemode"></a> [autoenablemode](#input\_autoenablemode) | Auto enable option to enable macie automatically for new accounts | `string` | `"yes"` | no |
| <a name="input_exports3bucket"></a> [exports3bucket](#input\_exports3bucket) | Bucket name which is created part of pre-requisites | `string` | n/a | yes |
| <a name="input_member_accounts"></a> [member\_accounts](#input\_member\_accounts) | Member account lists | <pre>list(object({<br>        Accountid = string<br>        Emailaddress = string<br>  }))</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->