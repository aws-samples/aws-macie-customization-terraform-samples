#Update your LogArchiveAccountId in the below format

LogArchiveAccountId = "xxxxxxxxxxx" ## value should be updated with double quotes. example Accountid = "1234567890"

#Update your ManagementAccountId in the below format

ManagementAccountId= "xxxxxxxxxx" ## value should be updated with double quotes. example Accountid = "1234567890"

#Existing member accounts
member_accounts = [
   {
      Accountid = "xxxxxxxxxx"
      Emailaddress = "xxxxxxxxxx@xxxx.com"
      enabled  = true
   },
   {
      Accountid = "xxxxxxxxxx"
      Emailaddress = "xxxxxxxxxx@xxxx.com"
      enabled  = true
   },
   {
      Accountid = "xxxxxxxxxx"
      Emailaddress = "xxxxxxxxxx@xxxx.com"
      enabled  = true
   },
   {
      Accountid = "xxxxxxxxxx"
      Emailaddress = "xxxxxxxxxx@xxxx.com"
      enabled  = true
   }
      ]

MacieOrgDeliveryKeyAlias="{{ kms key arn }}"        #Update kms key alias arn from prerequisites outputs.
exports3bucket="{{ S3 bucket name}}" #Update s3 bucket name from prerequisites outputs.