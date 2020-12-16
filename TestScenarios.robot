*** Settings ***
Library           SeleniumLibrary
Variables         variablesfile.yaml
*** Test Cases ***
Dev_TC12_AddCrossReference_Positive
   [Documentation]    Check user can add Cross reference key on UI
    ...
    ...    Test Data Setup
    ...    1. Need Organization -- Name : Komal test organistaion
    ...    2. Need Service -- DemoService2
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    12s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[2]/div/p/a[2]
    Sleep    11s
    Click Element    class=fa-table    # click on cross reference
    Sleep    12s
    Capture Page screenshot
    Click Element    xpath=//*[@id="webide"]/main/section/section/section[1]/header/button[1]    # click on add cross reference table
    Sleep    11s
    Input Text    name=newTableName    Table1    # Add a table name
    Sleep    11s
    capture page screenshot
    click element    xpath=//*[@id="webide"]/div[5]/form/div/div[3]/div/button[1]
    sleep    12s
    Input Text    name=crossReference.Key    key1122
    Sleep 12s
    Execute javascript    _editor = document.querySelectorAll("div.CodeMirror")[0].CodeMirror;    _editor.setValue("Value for Key1122")
    Sleep    5s
    Capture Page Screenshot
    Click element    xpath=//*[@id="webide"]/main/section/section/section[2]/form[1]/header/button
    sleep    6s
    Capture Page Screenshot
    close browser

Dev_TC13_Delete_CrossReferenceKey
    [Documentation]    Check user can delete Cross reference key on UI
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    12s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    12s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[2]/div/p/a[2]
    Sleep    11s
    Click Element    class=fa-table    #Click on Cross Reference
    Sleep    11s
    Capture Page screenshot
    Click Element    xpath=//*[@id="webide"]/main/section/section/section[2]/form[1]/header/div/button/i
    Sleep   11s
    Capture Page Screenshot
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]
    Sleep    6s
    Capture Page Screenshot
    Click element    xpath=//*[@id="webide"]/main/section/section/section[1]/header/button[2]
    sleep    6s
    Capture Page Screenshot
    close browser
