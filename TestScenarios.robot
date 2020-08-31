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
    
