*** Settings ***
Library           SeleniumLibrary
Variables         Variablesfile.yaml
*** Test Cases ***

TC25-Logs-information
    [Documentation]    Check user can Filter Logs by information
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    click element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    #Select + on Organization
    Sleep    2s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    #Select Service
    Click Element    class=fa-info-circle    #Click on Service log
    Wait until page contains    text=Executing Branch 1    timeout=${login.timeout}
    Sleep    2s
    Input text    xpath=/html/body/main/section/section/header/form/div[1]/div[4]/div/div/input    hii
    sleep    4s
    wait until page does not contain    text=hello    timeout=${login.timeout}
    Page should not contain    text=hello
    page should contain    text=hii
    Sleep    2s
    [Teardown]    Close Browser

*** Keywords ***
Login
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
