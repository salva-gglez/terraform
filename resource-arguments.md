# Resource Aerguments

|Argumento|Descripción|
|---|---|
|depends_on|Permite definir orden de precedencias|
|count|Define el numero de recursos a crear|
|for_each|Define un loop sobre recursos|
|provider|Especificar que provider usar|

```terraform
resoruce "aa" "bbb" {
    count = 2
    tags {
        Name = "customer-${count.index}"   # Empieza en 0
    }
    depends_on = [djdjdjdjd.dkdkd]
}

resource "kdkdkd" "ccc2 {
    for_each = {
        food = "public-read"
        cash = "private"
    }
    bucket = "${each.key}-${var.xxxx}" # La primera interaciópn será "food-xxxx"
    acl = each.value # El primer valor "public-read"
}


```
