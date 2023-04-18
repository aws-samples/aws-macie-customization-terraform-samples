## Deployment steps:

**Log Archive Account:**

1. Go to prerequisites/LOGARCHIVE directory and update the value for DelegatedAdminAccountId, bucketname and MacieOrgDeliveryKMSKeyArn value.
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
| [aws_s3_bucket.MacieOrgDeliveryS3Bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_ownership_controls.MacieOrgDeliveryS3Bucket_controls](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls) | resource |
| [aws_s3_bucket_policy.bucketpolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.accessblock](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.versioning_configuration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_DelegatedAdminAccountId"></a> [DelegatedAdminAccountId](#input\_DelegatedAdminAccountId) | Account id which we want to delegate access | `string` | n/a | yes |
| <a name="input_MacieOrgDeliveryKMSKeyArn"></a> [MacieOrgDeliveryKMSKeyArn](#input\_MacieOrgDeliveryKMSKeyArn) | KMS Key ARN value which is created part of pre-requisites | `string` | n/a | yes |
| <a name="input_bucketname"></a> [bucketname](#input\_bucketname) | Bucket to export macie findings | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kms_key_alias_arn"></a> [kms\_key\_alias\_arn](#output\_kms\_key\_alias\_arn) | kms key alias arn |
<!-- END_TF_DOCS -->