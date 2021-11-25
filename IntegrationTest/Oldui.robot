*** Settings ***
Library           SeleniumLibrary
Variables         Variablesfile.yaml

*** Test Cases ***

TC01_LoginOldUI
    Open Browser    https://oldui-stage.youredi.com/Login.aspx    headlesschrome
    Input Text    xpath=/html/body/div/form/div[6]/p[1]/input    ${login.email}
    Input Text    xpath=/html/body/div/form/div[6]/p[2]/input    ${login.password}
    Click element    xpath=/html/body/div/form/div[6]/input
    Sleep    6s
    Page should contain element    id=logout
    [Teardown]    Close Browser
    

