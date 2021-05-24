*** Settings ***
Library           SeleniumLibrary
Variables         Variablesfile.yaml
*** Test Cases ***

TC10_AddServiceParameter_Positive
    [Documentation]    Check user can add Service parameter on Parameter UI page
    ...
    ...
    ...    Test Data Setup
    ...    1. Need Organization -- Name : Komal test organistaion
    ...    2. Need Service -- DemoService
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    click element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    #Select + on Organization
    Sleep    6s
    Wait until page contains element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    #Select Service
    Wait until page contains element    class=fa-cogs    timeout=${login.timeout}
    Click Element    class=fa-cogs    # Click on Parameters link
    Wait until page contains element    xpath=//*[@id="webide"]/main/section/section/section/header/button[1]    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/section/header/button[1]    # click on Add parameter
    Sleep    4s
    Input Text    name=ID    1parameter    # enter parameter name
    Execute javascript    _editor = document.querySelectorAll("div.CodeMirror")[0].CodeMirror;    _editor.setValue("Value for Key1")    # set value for parameter
    Sleep    5s
    Click element    xpath=//*[@id="webide"]/main/section/section/form/header/div[1]/button    # click save button
    Wait until page contains    text=1parameter    timeout=${login.timeout}
    Click element    xpath=//*[@id="webide"]/main/section/section/section/header/button[2]/i    # click refresh
    Wait until page contains    text=1parameter    timeout=${login.timeout}
    Page should contain    text=1parameter    # check that page should display new parameter added
    Sleep    2s
    [Teardown]    Close Browser

TC11_DeleteParameter
    [Documentation]    Check user can delete service parameter
    ...
    ...    Test Data Setup
    ...    1. Need Organization -- Name : Komal test organistaion
    ...    2. Need Service -- DemoService
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!    timeout=${login.timeout}
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    click element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    #Select + on Organization
    Sleep    6s
    Wait until page contains element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    # select service
    Sleep    4s
    Wait until page contains element    class=fa-cogs    timeout=46s
    Click Element    class=fa-cogs    # click on paramters
    Sleep    6s
    Click Element    xpath=//*[@id="webide"]/main/section/section/form/header/div[2]/button/i    # click on delete button
    Sleep    4s
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]/i    # confirm deletion
    Wait until page does not contain    text=1parameter    timeout=16s
    Sleep    2s
    [Teardown]    Close Browser


*** Keywords ***
Login
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
