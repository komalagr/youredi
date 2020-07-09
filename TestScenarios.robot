*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
TC01_AddProcess
    [Documentation]    Check that If Process does not exist , it should get added successfully
    Open Browser    https://stage.youredi.com/    chrome
    Input Text    id=email    komal@youredi.com
    Input Password    id=password    $RJvT&Zd*Zzx0tW&R3r32$Pw
    Click Element    class=fa-sign-in
    Sleep    6s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    7s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Click Element    class=fa-object-group
    Sleep    6s
    Capture Page Screenshot
    Click Element    xpath=//*[@id="webide"]/main/section/section/header/button[1]
    Sleep    6s
    Input Text    name=processName    1Process
    Sleep    6s
    Capture Page Screenshot
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div/div[2]/form/button
    Sleep    8s
    Page should contain element    class=fa-play
    Capture Page screenshot

TC02_DeleteProcess_PositiveScenario
    [Documentation]    Check that user is able to delete the process
    Open Browser    https://stage.youredi.com/    chrome
    Input Text    id=email    komal@youredi.com
    Input Password    id=password    $RJvT&Zd*Zzx0tW&R3r32$Pw
    Click Element    class=fa-sign-in
    Sleep    6s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    8s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Click Element    class=fa-object-group
    Sleep    6s
    ${process}=    Get Text    xpath=//*[@id="webide"]/main/section/section/article/table/tbody/tr[1]/td[2]/a
    Capture Page Screenshot
    Click Element    xpath=//*[@id="webide"]/main/section/section/article/table/tbody/tr[1]/td[9]/div/button
    Sleep    6s
    Input Text    xpath=//*[@id="input-8"]    ${process}
    Sleep    10s
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]
    Sleep    10s
    Capture Page Screenshot
