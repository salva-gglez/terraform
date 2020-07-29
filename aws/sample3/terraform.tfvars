# Valores de las variables

aws_access_key = ""

aws_secret_key = ""

key_name = "PluralsightKeys"

private_key_path = "private_key_path\private_key_file.pem"

bucket_name_prefix = "globo"

billing_code_tag = "ACCT8675309"

arm_subscription_id = "AZURE_SUBSCRIPTION_ID"

arm_principal = "AZURE_SERVICE_PRINCIPAL_ID"

arm_password = "AZURE_SERVICE_PRINCIPAL_PASSWORD"

tenant_id = "AZURE_SERVICE_PRINCIPAL_TENANT_ID"

dns_zone_name = "yourdomain.com"

dns_resource_group = "azure_resource_group_for_dns"

network_address_space = {
  Development = "10.0.0.0/16"
  UAT = "10.1.0.0/16"
  Production = "10.2.0.0/16"
}

instance_size = {
  Development = "t2.micro"
  UAT = "t2.small"
  Production = "t2.medium"
}

subnet_count = {
  Development = 2
  UAT = 2
  Production = 3
}

instance_count = {
  Development = 2
  UAT = 4
  Production = 6
}