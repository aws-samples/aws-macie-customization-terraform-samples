## Deployment steps:

**Audit Account:**

1. Go to prerequisites/AUDIT directory and update the value for LogArchiveAccountId and ManagementAccountId value.
2. Post that run the below commands to apply the changes.

```
export AWS_REGION={{ REGION }}
terraform init
terraform plan
terraform apply
```

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_kms_alias.MacieOrgDeliveryKeyAlias](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.MacieOrgDeliveryKey](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_LogArchiveAccountId"></a> [LogArchiveAccountId](#input\_LogArchiveAccountId) | Account id of LogArchiveAccount | `string` | n/a | yes |
| <a name="input_ManagementAccountId"></a> [ManagementAccountId](#input\_ManagementAccountId) | Account id of ManagementAccount | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kms_key_arn"></a> [kms\_key\_arn](#output\_kms\_key\_arn) | kms key arn |
<!-- END_TF_DOCS -->