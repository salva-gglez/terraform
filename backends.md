# Backends

Los backends se usan para almacenar el estado de los planes de terraform de manera centralizada. Es la manera en la que dos o más usuarios no se solapan haciendo el mismo trabajo.

´´´terraform
terraform {
    backend "type" {
        # Backend configurations
        # partial configurations allowed
        # no interpolations
    }
}
´´´

Un ejemplo de como utilizar los backends.

```bash
# Initialize the environment using the networking bucket and Mary's keys
# Change TABLE_NAME and NET_BUCKET_NAME to the values from the prerequisite output
# Change REGION_NAME to your region
terraform init --backend-config="dynamodb_table=TABLE_NAME" --backend-config="bucket=NET_BUCKET_NAME" --backend-config="profile=marymoe" --backend-config="region=REGION_NAME"

terraform workspace new development

terraform plan -out net.tfplan

terraform apply "net.tfplan"
```
