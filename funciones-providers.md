# Funciones y Providers

Las funciones se pueden probar en la consola. Las funciones aparecen agrupadas por funcionalidad en la documentación.

|Tipo de funciones|Uso|Ejemplo|
|---|---|---|
|Numeric|Para manipulación de numeros|min(3,23,45)|
|String|Cadenas|lower("EJEMPLO)|
|Colletion|Tratamiento de colecciones|merge(map1, map2)|
|FileSystem|Tratamiento de ficheros|file(path)|
|IP Network|Redes|cidrsubnet()|
|Date and Time|Tratamiento de fechas y horas|timestamp()|

```terraform
Func_name(arg1, arg2, arg3, ...)   # Parametros posicionales

variable "amis" {
    type = "map"
    default = {
        us-east-1 = "ami-1234"
        us-west-1 = "ami-5678"
    }
}

ami = lookup(var.amis, "us-east-1", "error")   # Si no escontramos el valor en el map devolvemos el error
```

Como usar la consola para probar los comandos.

```bash
terraform console
> min(45, 12,23)
12
> cidrsubnet(var.network_address_space, 8, 0)
10.1.0.0/24
```