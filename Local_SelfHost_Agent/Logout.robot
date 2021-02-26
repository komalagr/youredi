*** Settings ***
Library           SeleniumLibrary
Variables         variables.yaml
*** Test Cases ***

Dev_TC28-Logout
    [Documentation]    Check user can logout from the application
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=18s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[2]/div/p/i
    Click element    class=fa-cog
    Click element    xpath=//*[@id="webide"]/aside/div[2]/div/a[5]/i
    Handle Alert
    Wait until page contains    text=Please log in to access Youredi.    timeout=18s
    Page should contain element    xpath=//*[@id="login"]/div/div[1]/div[2]/form/div[4]/div/button/i
