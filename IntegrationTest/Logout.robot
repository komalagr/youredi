*** Settings ***
Library           SeleniumLibrary
Variables         Variablesfile.yaml
*** Test Cases ***
TC28-Logout
    [Documentation]    Check user can logout from the application
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    click element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    #Select + on Organization
    Click element    class=fa-cog    #Click on settings
    Sleep    2s
    Click element    xpath=//*[@id="webide"]/aside/div[2]/div/a[5]/i    # Click on Logout
    Handle Alert
    Wait until page contains    text=Please log in to access Youredi.    timeout=${login.timeout}
    Page should contain element    xpath=//*[@id="login"]/div/div[1]/div[2]/form/div[4]/div/button/i
    Sleep    2s
    [Teardown]    Close Browser

*** Keywords ***
Login
    Open Browser    ${login.url}    headlesschrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
