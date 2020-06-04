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

TC03_DeleteProcess_ProcessNameIncorect
    [Documentation]    Check that delete button should not be active if On delete window,process name entered is incorrect
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
    Click Element    xpath=//*[@id="webide"]/main/section/section/article/table/tbody/tr[1]/td[9]/div/button
    Sleep    6s
    Input Text    xpath=//*[@id="input-8"]    8134 Bug
    Sleep    10s
    Element Should Be Disabled    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]
    Capture Page Screenshot

TC04_DeleteProcess_Cancel
    [Documentation]    Check that user if User clicks on cancel button on Delete process page, then process should not get deleted
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
    Capture Page Screenshot
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[2]
    Sleep    10s
    Capture Page Screenshot

TC05_DeleteEndpoint_Positive
    [Documentation]    Check that If endpoint is not assoicated to a process, then it should get deleted
    Open Browser    https://stage.youredi.com/    chrome
    Input Text    id=email    komal@youredi.com
    Input Password    id=password    $RJvT&Zd*Zzx0tW&R3r32$Pw
    Click Element    class=fa-sign-in
    Sleep    6s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    8s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Click Element    class=fa-lightbulb-o
    Sleep    6s
    Capture Page screenshot
    Click Element    xpath=//*[@id="webide"]/main/section/section/form/header/div/button
    Sleep    6s
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]
    Sleep    6s
    Capture Page Screenshot

TC06_AddProcess_Negative_ProcessAlreadyExist
    [Documentation]    Check that process should not get added if Process name or endpoint name already exist
    Open Browser    https://stage.youredi.com/    chrome
    Input Text    id=email    komal@youredi.com
    Input Password    id=password    $RJvT&Zd*Zzx0tW&R3r32$Pw
    Click Element    class=fa-sign-in
    Sleep    6s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    sleep    8s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Click Element    class=fa-object-group
    Sleep    6s
    Capture Page screenshot
    Click Element    xpath=//*[@id="webide"]/main/section/section/header/button[1]
    Sleep    6s
    Input Text    name=processName    ProcessNew12121
    Sleep    6s
    Capture page screenshot
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div/div[2]/form/button
    Sleep    6s
    Page should not contain element    class=fa-play
    Capture Page screenshot

TC07_DeleteEndpoint_Negative_EndpointAssociatedToProcess
    [Documentation]    Check that If endpoint is associated to a process it should not get deleted
    Open Browser    https://stage.youredi.com/    chrome
    Input Text    id=email    komal@youredi.com
    Input Password    id=password    $RJvT&Zd*Zzx0tW&R3r32$Pw
    Click Element    class=fa-sign-in
    Sleep    6s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    8s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Click Element    class=fa-lightbulb-o
    Sleep    6s
    Capture Page screenshot
    Click Element    xpath=//*[@id="webide"]/main/section/section/form/header/div/button
    Sleep    6s
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]
    Sleep    6s
    Capture Page Screenshot
    Page Should contain    text=Errors

TC08_AddEndpoint_Positive
    [Documentation]    Check user can add endpoint
    Open Browser    https://stage.youredi.com/    chrome
    Input Text    id=email    komal@youredi.com
    Input Password    id=password    $RJvT&Zd*Zzx0tW&R3r32$Pw
    Click Element    class=fa-sign-in
    Sleep    6s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    7s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Click Element    class=fa-lightbulb-o
    Sleep    6s
    Capture Page screenshot
    Click Element    xpath=//*[@id="webide"]/main/section/section/section/header/button[1]/i
    Sleep    6s
    Input text    name=Description    13Process
    click element    xpath=//*[@id="webide"]/main/section/section/form/header/button
    Sleep    6s
    Click Element    xpath=//*[@id="webide"]/main/section/section/section/header/button[2]

TC09_ServiceDataPage
    [Documentation]    Check Service data UI page
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
    Input Text    name=index2    Dex2
    Click Element    xpath=//*[@id="webide"]/main/section/section/form/header/button/i
    Sleep    6s
    capture page screenshot
    Page should contain     text=Data2

TC10_AddServiceParameter_Positive
    [Documentation]    Check user can add Service parameter on Parameter UI page
    Open Browser    https://stage.youredi.com/    chrome
    Input Text    id=email    komal@youredi.com
    Input Password    id=password    $RJvT&Zd*Zzx0tW&R3r32$Pw
    Click Element    class=fa-sign-in
    Sleep    6s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    7s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Click Element    class=fa-cogs
    Sleep    6s
    Capture Page screenshot
    Click Element    xpath=//*[@id="webide"]/main/section/section/section/header/button[1]
    Sleep    6s
    Input Text    name=ID    1parameter
    Execute javascript    _editor = document.querySelectorAll("div.CodeMirror")[0].CodeMirror;    _editor.setValue("Value for Key1")
    Sleep    5s
    Capture Page Screenshot
    Click element    xpath=//*[@id="webide"]/main/section/section/form/header/div[1]/button
    sleep    6s
    Capture Page Screenshot
    Click element    xpath=//*[@id="webide"]/main/section/section/section/header/button[2]/i

