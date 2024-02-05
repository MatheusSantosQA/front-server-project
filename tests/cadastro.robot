*** Settings ***
Documentation                                Teste

Resource                                     ../resources/base.robot


Test Setup                                   Star Session
Test Teardown                                Take Screenshot


*** Test Cases ***
Cadastro com sucesso
    ${account}                                Get Fake Account
    
    Dado que eu acesse a página de cadastro
    E insiro meu nome completo                ${account}
    E insiro meu email                        ${account}
    E insiro minha senha                      ${account}
    Quando eu clicar em "Cadastrar"
    Então devo ser cadastrado e enviado para a página inicial do site
