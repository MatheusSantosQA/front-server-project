*** Settings ***
Documentation                                Teste

Library                                      Browser

Resource                                     ../resources/base.robot

Test Setup                                   Star Session
Test Teardown                                Take Screenshot


*** Test Cases ***
Acessar página principal
    Wait For Elements State                css=h1 >> text=Login                    visible                5