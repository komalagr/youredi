*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
TC01_AddProcess
    [Documentation]    Check that If Process does not exist , it should get added successfully
    ...
    ...    Test Data Setup
    ...    1. Need Organization Name : Komal test organistaion
    ...    2. Need Service -- DemoService
    Open Browser    https://stage.youredi.com/    chrome
    Input Text    id=email    komal@youredi.com
    Input Password    id=password    $RJvT&Zd*Zzx0tW&R3r32$Pw
    Click Element    class=fa-sign-in
    Sleep    6s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    7s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    # Selects Service
    Click Element    class=fa-object-group    #Click Processes
    Sleep    6s
    Capture Page Screenshot
    Click Element    xpath=//*[@id="webide"]/main/section/section/header/button[1]    #Clicks Add Process button
    Sleep    6s
    Input Text    name=processName    1Process    #Provide new process name
    Sleep    6s
    Capture Page Screenshot
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div/div[2]/form/button    #Click Save
    Sleep    8s
    Page should contain element    class=fa-play    #New process page should be displayed with Start button
    Capture Page screenshot
    close browser
    
TC02_DeleteProcess_PositiveScenario
    [Documentation]    Check that user is able to delete the process if process name entered on Delete pop up window is correct
    ...
    ...    Test data setup
    ...    Need process- 1Process added to DemoService in Komal test organistaion
    Open Browser    https://stage.youredi.com/    chrome
    Input Text    id=email    komal@youredi.com
    Input Password    id=password    $RJvT&Zd*Zzx0tW&R3r32$Pw
    Click Element    class=fa-sign-in
    Sleep    6s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    8s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Click Element    class=fa-object-group    # Clicks Processes
    Sleep    6s
    ${process}=    Get Text    xpath=//*[@id="webide"]/main/section/section/article/table/tbody/tr[1]/td[2]/a    #Gets name of the process that will be deleted
    Capture Page Screenshot
    Click Element    xpath=//*[@id="webide"]/main/section/section/article/table/tbody/tr[1]/td[9]/div/button    #Click delete
    Sleep    6s
    Input Text    xpath=//*[@id="input-8"]    ${process}    #Enter process name on delete pop up window
    Sleep    10s
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]
    Sleep    10s
    Capture Page Screenshot
    close browser


TC16_Add And Delete Extension
    [Documentation]    Check user add and Delete extension if it is not associated to a process
    Open Browser    https://stage.youredi.com/    chrome
    Input Text    id=email    komal@youredi.com
    Input Password    id=password    $RJvT&Zd*Zzx0tW&R3r32$Pw
    Click Element    class=fa-sign-in
    Sleep    9s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    7s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    sleep    6s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    # Select service
    Click Element    class=fa-plug    #Click extension
    Sleep    6s
    Capture Page screenshot
    Click Element    xpath=//*[@id="webide"]/main/section/section/section/header/button[1]/i    # Click on Add
    Sleep    6s
    Input Text    name=extension.Name    Ext2    #Enter Extension name
    Sleep    6s
    Capture Page Screenshot
    Click Element    xpath=//*[@id="webide"]/main/section/section/form/header/button[1]    #Click save
    sleep    6s
    Capture Page Screenshot
    click element    xpath=//*[@id="webide"]/main/section/section/form/header/div/button/i    #Click delete
    Sleep    6s
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]/i    # Confirm deletion
    Sleep    6s
    Capture Page screenshot
    close browser


TC44_ServiceDataPage_Index2NotMandatory
    [Documentation]    Check that index2 is not mandatory on Service data page
    Open Browser    https://stage.youredi.com/    chrome
    Input Text    id=email    komal@youredi.com
    Input Password    id=password    $RJvT&Zd*Zzx0tW&R3r32$Pw
    Click Element    class=fa-sign-in
    Sleep    6s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    8s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[2]/div/p/a[2]
    Sleep    6s
    Click Element    xpath=//*[@id="webide"]/aside/div[1]/ul/li[14]/a/i
    Sleep    6s
    Capture Page Screenshot
    Input Text    name=itemType    Type2
    Input Text    name=index1    In2
    Click Element    xpath=//*[@id="webide"]/main/section/section/form/header/button/i
    Sleep    6s
    capture page screenshot
    Page should contain    text=Data
    
TC51_Check If binding is not active process should not get executed
    [Documentation]    Check if the endpoint binding is not active, process should not get executed.An error message should be displayed
    ...
    ...
    ...    Test Data Setup
    ...    1. Need Organization Name : Komal test organistaion
    ...    2. Need Service -- DemoService
    ...    3 Process name binding whose endpoint binding is not marked active
    Open Browser    https://stage.youredi.com/    chrome
    Input Text    id=email    komal@youredi.com
    Input Password    id=password    $RJvT&Zd*Zzx0tW&R3r32$Pw
    Click Element    class=fa-sign-in
    Sleep    8s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    8s
    Click element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Sleep    6s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[2]/div/p/a[2]    #Select service
    Sleep    6s
    Click element    class=fa-object-group    #Click on Processes
    Sleep    9s
    click element    xpath=//*[@id="webide"]/main/section/section/article/table/tbody/tr[1]/td[2]/a    #Select Binding process
    Sleep    6s
    click element    xpath=//*[@id="webide"]/main/section[1]/header/div/button/i    #click start
    sleep    9s
    click element    xpath=//*[@id="webide"]/main/section[1]/div[1]/div[1]/div[1]/div/button[1]/i    #click start
    sleep    9s
    Page should contain    text=Process not found using given account    #error message shouldbe present
    capture page screenshot

