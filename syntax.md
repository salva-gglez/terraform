# Sintaxis de Terraform

EL lenguaje que se usa para la configuración con Terraform se llama **HashiCorp configuration language**.

## Blocks

```terraform
terraform 
# Basic block 
block_type label_one label_two {
    key = value

    embedded_block {
        key = value
    }
}
```

Ejemplo

* aws_route_table -> Tipo de recurso
* route-table -> Nombre del recurso
* key = vpc_id y value "887hhy"

```terraform
resource "aws_route_table" "route-table" {
    vpc_id = "id8877633"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "id2238663"
    }
}
```

## Object Types

```terraform
string = "cadena"
number = 13
bool = true
list = ["bean-taco", "beef-taco" ]
map = { name = "Ned", age = 42, love_tacos = false }
```

## Referencias

> var.xxxxxx \
  resource.label.property
  local.name_value.values
  module.name_resource.property

### Interpolación

> variable = "prueba-${var.prueba}"

### Cadenas, numeros y Booleanos

> local.contador -> Retorna un numero

### Listas y mapas

> local.elementos[0] o local.elementos["key-name"]

### Recursos

> var.region -> Retorna un valor \
data.xxxxx.azs.names[1] -> Retorna el segundo elemento de la lista


## Ejemplos

```terraform
locals {     # Definición de valores
  common_tags = {
    BillingCode = var.billing_code_tag
    Environment = var.environment_tag
  }

  s3_bucket_name = "${var.bucket_name_prefix}-${var.environment_tag}-${random_integer.rand.result}"
}

resource "random_integer" "rand" {     # Generador de números aleatorios
  min = 10000
  max = 99999
}

resource "aws_vpc" "vpc" {
  cidr_block = var.network_address_space

  tags = merge(local.common_tags, { Name = "${var.environment_tag}-vpc" }) # Crea un nuevo nuevo map derivado de dos mapas
}

provisioner "file" {
    content = <<EOF
/var/log/nginx/*log {
    daily
    rotate 10
    missingok
    compress
    sharedscripts
    postrotate
    endscript
    lastaction
        INSTANCE_ID=`curl --silent http://169.254.169.254/latest/meta-data/instance-id`
        sudo /usr/local/bin/s3cmd sync --config=/home/ec2-user/.s3cfg /var/log/nginx/ s3://${aws_s3_bucket.web_bucket.id}/nginx/$INSTANCE_ID/
    endscript
}

EOF
    destination = "/home/ec2-user/nginx"   # El destino tiene que ser local al usuario remote. Luego con "remote-exec" lo movemos a la carpeta correcta
  }
```
