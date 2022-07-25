# Build Infrastructure - Terraform Azure Example

## Sumario

- [Build Infrastructure - Terraform Azure Example](#build-infrastructure---terraform-azure-example)
  - [Sumario](#sumario)
    - [O que é Terraform](#o-que-é-terraform)
    - [Instalando o Terraform](#instalando-o-terraform)
  - [Links úteis](#links-úteis)
  - [HashiTalks Brasil](#hashitalks-brasil)


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

## Links úteis
Para ajudar ainda mais esse guia sobre Terraform no Azure, voiu reforçar com algumas boas práticas de Terraform ideais para cenários de mercado.

1- [Terraform Best Practices](https://www.terraform-best-practices.com/v/ptbr/)
Este documento é uma tentativa de descrever sistematicamente as melhores práticas usando o Terraform, e, fornecer recomendações para os problemas mais frequentes de seus usuários.

2- sasas

## HashiTalks Brasil
Um evento virtual para a comunidade HashiCorp do Brasil em 28 de julho de 2022. Fica ligado demais pessoal!! Acesse [aqui](https://www.youtube.com/watch?v=ITXVEUqlMWk&ab_channel=HashiCorp) o evento.





