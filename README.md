# Introdução.

Bem vindo ao projeto de automação de Api.

Ele foi todo criado utilizando Rspec, Ruby, Httparty, FactoryBot e Faker.

Total de cenários: 37

Entre algumas de suas funcionalidades, estão:

- Verificação das saídas em GET, PUT, DELETE, POST;
- Validação de novos projetos com Baren Token e ID User;
- Saída do relatório em html na pasta /log;


## Necessário instalar:
    • Ruby for Windows/Linux: linguagem de programação utilizada nos testes. 
    • Cmder for Windows: Sistema que trás as funcionalidades bash (Terminal) para o Windows. 
    • DevKit: Kit de ferramentas que o sistema operacional precisa para que o desenvolvimento funcione. 
   

## Configurando o ambiente de automação de testes Web

Para que sua automação possa ser realizada é necessário instalar alguns recursos, conforme será descrito abaixo:

## Linux

## 1- Instalação Ruby 

Use os comandos abaixo no terminal:
```bash
$ sudo apt update
$ sudo apt install ruby-full
```

## 2- Instalando o bundler
No Terminal digite o comando:
```bash
gem install bundler
```
## Windows

## 1- Instalando o Console do Cmder
    • Baixe em: https://github.com/cmderdev/cmder/releases/download/v1.3.2/cmder.zip . 
    • Descompactar na pasta C:\Cmder. 
    • Selecione o cmder.exe e arrastar até sua barra de ferramentas do Windows para criar um atalho. 
    • Executar o cmder.exe. 
## 2- Instalando o Ruby para Windows de acordo com a versão do seu sistema operacional e arquitetura x86 (32bits) ou x64 (64bits)
    • Baixe em: http://rubyinstaller.org/downloads/. 
    • Executar o arquivo baixado e seguir as instruções clicando em ‘next’. 
    • Selecionar os 3 checkbox exibidos e continuar a dar ‘next’ até o ‘finish’. 
    • No Console do Cmder, digite o comando ruby –v , se a instalação estiver correta aparecerá a versão instalada. 
## 3- Instalando Devkit
    • Baixe em (x86): https://dl.bintray.com/oneclick/rubyinstaller/DevKit-mingw64-32-4.7.2-20130224-1151-sfx.exe. 
    • Baixe em (x64): http://dl.bintray.com/oneclick/rubyinstaller/DevKit-mingw64-64-4.7.2-20130224-1432-sfx.exe. 
    • Acesse o diretório C:\Ruby23-x64. 
    • Crie uma pasta chamada devkit e coloque o arquivo baixado dentro dessa pasta. 
    • Clique duas vezes no arquivo para que ele descompate os arquivos na pasta que foi criada. 
    • No Console do Cmder, digite os comandos: 
```bash
cd/
cd C:\Ruby23-x64\devkit
ruby dk.rb init
ruby dk.rb install
```
## 4- Alterando os sources do rubygems
O Rubygems precisa de uma atualização de certificado de sergurança para permitir utilizar com https, e para não precisar atualizar isso, passamos a utilizar então o repositório de gems em http, fazendo o seguinte:
    • No Console do Cmder, digite o comando: 
```bash
gem sources -a http://rubygems.org/
gem sources -r https://rubygems.org/
```

## 5- Instalando o bundler
No Console do Cmder, digite o comando:
``` bash
gem install bundler
```

## Rodando a automação:

## 1- Instalando as gemas:
No terminal, dentro da pasta raiz do projeto, execute o comando abaixo
``` bash
bundler install 
```

## Abaixo o comando para rodar a automação:


```bash
rspec
```




## Licença
Esse código é livre para ser usado dentro dos termos da licença MIT license




 
# project-api
