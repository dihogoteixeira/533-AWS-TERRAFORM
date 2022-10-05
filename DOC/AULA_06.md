#### Pratice Labs: 

Criando configurações e modificando sua Infraestrutura

Instruções:

Para facilitar a organização, para cada exercício, crie uma pasta em separado. Utilize o terraform plan para realizar os testes de seu script.

Aproveite parar fazer seus testes, todo novo atributo que for criado, faça sempre o `terraform plan` e o `terraform validate` para verificar a saída no output.

Caso houver qualquer erro, leia atentamente o terminal.

* Para cada exercício, crie um novo diretório.
* Aproveite parar fazer seus testes, todo novo atributo que for criado, faça sempre o "terraform plan" para verificar a saída no terminal.
* Caso houver qualquer erro, leia atentamente o terminal.

Exercício 1.

<!--
Resolução deste exercicio esta na tag 1.1
https://gitlab.com/rd-clients/4linux/tf-modules/chapter10/gcp-network
-->

* Faça o clone do seu repositório que gerencia redes.

Modifique os valores do módulo de rede para suportar

* _enable_dns_hostnames_ .
* _enable_dns_support_.
* Faça os devidos testes consumindo este seu módulo localmente.
* Após o teste, versione o código gerando uma nova tag e altere seu código para a nova versão.
* Delete a infraestrutura.

Exercício 2.

<!--
Resolução deste exercicio esta na tag 1.2
https://gitlab.com/rd-clients/4linux/tf-modules/chapter10/gcp-network
-->

* Adicione outputs para o módulo de rede.
* Faça os devidos testes consumindo este seu módulo localmente.
* Após o teste, versione o código gerando nova tag
* Altere seu código para a nova versão para consumir diretamente do repositório.
* Delete a infraestrutura.

Exercício 3.

* Escrever um módulo para gerenciar subredes.
* Escreva outputs para seu módulo.
* Escreva a documentação de como utilizar este módulo.
* Crie um novo repositório no Gitlab.
* Versione o módulo.
* Altere seu código para consumir o módulo vindo diretamente do repositório.