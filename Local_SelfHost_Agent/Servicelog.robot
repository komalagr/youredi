*** Settings ***
Library           SeleniumLibrary
Variables         Variablesfile.yaml
*** Test Cases ***

TC25-Logs-information
    [Documentation]    Check user can Filter Logs by information
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Sleep    3s
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    click element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    #Select + on Organization
    Sleep    4s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    #Select Service
    Click Element    class=fa-info-circle    #Click on Service log
    Sleep    6s
    Input text    xpath=/html/body/main/section/section/header/form/div[1]/div[4]/div/div/input    hii
    sleep    4s
    wait until page does not contain    text=hello    timeout=${login.timeout}
    Page should not contain    text=hello
    page should contain    text=hii
    Sleep    2s
    [Teardown]    Close Browser

*** Keywords ***
Login
    Open Browser    ${login.url}    headlesschrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
