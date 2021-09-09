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
    Sleep    18s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[2]/div/p/a[2]
    sleep    18s
    Wait until element is visible    class=fa-table    timeout=${login.timeout}
    Click Element    class=fa-table    # click on cross reference
    sleep    25s
    Wait until page contains    text=Table20    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/section[1]/header/button[1]    # click on add cross reference table
    sleep    4s
    Input Text    name=newTableName    Table1    # Add a table name
    click element    xpath=//*[@id="webide"]/div[5]/form/div/div[3]/div/button[1]    #click add key
    Wait until page contains    text=Table20    timeout=${login.timeout}
    Sleep    2s
    Input Text    xpath=/html/body/main/section/section/section[2]/form[1]/article/div/div[1]/div/input    key1122
    Execute javascript    _editor = document.querySelectorAll("div.CodeMirror")[0].CodeMirror;    _editor.setValue("Value for Key1122")
    Sleep    5s
    Click element    xpath=//*[@id="webide"]/main/section/section/section[2]/form[1]/header/button
    Sleep    8s
    

Dev_TC13_Delete_CrossReferenceKey
    [Documentation]    Check user can delete Cross reference key on UI
    Open Browser    ${login.url}    chrome
    Input Text    id=email    ${login.email}
    Input Password    id=password    ${login.password}
    Click Element    class=fa-sign-in
    Sleep    21s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Wait until page contains    text=Organizations    timeout=${login.timeout}
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[2]/div/p/a[2]
    sleep    25s
    Wait until element is visible    class=fa-table    timeout=${login.timeout}
    Click Element    class=fa-table    #Click on Cross Reference
    Sleep    2s
    Click Element    xpath=//*[@id="webide"]/main/section/section/section[2]/form[1]/header/div/button/i
    Sleep    2s
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]
    Sleep    2s
    Click element    xpath=//*[@id="webide"]/main/section/section/section[1]/header/button[2]
    Sleep    2s
