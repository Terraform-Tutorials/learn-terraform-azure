# Build Infrastructure - Terraform Azure Example

## Sumario

- [Build Infrastructure - Terraform Azure Example](#build-infrastructure---terraform-azure-example)
  - [Sumario](#sumario)
    - [O que é Terraform](#o-que-é-terraform)
    - [Instalando o Terraform](#instalando-o-terraform)
    - [Glossário Terraform](#glossário-terraform)
  - [Dose diária de Terraform](#dose-diária-de-terraform)
  - [Terraform: Melhores práticas](#terraform-melhores-práticas)
  - [HashiTalks Brasil](#hashitalks-brasil)
  - [Visual Studio Code](#visual-studio-code)
    - [Estrutura do arquivo `.tf`](#estrutura-do-arquivo-tf)
    - [Os estágios do Terraform](#os-estágios-do-terraform)
    - [Azure CLI](#azure-cli)
      - [Instalando o Azure CLI](#instalando-o-azure-cli)
    - [AzureRM](#azurerm)
    - [Provisionando o primeeiro recurso](#provisionando-o-primeeiro-recurso)


### O que é Terraform
Antes de começar precisamos tomar alguma ideia do que é o Terraform e qual é seu propósito dentro de DevOps e dentro do contexto de IaC (Infrastructure as Code). O Terraform é capaz de criar, provisionar, muda e versionar o estado de uma infraestrutura, muito  utilizado no mercado, multi-plataforma, e simples de aprender.

![terraform](images/terra1.png)

### Instalando o Terraform
Para que seja possível a utilização, temos que prosseguir com a instalação do Terraform, siga os comandos abaixo.

- Para sistemas baseados em Debian, como o Ubuntu:

```bash
$ wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
$ echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
$ sudo apt update && sudo apt install terraform
```

- Para mais sistemas operacionais como CentOS, MAC, use esse link [aqui](https://www.terraform.io/downloads).

### Glossário Terraform
[Esta](https://www.terraform.io/docs/glossary) página reúne breves definições de alguns dos termos técnicos usados na documentação do Terraform, bem como alguns termos que aparecem com frequência em conversas em toda a comunidade Terraform.

## Dose diária de Terraform
Existe um belissímo trabalho do [Anton Babenko](https://github.com/antonbabenko) na comunidade e gostaria de divulgar aqui com vocês. Vale demais asistir os vídeos e se inscrever no [canal](https://www.youtube.com/c/AntonBabenkoLive) dele no YouTube. Acompanhe também a página dele no [Twitter](https://twitter.com/weeklytf).

## Terraform: Melhores práticas
Para ajudar ainda mais esse guia sobre Terraform no Azure, vou reforçar com algumas boas práticas de Terraform ideais para cenários de mercado. Existe um [guia](https://www.terraform-best-practices.com/v/ptbr/) muito forte dentro da comunidade do Terraform escrito por [Anton Babenko](https://github.com/antonbabenko), e mantido pela comunidade como um todo. Este documento é uma tentativa de descrever sistematicamente as melhores práticas usando o Terraform, e, fornecer recomendações para os problemas mais frequentes de seus usuários.

Existe mais um outro site que fornece MUITAS informações úteis sobre as boas práticas com Terraform. Este documento apresenta diretrizes e recomendações para um desenvolvimento eficaz com o Terraform em vários membros da equipe e fluxos de trabalho. Acesse [aqui](https://cloud.google.com/docs/terraform/best-practices-for-terraform).

## HashiTalks Brasil
Um evento virtual para a comunidade HashiCorp do Brasil em 28 de julho de 2022. Fica ligado demais pessoal!! Acesse [aqui](https://www.youtube.com/watch?v=ITXVEUqlMWk&ab_channel=HashiCorp) o evento. Confira abaixo alguns dos temas do evento:

- **Providers utilitários do Terraform que podem facilitar suas tarefas do dia a dia**
Sabia que é possível gerar um .zip somente com Terraform? Ou que pode fazer uma requisição HTTP GET e usar a saída no seu código Terraform? Ou melhor, gerar nomes aleatórios para os recursos? Essa palestra vai mostrar casos de uso para alguns providers utilitários do Terraform que são ótimos de se ter na caixa de ferramentas na hora de resolver tarefas do dia a dia.

- **Promovendo entrega contínua com Terraform**
Demonstração do processo de entrega contínua utilizando o Terraform e Azure DevOps e como pode ser simples a administração e manutençãoda pipeline e Iac para o SRE , além de como é descomplicado para o desenvolvedor utilizar a pipeline.

- **CodeBuild, CodePipeline e conteinerizações com Terraform**
Vou falar um pouco sobre como o Terraform nos auxiliou a criar recursos na AWS de CodeBuild e CodePipeline que fazem parte do nosso processo de entrega e que ajudam a buildar nossas imagens de aplicações em Docker e gerenciá-las com ECR ou algum outro repositório, garantindo a preservação da infraestrutura, facilidade para construção de POCs, segurança no manuseio de chaves e agilidade para criar com complexidade.


## Visual Studio Code
Para facilitar o desenvolvimento com os arquivos HCL do Terraform, uma IDE muito utilizada pelos profissionais é o VSCode. Instale ele clicando [aqui](https://code.visualstudio.com/). Existe também uma extensão muito boa que ajuda demais na identação e na formatação dos arquivos do Terrafor, autocomplete e mais features. Baixei [aqui](https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform).


### Estrutura do arquivo `.tf`
Para que possamos ter uma ideia da linguagem usada pelo Terraform, chamada de HCL, vamos aos exemplos abaixo. Linguagem declarativa.

```t
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "tutorials" {
  ami           = var.ami
  instance_type = var.instance_type
}
```

### Os estágios do Terraform
O Terraform possui um estágio representado por alguns comandos que vou mostrar abaixo. Funciona como um workflow.

- `$ terraform init` - inicia o diretório de trabalho do Terraform, é a parte de baixar plugins dos provedores.
- `$ terraform plan` - estágio de planejamento da infraestrutura, parte que faz o provisionamento.
- `$ terraform apply` - executa o comando `apply` para que o ambiente seja criado e provisionado.
- `$ terraform destroy` - comando que faz a destruição dos recursos criados no provedor.

### Azure CLI
A principal ferramenta de linha de comando do Azure para gerenciar os diversos serviços.

#### Instalando o Azure CLI
A CLI do Azure é uma ferramenta de linha de comando multiplataforma que pode ser instalada localmente em computadores Linux. Você pode usar a CLI do Azure no Linux para se conectar ao Azure e executar comandos administrativos sobre os recursos do Azure. A CLI no Linux permite a execução de vários comandos por meio de um terminal usando prompts de linha de comando interativos ou um script. Vamos fazer a instalação direto no Linux Ubuntu. Para mais opções clique [aqui](https://docs.microsoft.com/pt-br/cli/azure/install-azure-cli).

- Instalar com um comando

`curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash`

### AzureRM
Um dos providers do Azure para uso dentro da nuvem pública do Azure. Mais detalhes [aqui](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs).

```t
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.15.1"
    }
  }
}

provider "azurerm" {
  # Configuration options
}
```

### Provisionando o primeeiro recurso
Hora de botar a mao na massa e ajustar nosso primeiro recurso na cloud da Azure. Siga as etapas abaixo:

- Primeiramente vamos logar na cloud da Azure via Azure CLI.

`$ az login`

- Executando o comando `terraform init`.

```bash
$ terraform init

Initializing the backend...

Initializing provider plugins...
- Finding hashicorp/azurerm versions matching "3.15.1"...
- Installing hashicorp/azurerm v3.15.1...
- Installed hashicorp/azurerm v3.15.1 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

- Agora vamos executar o plan.

```bash
 terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # azurerm_resource_group.teste-group will be created
  + resource "azurerm_resource_group" "teste-group" {
      + id       = (known after apply)
      + location = "brazilsouth"
      + name     = "rgterraform"
    }

Plan: 1 to add, 0 to change, 0 to destroy.

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── 

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.
```

- E por ultimo o comando `terraform apply`.

```bash
$ terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # azurerm_resource_group.teste-group will be created
  + resource "azurerm_resource_group" "teste-group" {
      + id       = (known after apply)
      + location = "brazilsouth"
      + name     = "rgterraform"
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

azurerm_resource_group.teste-group: Creating...
azurerm_resource_group.teste-group: Creation complete after 4s

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Note: Objects have changed outside of Terraform

Terraform detected the following changes made outside of Terraform since the last "terraform apply":

  # azurerm_resource_group.teste-group has been changed
  ~ resource "azurerm_resource_group" "teste-group" {
        id       = "/subscriptions/99a99sjsj777444os000ssss10101sss/resourceGroups/rgterraform"
        name     = "rgterraform"
      + tags     = {}
        # (1 unchanged attribute hidden)
    }

Unless you have made equivalent changes to your configuration, or ignored the relevant attributes using ignore_changes, the following plan may include actions to undo or respond to these changes.
```