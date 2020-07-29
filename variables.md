# Variables en Deployments

Las variables tienen un nombre **Name** un tipo **type** y un valor por defecto **default**. Los dos ultimos opcionales pero recomendados. Los valores se sacan de diferentes sitios:

* De un fichero 
* Una variable de entorno
* Definiendola con la palabra clave **var**

Se puede definir variables que se solapen con otras variables. La presedencia de las variables es *Entorno*, *Fichero* y la más alta *Linea de comandos*.

Ejemplos:

```terraform
variable "env_var" {
    type = string     # Tipo estricto
    default = "development"
}

# En un fichero
env_var = "test"

# Linea de comandos: terraform plan -var env_var 'valor'. Este tiene preferencia

variable "cidr" {
    type = map(string)
    default = {
        development = "10.0.0.0/16"
        qa = "10.1.0.0/16"
        production = "10.2.0.0/16"
    }
}

cidr_block = lookup(var.cidr, var.env_var)
```
