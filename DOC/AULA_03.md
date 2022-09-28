#### INSTALANDO TERRAFORM

1. [Terraform Install](https://www.terraform.io/downloads.html "Terraform Install")

Referência na apostila: `PÁGINA: 18`

---
#### VSCODE DOWNLOAD (OPCIONAL)

3. [VSCode Download](https://code.visualstudio.com/download "VSCode Download")

---
#### DOC DE REFERÊNCIA TERRAFORM

1. [Getting Started](https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/getting_started "Getting Started")
2. [Provider Reference](https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference "Provider Reference")
3. [HCL Reference Configuration](https://www.terraform.io/docs/language/syntax/configuration.html "HCL Reference Configuration")
4. [terraform init](https://www.terraform.io/docs/cli/commands/init.html "terraform init")
5. [terraform apply](https://www.terraform.io/docs/cli/commands/apply.html "terraform apply")
6. [terraform destroy](https://www.terraform.io/docs/cli/commands/destroy.html "terraform destroy")

---

#### COMANDOS DE REFERENCIA

1. Para inicializar o Provider, utilize o comando o comando de inicialização:

```sh
terraform init
```

2. O plano de execução do Terraform irá mostrar no terminal o que será criado ou modificado em sua infraestrutura,caso houver qualquer tipo de alteração de valores o Terraform irá mostrar qual o valor original e qual o novo valor que será inserido.

O comando para planejar o que será criado é o seguinte:

```sh
terraform plan
```

3. Para aplicar de fato sua infraestrutura, o comando é o `apply`, que basicamente é a saída apresentada no comando do “plan”.

```sh
terraform apply 
```

O sub-comando `-auto-approve`, indica que não queremos confirmação para criar infraestrutura.

4. Da mesma forma que se constrói infraestrutura, podemos deletar utilizando o sub-comando destroy.

```sh
terraform destroy
```

Da mesma forma que fizemos com o `apply`, aqui também podemos passar o subcomando `-auto-approve` para não pedir confirmação.
