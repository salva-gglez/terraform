# Data Sources y Templates

## Template 

Una template es una cadena de texto larga, que incluye nuevas lineas. Por medio de valores terraform inyecta esos valores en la cadena. El template retorna siempre una cadena.

```terraform
data "template_file" "ejemplo" {
    count = "2"
    template = "$${var1-current_count}"  # Doble interpolación
    vars {
        var1 = "${var.some_value}"
        current_count = ${count.index}
    }
}

# Uso del template
${data.template_file.ejemplo.rendered}
```

## Data sources

Las *Templates* son data sources.

```terraform
data "http" "ejemplo" {
    url = "https://url.to.website.com"

    request_headers {
        header_name = "header_value"
    }
}

# Usar el data source - responde con una cadena
${data.http.ejemplo.body}
```

```terraform
data "external" "ejemplo" {
    program = ["aplicacion a ejecutar", "ruta a la aplicacion"]

    query = {
        var1 = "value1"
        var2 = "value2"
    }
}

# Usar el data source - responde con un JSON
${data.external.ejemplo.result.somre_value}
```
