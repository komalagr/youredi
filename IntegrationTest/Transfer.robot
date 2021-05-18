*** Settings ***
Library           SeleniumLibrary
Variables         Variablesfile.yaml
*** Test Cases ***

TC039_Transfer_FilterById
    [Documentation]    Check that user can filter transactions by id
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    click element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    #Select + on Organization
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div[1]/p/a[2]    timeout=${login.timeout}
    click element    xpath=/html/body/main/section/section/div/div[1]/div[1]/p/a[2]    #click on Service
    click element    xpath=//*[@id="webide"]/aside/div[1]/ul/li[2]/div/a/i    #click on transfer
    sleep    4s
    Input text    xpath=/html/body/main/section/header/form/div[1]/div[5]/div[1]/div/input    ${login.transferid}
    sleep    6s
    click element    xpath=/html/body/main/section/header/form/div[2]/div[4]/div/button[2]/i
    click element    xpath=/html/body/main/section/header/form/div[2]/div[4]/div/button[1]/i
    Wait until page contains    text=${login.transferid}    timeout=${login.timeout}
    Page should not contain    text=11425361
    Page should contain    ${login.transferid}
    Sleep    2s
    [Teardown]    Close Browser
    
    
*** Keywords ***
Login
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
