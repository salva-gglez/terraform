# Providers

Hay muchos proveedores de infraestructura, no solo GCE, Azure o AWS. Generados por Hashicorp o la comunidad. Todos son Open Source (Golang). *Providers* son un conjunto de recursos y data sources. Se pueden crear multiples estancias. Por ejemplo un provider para cada región.

```terraform
provider "azurerm" {
    subscription_id = "xxxxxx"
    client_id = "user"
    client_secret = "jhjhjh"
    tenant_id = "tenant-id"
    alias = "arm-1"   # Esto es para cada provider que necesitemos
}

resource "azurerm_rs1" "sample1" {
    name = "jdjdjdj"
    location = "jdjdjd"
    provider = azurerm.arm-1   # Referenciamos el provider
}
```
