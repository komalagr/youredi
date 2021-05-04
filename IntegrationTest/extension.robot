*** Settings ***
Library           SeleniumLibrary
Variables         Variablesfile.yaml
*** Test Cases ***


TC16_Add Extension
    [Documentation]    Check user can add extension
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    click element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    #Select + on Organization
    sleep    2s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    # Select service
    wait until page contains element    class=fa-plug    timeout=${login.timeout}
    Click Element    class=fa-plug    #Click extension
    sleep    12s
    Click Element    class=fa-plus    # Click on Add
    Sleep    6s
    Input Text    name=extension.Name    Ext2    #Enter Extension name
    Click Element    xpath=//*[@id="webide"]/main/section/section/form/header/button[1]    #Click save
    Sleep    6s
    
TC17_Delete Extension
    [Documentation]    Check user can Delete extension if it is not associated to a process
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    click element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    #Select + on Organization
    sleep    2s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    # Select service
    wait until page contains element    class=fa-plug    timeout=${login.timeout}
    Click Element    class=fa-plug    #Click extension
    sleep    18s
    Wait Until Element Is Enabled    class=fa-remove    timeout=${login.timeout}
    click element    class=fa-remove    #Click delete
    Sleep    6s
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]/i    # Confirm deletion
    Sleep    6s
    [Teardown]    Close Browser

TC31_Bug8642_ExtensionCanotBeDeleted_IfUsedInProcess
    [Documentation]    Check Extension cannot be deleted if referenced by another process
    ...
    ...
    ...    Test Data Setup
    ...    1. Need Organization -- Name : Komal test organistaion
    ...    2. Need Service -- DemoService2
    ...
    ...    Extension should be added and it should be referenced by some process in the service
    [Setup]    Login
    Wait until page contains    text=Login successful. Welcome to Youredi!
    Click element    class=btn-primary
    Wait until page contains element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    timeout=${login.timeout}
    click element    xpath=/html/body/main/section/section/div/div[1]/div/p/a[1]/i    #Select + on Organization
    sleep    2s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[2]/div/p/a[2]    #Select Service
    Sleep    6s
    Wait until page contains element    class=fa-plug    timeout=${login.timeout}
    Click Element    class=fa-plug    #Click extension
    Wait Until page contains    text=Ext    timeout=${login.timeout}
    Sleep    18s
    Click element    class=fa-remove    #Click on Delete button
    Sleep    6s
    Click element    xpath=/html/body/div[4]/form/div/div[3]/span/button[1]/i    # Confirm deletion
    Wait until page contains    text=The extension cannot be deleted as it is being used in process    timeout=${login.timeout}
    Page should contain    text=The extension cannot be deleted as it is being used in process
    Sleep    2s
    [Teardown]    Close Browser

*** Keywords ***
Login
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in



