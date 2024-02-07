*** Settings ***
Documentation                                Teste

Library                                      Browser


*** Keywords ***
######## Validar acesso a página #######
Dado que eu acesse a página de cadastro
    Click                              xpath=//a[text()="Cadastre-se"]        
    Wait For Elements State            css=h2 >> text=Cadastro            visible            5

######## Inserção de dados para cdastro #######
E insiro meu nome completo
    [Arguments]                        ${account}

    Fill Text                          id=nome                            ${account}[name]
E insiro meu email
    [Arguments]                        ${account}

    Fill Text                          id=email                           ${account}[email]
E insiro minha senha
    [Arguments]                        ${account}

    Fill Text                          id=password                        ${account}[password]

######## Confirmar cadastro #######
Quando eu clicar em "Cadastrar"
    Click                              css=button >> text=Cadastrar

######## Validar cadastro e redirecionamento para o ste #######
Então devo ser cadastrado e enviado para a página inicial do site
    Wait For Elements State            xpath=//a[text()="Home"]           visible            5
    Get Text                           xpath=//a[text()="Home"]           equal              Home

######## Checkbox admin #######
E informo cadastro como administrador na checkbox
    Click                              id=administrador


Então o site deve retornar a mensagem de email já utilizado
    ${message}                         Set Variable                                           Este email já está sendo usado

    Wait For Elements State            xpath=//span[text()="${message}"]                      visible            5
    Get Text                           xpath=//span[text()="${message}"]                      equal              ${message}