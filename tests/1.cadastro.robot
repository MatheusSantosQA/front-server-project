*** Settings ***
Documentation                                        Teste

Resource                                             ../resources/base.robot


Test Setup                                           Star Session
Test Teardown                                        Take Screenshot


*** Test Cases ***
Cadastro de usuário com sucesso
    ${account}                                        Get Fake Account
    
    Dado que eu acesse a página de cadastro
    E insiro meu nome completo                        ${account}
    E insiro meu email                                ${account}
    E insiro minha senha                              ${account}
    Quando eu clicar em "Cadastrar"
    Então devo ser cadastrado e enviado para a página inicial do site

Cadastro de usuário adm com sucesso
    ${account}                                        Get Fake Account
    
    Dado que eu acesse a página de cadastro
    E insiro meu nome completo                        ${account}
    E insiro meu email                                ${account}
    E insiro minha senha                              ${account}
    E informo cadastro como administrador na checkbox
    Quando eu clicar em "Cadastrar"
    Então devo ser cadastrado e enviado para a página inicial do site
    
Cadastro com duplicidade
    ${account}                                        Create Dictionary
    ...                                               name=Teste QA
    ...                                               email=teste@qa.com
    ...                                               password=pwd123
    
    Dado que eu acesse a página de cadastro
    E insiro meu nome completo                        ${account}
    E insiro meu email                                ${account}
    E insiro minha senha                              ${account}
    Quando eu clicar em "Cadastrar"
    Então o site deve retornar a mensagem de email já utilizado