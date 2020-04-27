# Modulos

Los modulos permiten crear estructuras que pueden ser reutilizadas. Pueden estar localizados localmente a los proyectos o en registros remotos como [Terraform Registry](https://registry.terraform.io/). Siempre usamos el **Root module** de Hashicorp. Los modulos permiten el *versionado*, la *herencia*. Los módulos **no soportan el uso de COUNT**.



Los modulos están compuestos de:

1. Variables de entrada (input variables)
1. Recursos (resources)
1. Salidas (outputs)

Un módulo de ejemplo:

```terraform
varibale "name" {}

resource "aws_s3_bucket" "bucket" {
    name = var.name
    [...]
}

output "bucket_id" {
    value = aws_s3_bucket.bucket.id
}
```

Cómo se consume un módulo:

```terraform
# Crear el modulo de tipo "bucket"
module "bucket" {
    name = "test-module"
    source = ".\\modules\modulo1"
}

# Usar el modulo "test-module"
resource "aws_s3_bucket_object" {
    bucket = module.bucket.bucket_id
    [...]
}
```

Vemos un ejemplo más complicado:

```terraform

data "template_file" "public_cidrsubnet" {
  count = var.subnet_count[terraform.workspace]

  template = "$${cidrsubnet(vpc_cidr,8,current_count)}"

  vars = {
    vpc_cidr      = var.network_address_space[terraform.workspace]
    current_count = count.index
  }
}

# NETWORKING #
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name   = "${local.env_name}-vpc"
  version = "2.15.0"

  cidr            = var.network_address_space[terraform.workspace]
  azs             = slice(data.aws_availability_zones.available.names, 0, var.subnet_count[terraform.workspace])
  public_subnets  = data.template_file.public_cidrsubnet[*].rendered  # Aqui llamamos a la template y que la itere 
  private_subnets = []

  tags = local.common_tags
}
```
