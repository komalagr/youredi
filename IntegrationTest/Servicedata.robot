*** Settings ***
Library           SeleniumLibrary
Variables         Variablesfile.yaml
*** Test Cases ***

Dev_TC09_ServiceDataPage
    [Documentation]    Check Service data UI page
    ...
    ...
    ...    Test Data Setup
    ...    1. Need Organization -- Name : Komal test organistaion
    ...    2. Need Service -- DemoService2
    ...
    ...    Service data should be set with following values
    ...    ItemType2
    ...    Index1 as In2
    ...    Index2 as Dex2
    ...
    ...    Data as DataResult
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    15s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[2]/div/p/a[2]    #Select Service
    Sleep    16s
    Wait until page contains element    class=fa-cubes    timeout=${login.timeout}
    Click Element    class=fa-cubes    # click on Service data link
    Wait until page contains element    xpath=//*[@id="webide"]/main/section/section/form/header/button/i    timeout=16s
    Input Text    name=itemType    Type2    # enter item type
    Input Text    name=index1    In2    # enter index1
    Click Element    xpath=//*[@id="webide"]/main/section/section/form/header/button/i
    Wait until page contains    text=DataResult    timeout=${login.timeout}
    Page should contain    text=DataResult    # Service Data - Data should fe fetched
    Sleep    2s
    [Teardown]    Close Browser
