*** Settings ***
Documentation                                Teste

Library                                      Browser


*** Keywords ***
Dado que eu acesse o site e entre na área de login
    Wait For Elements State            css=h1 >> text=Login            visible            5

E eu informar o email
    Fill Text                          id=email                        teste@qa.com

E informar a senha
    Fill Text                          id=password                     123456

Quando eu clicar em 'Entar'
    Click                              css=button >> text=Entrar 
Então serei direcionado para home do site
    Wait For Elements State            xpath=//a[text()="Home"]           visible            5
    Get Text                           xpath=//a[text()="Home"]           equal              Home

E eu informar o email incorreto
    Fill Text                          id=email                        teste100000@qa.com

E informar a senha incorreta
    Fill Text                          id=password                     10000000

##########  Mensagens de erro  ##########
Então o site deve retornar a mensagem de alerta
    [Arguments]                        ${expected_text}

    ${element}                         Set Variable                    xpath=//span[text()="${expected_text}"]

    Wait For Elements State            ${element}                      visible            5
    Get Text                           ${element}                      equal              ${expected_text}


Então o site deve retornar duas mensagens de alerta
    [Arguments]                        ${expected_text1}                ${expected_text2}

    ${element1}                         Set Variable                    xpath=//span[text()="${expected_text1}"]
    ${element2}                         Set Variable                    xpath=//span[text()="${expected_text2}"] 


    Wait For Elements State            ${element1}                      visible            5
    Get Text                           ${element1}                      equal              ${expected_text1}            

    Wait For Elements State            ${element2}                      visible            5
    Get Text                           ${element2}                      equal              ${expected_text2}           