TC11_DeleteParameter
    [Documentation]    Check user can delete service parameter
    Open Browser    https://stage.youredi.com/    chrome
    Input Text    id=email    komal@youredi.com
    Input Password    id=password    $RJvT&Zd*Zzx0tW&R3r32$Pw
    Click Element    class=fa-sign-in
    Sleep    6s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    7s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Click Element    class=fa-cogs
    Sleep    6s
    Capture Page screenshot
    Click Element    xpath=//*[@id="webide"]/main/section/section/form/header/div[2]/button/i
    Sleep    6s
    Capture page screenshot
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]/i
    Sleep    6s
    Capture Page Screenshot

TC12_AddCrossReference_Positive
    [Documentation]    Check user can add Cross reference on UI
    Open Browser    https://stage.youredi.com/    chrome
    Input Text    id=email    komal@youredi.com
    Input Password    id=password    $RJvT&Zd*Zzx0tW&R3r32$Pw
    Click Element    class=fa-sign-in
    Sleep    6s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    7s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Click Element    class=fa-table
    Sleep    6s
    Capture Page screenshot
    Click Element    xpath=//*[@id="webide"]/main/section/section/section[1]/header/button[1]
    Sleep    6s
    Input Text    name=newTableName    Table1
    Sleep    6s
    capture page screenshot
    click element    xpath=//*[@id="webide"]/div[5]/form/div/div[3]/div/button[1]
    sleep    6s
    Input Text    name=crossReference.Key    key1122
    Execute javascript    _editor = document.querySelectorAll("div.CodeMirror")[0].CodeMirror;    _editor.setValue("Value for Key1122")
    Sleep    5s
    Capture Page Screenshot
    Click element    xpath=//*[@id="webide"]/main/section/section/section[2]/form[1]/header/button
    sleep    6s
    Capture Page Screenshot

TC13_Delete_CrossReferenceKey
    [Documentation]    Check user can delete Cross reference key on UI
    Open Browser    https://stage.youredi.com/    chrome
    Input Text    id=email    komal@youredi.com
    Input Password    id=password    $RJvT&Zd*Zzx0tW&R3r32$Pw
    Click Element    class=fa-sign-in
    Sleep    6s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    7s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Click Element    class=fa-table
    Sleep    6s
    Capture Page screenshot
    Click Element    xpath=//*[@id="webide"]/main/section/section/section[2]/form[1]/header/div/button/i
    Sleep    6s
    Capture Page Screenshot
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]
    Sleep     6s
    Capture Page Screenshot
    Click element    xpath=//*[@id="webide"]/main/section/section/section[1]/header/button[2]
    sleep    6s
    Capture Page Screenshot

TC14_Delete_Counter
    [Documentation]    Check user can delete Counter on UI
    Open Browser    https://stage.youredi.com/    chrome
    Input Text    id=email    komal@youredi.com
    Input Password    id=password    $RJvT&Zd*Zzx0tW&R3r32$Pw
    Click Element    class=fa-sign-in
    Sleep    6s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    7s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Click Element    class=fa-calculator
    Sleep    6s
    Capture Page screenshot
    Click Element    xpath=//*[@id="webide"]/main/section/section/section/table/tbody/tr/td[3]/div/button/i
    Sleep    6s
    Capture Page Screenshot
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]/i
    Sleep     6s
    Capture Page Screenshot

TC17_Search_Counter
    [Documentation]    Check user can search Counter on UI
    Open Browser    https://stage.youredi.com/    chrome
    Input Text    id=email    komal@youredi.com
    Input Password    id=password    $RJvT&Zd*Zzx0tW&R3r32$Pw
    Click Element    class=fa-sign-in
    Sleep    6s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    7s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Click Element    class=fa-calculator
    Sleep    6s
    Capture Page screenshot
    Input text    name=filterName    Counter3
    Click element    xpath=//*[@id="webide"]/main/section/section/form/header/div[2]/button/i
    Sleep    6s
    Capture Page Screenshot
    Page should contain Element    class=fa-remove

TC18_Add and Delete Extension
    [Documentation]    Check user can search Counter on UI
    Open Browser    https://stage.youredi.com/    chrome
    Input Text    id=email    komal@youredi.com
    Input Password    id=password    $RJvT&Zd*Zzx0tW&R3r32$Pw
    Click Element    class=fa-sign-in
    Sleep    6s
    Click element    xpath= //*[@id="webide"]/main/section/section/div/div[1]/div/p/a[1]/i
    Sleep    7s
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div/p/a[1]/i
    Click Element    xpath=//*[@id="webide"]/main/section/section/div/div[1]/div[2]/div[1]/div[1]/p/a[2]
    Click Element    class=fa-plug
    Sleep    6s
    Capture Page screenshot
    Click Element    xpath=//*[@id="webide"]/main/section/section/section/header/button[1]/i
    Sleep    6s
    Input Text    name=extension.Name    Ext2
    Sleep     6s
    Capture Page Screenshot
    Click Element    xpath=//*[@id="webide"]/main/section/section/form/header/button[1]
    sleep     6s
    Capture Page Screenshot
    click element    xpath=//*[@id="webide"]/main/section/section/form/header/div/button/i
    Sleep    6s
    Click Element    xpath=//*[@id="webide"]/div[4]/form/div/div[3]/span/button[1]/i
    Sleep    6s
    Capture Page screenshot
