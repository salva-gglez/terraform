# Provisioners

Se recomienda el uso de **chef** o **puppet**. Los provisioners se ejecutan remotamente. Hay provisioners de tipo 
**creación** y de tipo **destruccion** que permiten ejecutar tareas tras la creación o antes de la destrucción del recurso. Hay provisioners **Multiple** que se ejecutan de manera secuencial y el orden en que aparecen en el plan. 

Y si fallan. Terraform sólo indica el fallo pero no deshace los pasos acometidos.

## Ejemplo

El **File provisioner**

```terraform
provisioner "file" {
    connection {
        type = "ssh" # Windows "oem"
        user = "root"
        private_key = var.provate_key
        host = var.hostname
    }
    source = "/local/file.txt"              # Puede ser un directorio y se copia todo el contenido
    destination = "/etc/my_file.txt"
}

provisioner "remote-exec" {
    scripts = ["list", "of", "local", "scripts"]
}
```
