*** Settings ***
Library           SeleniumLibrary
Variables         DevVariablesfile.yaml
*** Test Cases ***

TC039_Transfer_FilterById
    [Documentation]    Check that user can filter transactions by id
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    15s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    click element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[1]/p/a[2]
    click element    xpath=//*[@id="webide"]/aside/div[1]/ul/li[2]/div/a/i
    sleep    4s
    Input text    xpath=/html/body/main/section/header/form/div[1]/div[5]/div[1]/div/input    12325597   
    sleep    6s
    click element    xpath=/html/body/main/section/header/form/div[2]/div[4]/div/button[2]/i
    click element    xpath=/html/body/main/section/header/form/div[2]/div[4]/div/button[1]/i
    Wait until page contains    text=12325597    timeout=${login.timeout}
    Page should not contain    text=11425361
    Page should contain    12325597
