*** Settings ***
Documentation                                Teste

Library                                      Browser
Library                                      libs/Account.py

Resource                                     pagesObjects/CadastroPage.robot


*** Keywords ***
Star Session
    New Browser                    browser=chromium              headless=False                args=["--start-maximized"]
    New Context                    viewport=${None}
    New Page                       https://front.serverest.dev/login