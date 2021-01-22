*** Settings ***
Library           SeleniumLibrary
Variables         DevVariablesfile.yaml
*** Test Cases ***

Dev_TC25-Logs-information
    [Documentation]    Check user can Filter Logs by information
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=18s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Click Element    class=fa-info-circle
    sleep    6s
    Input text    name=filterInformation    hii
    sleep    4s    timeout=18s
    Page should not contain    text=hello
    page should contain    text=hii
