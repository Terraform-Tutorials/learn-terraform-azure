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
Para que possamos ter uma ideia da linguagem usada pelo Terraform, chamada de HCL, vamos aos exemplos abaixo:

```hcl
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
O Terraform possui um estágio representado por alguns comandos que vou mostrar abaixo. 



