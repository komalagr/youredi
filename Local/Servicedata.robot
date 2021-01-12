*** Settings ***
Library           SeleniumLibrary
Variables         DevVariablesfile.yaml
*** Test Cases ***


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
    Sleep    11s
    Click Element    xpath=//*[@id="webide"]/aside/div[1]/ul/li[14]/a/i    #Click on service data
    Wait until page contains element    xpath=//*[@id="webide"]/main/section/section/form/header/button/i    timeout=30s
    Input Text    name=itemType    Type2
    Input Text    name=index1    In2
    Click Element    xpath=//*[@id="webide"]/main/section/section/form/header/button/i
    Wait until page contains    text=DataResult    timeout=30s
    Page should contain    text=DataResult

