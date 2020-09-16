*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url}            https://dev.youredi.com/
${password}       N9ScmaA$BRDalQbm$Gn9XmNZKcQ!
${email}          komal@youredi.com


*** Test Cases ***

Test_TC25-Logs-information
    [Documentation]    Check user can Filter Logs by information
    Open Browser    ${url}    chrome
    Input Text    id=email    ${email}
    Input Password    id=password    ${password}
    Click Element    class=fa-sign-in
    Sleep    6s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    7s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Click Element    class=fa-info-circle
    Sleep    6s
    capture page screenshot
    Input text    name=filterInformation    hii
    Sleep    7s
    Capture page Screenshot
    Page should not contain    text=hello
    page should contain    text=hii
    close browser

Test_TC34_AddUserToOrganization
    [Documentation]    Check we can add User to Organisation
    ...
    ...    Test data setup
    ...    Komal test organisation
    Open Browser    ${url}    chrome
    Input Text    id=email    ${email}
    Input Password    id=password    ${password}
    Click Element    class=fa-sign-in
    Sleep    9s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    6s
    click element    xpath=//*[@id="webide"]/main/section/section/div/div[2]/div[1]/p/a[2]
    Sleep    6s
    Click element    xpath=//*[@id="webide"]/aside/div[1]/ul/li[1]/span[2]/a/i
    Click element    xpath=//*[@id="webide"]/main/section/section/section/section/header/button[1]/i
    Sleep    9s
    Input Text    xpath=/html/body/main/section/section/section/section/div/div/div[2]/form/div/div/input    aryan@youredi.com
    Sleep    9s
    Click element    xpath=//*[@id="webide"]/main/section/section/section/section/div/div/div[2]/form/div/div/span/span/button/i
    Sleep    9s
    Click element    xpath=//*[@id="webide"]/main/section/section/section/section/div/div/div[2]/form/div[2]/button/i
    sleep    9s
    capture page screenshot
    Click element    xpath=//*[@id="webide"]/main/section/section/section/form/header/button/i
    sleep    6s
    capture page screenshot

