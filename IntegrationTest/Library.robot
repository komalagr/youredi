*** Settings ***
Library           SeleniumLibrary
Variables         Variablesfile.yaml
*** Test Cases ***

TC17_Add Library
    [Documentation]    Check user can add Library
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    click element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    #Select + on Organization
    Sleep    6s
    wait until page contains element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    #Select Service
    Sleep    4s
    wait until page contains element    class=fa-book    timeout=${login.timeout}
    Click Element    class=fa-book    #Click on Library
    Sleep    4s
    Click Element    class=fa-plus    #Click on Add
    Wait until page contains    text=// You can define static functions and variables that will be available in all steps.    timeout=${login.timeout}
    Input Text    name=Name    Default1    #Enter Library Name
    Click element    xpath=//*[@id="webide"]/main/section/section/form/header/button/i    #Click Save
    Wait until page contains    text=Default1    timeout=${login.timeout}
    Element should be Enabled    class=fa-refresh    #Click refresh.
    Sleep    2s
    [Teardown]    Close Browser

TC18_Delete Library
    [Documentation]    Check user can delete library
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    click element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    #Select + on Organization
    Sleep    6s
    wait until page contains element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    #Select Service
    Sleep    4s
    wait until page contains element    class=fa-book    timeout=${login.timeout}
    Click Element    class=fa-book    #Click on Library
    Sleep    4s
    Click Element    xpath=//*[@id="webide"]/main/section/section/form/header/div/button/i    #Click on delete
    Sleep    4s
    Click element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]/i    #Confirm deletion
    Wait until page does not contain    text=Default1    timeout=${login.timeout}
    Sleep    2s
    [Teardown]    Close Browser





*** Keywords ***
Login
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in



