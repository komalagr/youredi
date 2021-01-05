*** Settings ***
Library           SeleniumLibrary
Variables         variablesfile.yaml
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
    Wait until page contains    text=Organizations    timeout=18s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[2]/div/p/a[2]    #Select Service
    Sleep    4s
    Click Element    xpath=//*[@id="webide"]/aside/div[1]/ul/li[14]/a/i    # click on Service data link
    Wait until page contains element    xpath=//*[@id="webide"]/main/section/section/form/header/button/i    timeout=16s
    Input Text    name=itemType    Type2    # enter item type
    Input Text    name=index1    In2    # enter index1
    Input Text    name=index2    Dex2    # enter index 2
    Click Element    xpath=//*[@id="webide"]/main/section/section/form/header/button/i
    Wait until page contains    text=DataResult    timeout=16s
    Page should contain    text=DataResult    # Service Data - Data should fe fetched
    close browser

Dev_TC44_ServiceDataPage_Index2NotMandatory
    [Documentation]    Check that index2 is not mandatory on Service data page
    ...
    ...
    ...    Test Data Setup
    ...    1. Need Organization -- Name : Komal test organistaion
    ...    2. Need Service -- DemoService2
    ...
    ...    Service data with Item Type as Type2 and Index1 as In2
    ...    Data should be DataResult
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=18s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[2]/div/p/a[2]
    Sleep    4s
    Click Element    xpath=//*[@id="webide"]/aside/div[1]/ul/li[14]/a/i    #Click on service data
    Wait until page contains element    xpath=//*[@id="webide"]/main/section/section/form/header/button/i    timeout=16s
    Input Text    name=itemType    Type2
    Input Text    name=index1    In2
    Click Element    xpath=//*[@id="webide"]/main/section/section/form/header/button/i
    Wait until page contains    text=DataResult    timeout=18s
    Page should contain    text=DataResult

