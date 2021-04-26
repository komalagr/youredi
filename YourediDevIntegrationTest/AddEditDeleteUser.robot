*** Settings ***
Library           SeleniumLibrary
Variables         Variablesfile.yaml
*** Test Cases ***

Dev_TC34_AddUserToOrganization
    [Documentation]    Check we can add User to Organisation
    ...
    ...    Test data setup
    ...    Komal test organisation
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    21s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    click element    xpath=//*[@id="webide"]/main/section/section/div/div[2]/div[1]/p/a[2]
    Sleep    6s
    Click element    xpath=//*[@id="webide"]/aside/div[1]/ul/li[1]/span[2]/a/i
    Click element    xpath=//*[@id="webide"]/main/section/section/section/section/header/button[1]/i
    wait until page contains    text=Add user    timeout=${login.timeout}
    Input Text    xpath=/html/body/main/section/section/section/section/div/div/div[2]/form/div/div/input    aryan@youredi.com
    Click element    xpath=//*[@id="webide"]/main/section/section/section/section/div/div/div[2]/form/div/div/span/span/button/i
    Sleep    11s
    Click element    xpath=//*[@id="webide"]/main/section/section/section/section/div/div/div[2]/form/div[2]/button/i
    sleep    4s
    Click element    xpath=//*[@id="webide"]/main/section/section/section/form/header/button/i
    sleep    4s
    Close Browser
    
Dev_TC36_EditUserRoleInOrganization
    [Documentation]    Check that we can edit role for the user for organisation
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    21s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    click element    xpath=//*[@id="webide"]/main/section/section/div/div[2]/div[1]/p/a[2]
    Sleep    6s
    Click element    xpath=//*[@id="webide"]/aside/div[1]/ul/li[1]/span[2]/a/i
    sleep    4s
    Select from list by value    name=Role    Designer
    Wait until page contains    text=Designer    timeout=${login.timeout}
    Click element    xpath=//*[@id="webide"]/main/section/section/section/form/header/button/i
    sleep    4s
    Close Browser
    
Dev_TC35_DeleteUserFromOrganization
    [Documentation]    check that we can delete user from organisation
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    21s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    click element    xpath=//*[@id="webide"]/main/section/section/div/div[2]/div[1]/p/a[2]
    Sleep    6s
    Click element    xpath=//*[@id="webide"]/aside/div[1]/ul/li[1]/span[2]/a/i
    Sleep    4s
    Click element    xpath=//*[@id="webide"]/main/section/section/section/form/header/div/button/i
    Sleep    4s
    Click element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]/i
    Wait until page does not contain    text=Aryan    timeout=${login.timeout}
    Page should not contain    text=Aryan
    Sleep    4s
    Close Browser
