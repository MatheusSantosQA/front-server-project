*** Settings ***
Documentation                                        Teste

Resource                                             ../resources/base.robot


Test Setup                                           Star Session
Test Teardown                                        Take Screenshot


*** Test Cases ***
Login com sucesso
    Dado que eu acesse o site e entre na área de login
    E eu informar o email
    E informar a senha
    Quando eu clicar em 'Entar'
    Então serei direcionado para home do site

Login com email inválido
    Dado que eu acesse o site e entre na área de login
    E eu informar o email incorreto
    E informar a senha
    Quando eu clicar em 'Entar'
    Então o site deve retornar a mensagem de alerta            Email e/ou senha inválidos

Login com senha inválida
    Dado que eu acesse o site e entre na área de login
    E eu informar o email
    E informar a senha incorreta
    Quando eu clicar em 'Entar'
    Então o site deve retornar a mensagem de alerta            Email e/ou senha inválidos 

Login com campos branco
    Dado que eu acesse o site e entre na área de login
    Quando eu clicar em 'Entar'
    Então o site deve retornar duas mensagens de alerta        Email é obrigatório                Password é obrigatório

Login com campo email em branco
    Dado que eu acesse o site e entre na área de login
    E informar a senha
    Quando eu clicar em 'Entar'
    Então o site deve retornar a mensagem de alerta            Email é obrigatório

Login com campo senha em branco
    Dado que eu acesse o site e entre na área de login
    E eu informar o email
    Quando eu clicar em 'Entar'
    Então o site deve retornar a mensagem de alerta            Password é obrigatório