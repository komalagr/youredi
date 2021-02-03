*** Settings ***
Library           SeleniumLibrary
Variables         DevVariablesfile.yaml
*** Test Cases ***

TC16_Add Extension
    [Documentation]    Check user can add extension 
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=18s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    # Select service
    wait until page contains element    class=fa-plug    timeout=18s
    Click Element    class=fa-plug    #Click extension
    sleep    12s
    Click Element    class=fa-plus    # Click on Add
    Sleep    6s
    Input Text    name=extension.Name    Ext2    #Enter Extension name
    Click Element    xpath=//*[@id="webide"]/main/section/section/form/header/button[1]    #Click save
    close browser
    
TC17_Delete Extension
    [Documentation]    Check user can Delete extension if it is not associated to a process
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=18s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    # Select service
    wait until page contains element    class=fa-plug    timeout=18s
    Click Element    class=fa-plug    #Click extension
    sleep    12s
    Wait Until Element Is Enabled    class=fa-remove    timeout=30s
    click element    class=fa-remove    #Click delete
    Sleep    4s
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]/i    # Confirm deletion
    close browser


TC31_Bug8642_ExtensionCanotBeDeleted_IfUsedInProcess
    [Documentation]    Check Extension cannot be deleted if referenced by another process
    ...
    ...
    ...    Test Data Setup
    ...    1. Need Organization -- Name : Komal test organistaion
    ...    2. Need Service -- DemoService2
    ...
    ...    Extension should be added and it should be referenced by some process in the service
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    18s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=18s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[2]/div/p/a[2]    #Select Service
    Sleep    6s
    Wait until element is visible    class=fa-plug    timeout=30s
    Click Element    xpath=//*[@id="webide"]/aside/div[1]/ul/li[10]/a/i    # click on Extension link
    Wait Until page contains    text=Ext    timeout=25s
    Sleep    11s
    Click element    class=fa-remove    #Click on Delete button
    Sleep    6s
    Click element    xpath=/html/body/div[4]/form/div/div[3]/span/button[1]/i    # Confirm deletion
    Wait until page contains    text=The extension cannot be deleted as it is being used in process
    Page should contain    text=The extension cannot be deleted as it is being used in process    timeout=25s
    close browser
