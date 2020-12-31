*** Settings ***
Library           SeleniumLibrary
Variables         DevVariablesfile.yaml
*** Test Cases ***


Dev_TC17_Add Library
    [Documentation]    Check user can add Library
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=18s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select organization
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    #Select Service
    Click Element    class=fa-book    #Click on Library
    Sleep    4s
    Click Element    class=fa-plus    #Click on Add
    Wait until page contains    text=// You can define static functions and variables that will be available in all steps.    timeout=18s
    Input Text    name=Name    Default1    #Enter Library Name
    Click element    xpath=//*[@id="webide"]/main/section/section/form/header/button/i    #Click Save
    Wait until page contains    text=Default1    timeout=18s
    Element should be Enabled    class=fa-refresh    #Click refresh
    close browser

Dev_TC18_Delete Library
    [Documentation]    Check user can delete library
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=18s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i    #Select Organization
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]    #Select Service
    Click Element    class=fa-book    #Click on Library
    Sleep    4s
    Click Element    xpath=//*[@id="webide"]/main/section/section/form/header/div/button/i    #Click on delete
    Sleep    4s
    Click element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]/i    #Confirm deletion
    Wait until page does not contain    text=Default1    timeout=18s
    close browser
